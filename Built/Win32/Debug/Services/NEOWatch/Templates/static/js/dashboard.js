
window.NEOWatchPagination = (function () {
    let currentPage = 1;
    let pageSize = 5;

    function getItems() {
        return Array.from(document.querySelectorAll('#asteroidList .asteroid-page-item'));
    }

    function getTotalPages(items) {
        if (!items.length) {
            return 1;
        }

        return Math.max(1, Math.ceil(items.length / pageSize));
    }

    function updateVisibleRange(items) {
        const range = document.getElementById('asteroidVisibleRange');

        if (!range) {
            return;
        }

        if (!items.length) {
            range.textContent = 'No objects';
            return;
        }

        const start = ((currentPage - 1) * pageSize) + 1;
        const end = Math.min(currentPage * pageSize, items.length);

        range.textContent = `${start}-${end} of ${items.length} objects`;
    }

    function renderPageButtons(totalPages) {
        const container = document.getElementById('asteroidPaginationPages');

        if (!container) {
            return;
        }

        container.innerHTML = '';

        for (let index = 1; index <= totalPages; index++) {
            const button = document.createElement('button');

            button.type = 'button';
            button.className = 'pagination-page-btn' + (index === currentPage ? ' active' : '');
            button.textContent = index;

            button.addEventListener('click', function () {
                currentPage = index;
                render();
            });

            container.appendChild(button);
        }
    }

    function render() {
        const items = getItems();

        if (!items.length) {
            return;
        }

        const totalPages = getTotalPages(items);

        if (currentPage > totalPages) {
            currentPage = totalPages;
        }

        if (currentPage < 1) {
            currentPage = 1;
        }

        items.forEach(function (item, index) {
            const startIndex = (currentPage - 1) * pageSize;
            const endIndex = startIndex + pageSize;

            if (index >= startIndex && index < endIndex) {
                item.classList.remove('is-hidden');
            } else {
                item.classList.add('is-hidden');
            }
        });

        updateVisibleRange(items);
        renderPageButtons(totalPages);
    }

    function initialize() {
        currentPage = 1;

        const pageSizeSelect = document.getElementById('asteroidPageSize');

        if (pageSizeSelect) {
            pageSize = parseInt(pageSizeSelect.value || '5', 10);
        }

        render();
    }

    function changePageSize(value) {
        pageSize = parseInt(value || '5', 10);
        currentPage = 1;
        render();
    }

    function nextPage() {
        const items = getItems();
        const totalPages = getTotalPages(items);

        if (currentPage < totalPages) {
            currentPage++;
            render();
        }
    }

    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            render();
        }
    }

    return {
        initialize: initialize,
        changePageSize: changePageSize,
        nextPage: nextPage,
        previousPage: previousPage
    };
})();

document.addEventListener('DOMContentLoaded', function () {
    window.NEOWatchPagination.initialize();
});

document.body.addEventListener('htmx:afterSwap', function (event) {
    if (event.detail && event.detail.target && event.detail.target.id === 'monitoringContainer') {
        window.NEOWatchPagination.initialize();
    }
});


window.NEOWatchSelection = (function () {
    function setText(id, value) {
        const element = document.getElementById(id);

        if (element) {
            element.textContent = value;
        }
    }

    function setRiskBadge(id, riskClass, riskLabel) {
        const element = document.getElementById(id);

        if (!element) {
            return;
        }

        element.className = riskClass || 'risk-badge risk-safe';
        element.innerHTML = '<i class="fa-solid fa-circle"></i> ' + (riskLabel || 'Unknown');
    }

    function selectCard(button) {
        document.querySelectorAll('.asteroid-card').forEach(function (card) {
            card.classList.remove('selected');
        });

        const card = button.closest('.asteroid-card');

        if (card) {
            card.classList.add('selected');
        }
    }

    function parseNumber(value) {
        if (!value) {
            return 0;
        }

        return Number(
            String(value)
                .replace(/[^\d,.-]/g, '')
                .replace(/\./g, '')
                .replace(',', '.')
        ) || 0;
    }

    function getDistanceClass(distanceText) {
        const distance = parseNumber(distanceText);

        if (distance <= 7500000) {
            return 'Close range';
        }

        if (distance <= 20000000) {
            return 'Medium range';
        }

        return 'Long range';
    }

    function getVelocityClass(velocityText) {
        const velocity = parseNumber(velocityText);

        if (velocity >= 70000) {
            return 'High speed';
        }

        if (velocity >= 35000) {
            return 'Medium speed';
        }

        return 'Low speed';
    }

    function getRiskProfile(riskLabel) {
        const label = (riskLabel || '').toLowerCase();

        if (label.includes('danger') || label.includes('hazard')) {
            return 'Potential threat';
        }

        return 'Safe object';
    }

    function parseNumericData(value) {
        if (!value) {
            return 0;
        }

        return Number(
            String(value)
                .replace(/[^\d,.-]/g, '')
                .replace(/\./g, '')
                .replace(',', '.')
        ) || 0;
    }

    function getAsteroidSizeClassFromKm(diameterMinKm, diameterMaxKm) {
        const min = parseNumericData(diameterMinKm);
        const max = parseNumericData(diameterMaxKm);
        const averageMeters = ((min + max) / 2) * 1000;

        if (averageMeters >= 500) {
            return 'asteroid-size-large';
        }

        if (averageMeters >= 100) {
            return 'asteroid-size-medium';
        }

        return 'asteroid-size-small';
    }

    function getAsteroidSpeedClassFromKmH(velocityKmH) {
        const velocity = parseNumericData(velocityKmH);

        if (velocity >= 70000) {
            return 'asteroid-speed-high';
        }

        if (velocity >= 35000) {
            return 'asteroid-speed-medium';
        }

        return 'asteroid-speed-low';
    }

    function getAsteroidDistanceClassFromKm(distanceKm) {
        const distance = parseNumericData(distanceKm);

        if (distance <= 7500000) {
            return 'asteroid-distance-close';
        }

        if (distance <= 20000000) {
            return 'asteroid-distance-medium';
        }

        return 'asteroid-distance-long';
    }

    function getAsteroidFormClass(id) {
        const value = parseInt(String(id || '0').replace(/\D/g, ''), 10) || 0;
        const formIndex = value % 4;

        if (formIndex === 0) {
            return 'asteroid-form-a';
        }

        if (formIndex === 1) {
            return 'asteroid-form-b';
        }

        if (formIndex === 2) {
            return 'asteroid-form-c';
        }

        return 'asteroid-form-d';
    }

    function updateMainAsteroidVisual(button) {
        const asteroid = document.getElementById('mainAsteroidVisual');

        if (!asteroid) {
            return;
        }

        const id = button.dataset.id || '';
        const hazardousText = String(button.dataset.hazardous || '').toLowerCase();
        const hazardous =
            hazardousText === 'true' ||
            hazardousText === '1' ||
            hazardousText === 'yes' ||
            hazardousText === 'sì';

        const riskClass = hazardous ? 'asteroid-shape-dangerous' : 'asteroid-shape-safe';
        const sizeClass = getAsteroidSizeClassFromKm(button.dataset.diameterMin, button.dataset.diameterMax);
        const speedClass = getAsteroidSpeedClassFromKmH(button.dataset.velocityValue);
        const distanceClass = getAsteroidDistanceClassFromKm(button.dataset.distanceValue);
        const formClass = getAsteroidFormClass(id);

        asteroid.className =
            'cinematic-asteroid ' +
            riskClass + ' ' +
            sizeClass + ' ' +
            speedClass + ' ' +
            distanceClass + ' ' +
            formClass;

        console.log('ASTEROID VISUAL UPDATED', {
            id: id,
            hazardous: hazardous,
            distanceValue: button.dataset.distanceValue,
            velocityValue: button.dataset.velocityValue,
            diameterMin: button.dataset.diameterMin,
            diameterMax: button.dataset.diameterMax,
            className: asteroid.className
        });
    }

    function updateFromButton(button) {
        const id = button.dataset.id || '';
        const name = button.dataset.name || '--';
        const distance = button.dataset.distance || '-- km';
        const velocity = button.dataset.velocity || '-- km/h';
        const riskClass = button.dataset.riskClass || 'risk-badge risk-safe';
        const riskLabel = button.dataset.riskLabel || 'Unknown';
        const sizeClass = button.dataset.sizeClass || '--';

        selectCard(button);

        setRiskBadge('activeRisk', riskClass, riskLabel);
        setText('activeObject', name);
        setText('activeObjectId', 'NASA object ID: ' + id);

        setRiskBadge('visualRisk', riskClass, riskLabel);
        setText('visualName', name);
        setText(
            'visualDescription',
            'Selected NASA NEO Dashboard object. The panel translates raw values into a mission-style risk profile.'
        );

        setText('visualRiskProfile', getRiskProfile(riskLabel));
        setText('visualDistanceClass', getDistanceClass(distance));
        setText('visualVelocityClass', getVelocityClass(velocity));
        setText('visualSizeClass', sizeClass);
        setText('visualVelocity', velocity);

        updateMainAsteroidVisual(button);
    }

    return {
        updateFromButton: updateFromButton
    };
})();

window.NEOWatchFilterValidation = (function () {
    function parseDateInput(value) {
        if (!value) {
            return null;
        }

        const parts = value.split('-');

        if (parts.length !== 3) {
            return null;
        }

        const year = parseInt(parts[0], 10);
        const month = parseInt(parts[1], 10) - 1;
        const day = parseInt(parts[2], 10);

        return new Date(year, month, day);
    }

    function getInclusiveDays(startDate, endDate) {
        const oneDay = 24 * 60 * 60 * 1000;
        const start = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate());
        const end = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate());

        return Math.floor((end - start) / oneDay) + 1;
    }

    function getChunkCount(days) {
        return Math.ceil(days / 7);
    }

    function handleSubmit(event) {
        const form = event.target;

        if (!form || form.id !== 'asteroidFilters') {
            return;
        }

        if (form.dataset.skipSwalValidation === 'true') {
            delete form.dataset.skipSwalValidation;
            return;
        }

        const startInput = document.getElementById('startDate');
        const endInput = document.getElementById('endDate');

        const startValue = startInput ? startInput.value : '';
        const endValue = endInput ? endInput.value : '';

        const startDate = parseDateInput(startValue);
        const endDate = parseDateInput(endValue);

        if (!startDate || !endDate) {
            event.preventDefault();

            Swal.fire({
                icon: 'warning',
                title: 'Date required',
                text: 'Please select both start date and end date before searching.',
                confirmButtonText: 'Ok'
            });

            return;
        }

        if (startDate > endDate) {
            event.preventDefault();

            Swal.fire({
                icon: 'error',
                title: 'Invalid date range',
                html: `
            <div class="text-start">
              <p class="mb-2">The start date cannot be greater than the end date.</p>
              <p class="mb-0">
                <strong>Start date:</strong> ${startValue}<br>
                <strong>End date:</strong> ${endValue}
              </p>
            </div>
          `,
                confirmButtonText: 'Change dates'
            });

            return;
        }

        const days = getInclusiveDays(startDate, endDate);

        if (days > 7) {
            event.preventDefault();

            const chunks = getChunkCount(days);

            Swal.fire({
                icon: 'info',
                title: 'Long date range',
                html: `
            <div class="text-start">
              <p class="mb-2">
                NASA NeoWs accepts a maximum of <strong>7 days per request</strong>.
              </p>
              <p class="mb-2">
                Your selected range contains <strong>${days} days</strong>.
              </p>
              <p class="mb-0">
                The backend will automatically split it into
                <strong>${chunks} cached chunks</strong>, aggregate the results and return one response to the dashboard.
              </p>
            </div>
          `,
                showCancelButton: true,
                confirmButtonText: 'Continue search',
                cancelButtonText: 'Change dates',
                reverseButtons: true
            }).then(function (result) {
                if (!result.isConfirmed) {
                    return;
                }

                form.dataset.skipSwalValidation = 'true';

                if (window.htmx) {
                    htmx.trigger(form, 'submit');
                } else {
                    form.requestSubmit();
                }
            });
        }
    }

    function initialize() {
        document.body.addEventListener('submit', handleSubmit, true);
    }

    return {
        initialize: initialize
    };
})();

document.addEventListener('DOMContentLoaded', function () {
    window.NEOWatchFilterValidation.initialize();
});

window.NEOWatchCharts = (function () {
    let charts = [];

    function destroyCharts() {
        charts.forEach(function (chart) {
            if (chart) {
                chart.destroy();
            }
        });

        charts = [];
    }

    function setChartsEmptyState(visible) {
        const emptyState = document.getElementById('chartsEmptyState');

        if (!emptyState) {
            return;
        }

        if (visible) {
            emptyState.classList.remove('d-none');
        } else {
            emptyState.classList.add('d-none');
        }
    }

    function readData() {
        const element = document.getElementById('asteroidChartData');

        if (!element) {
            console.warn('Missing asteroidChartData element.');
            return [];
        }

        const raw = element.textContent || '[]';

        try {
            const data = JSON.parse(raw).filter(function (item) {
                return item && item.name;
            });

            return data;
        } catch (error) {
            console.error('Invalid asteroid chart data:', error);
            console.log('Raw asteroidChartData:', raw);
            return [];
        }
    }

    function colors() {
        return {
            blue: 'rgba(129, 124, 216, .92)',
            blueSoft: 'rgba(129, 124, 216, .26)',
            cyan: 'rgba(110, 231, 255, .92)',
            green: 'rgba(74, 222, 128, .88)',
            greenSoft: 'rgba(74, 222, 128, .18)',
            red: 'rgba(239, 68, 68, .88)',
            orange: 'rgba(245, 158, 11, .88)',
            grid: 'rgba(255,255,255,.20)',
            gridSoft: 'rgba(255,255,255,.08)',
            label: '#dbeafe'
        };
    }

    function compact(value) {
        return new Intl.NumberFormat('en-US', {
            notation: 'compact',
            maximumFractionDigits: 1
        }).format(value);
    }

    function baseOptions() {
        const c = colors();

        return {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    labels: {
                        color: c.label,
                        usePointStyle: true,
                        boxWidth: 8
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(3,7,18,.96)',
                    borderColor: 'rgba(110,231,255,.25)',
                    borderWidth: 1,
                    titleColor: '#fff',
                    bodyColor: c.label
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: c.label,
                        maxRotation: 0
                    },
                    grid: {
                        color: c.gridSoft
                    }
                },
                y: {
                    ticks: {
                        color: c.label,
                        callback: function (value) {
                            return compact(value);
                        }
                    },
                    grid: {
                        color: c.grid
                    }
                }
            }
        };
    }

    function createChart(canvasId, config) {
        const canvas = document.getElementById(canvasId);

        if (!canvas) {
            return;
        }

        charts.push(new Chart(canvas, config));
    }

    function renderDistanceChart(data) {
        const c = colors();

        const top = data
            .slice()
            .sort(function (a, b) { return a.distance - b.distance; })
            .slice(0, 8);

        createChart('distanceChart', {
            type: 'line',
            data: {
                labels: top.map(function (x) { return x.name; }),
                datasets: [
                    {
                        label: 'Distance',
                        data: top.map(function (x) { return x.distance; }),
                        borderColor: c.blue,
                        backgroundColor: c.blueSoft,
                        pointBackgroundColor: c.blue,
                        pointBorderColor: '#050816',
                        pointRadius: 4,
                        tension: .38,
                        fill: true,
                        borderWidth: 2
                    }
                ]
            },
            options: baseOptions()
        });
    }

    function renderDiameterChart(data) {
        const c = colors();

        const top = data
            .slice()
            .sort(function (a, b) { return b.diameter - a.diameter; })
            .slice(0, 8);

        createChart('diameterChart', {
            type: 'bar',
            data: {
                labels: top.map(function (x) { return x.name; }),
                datasets: [{
                    label: 'Diameter',
                    data: top.map(function (x) { return x.diameter; }),
                    backgroundColor: top.map(function (x) {
                        return x.hazardous ? c.red : c.blue;
                    }),
                    borderColor: top.map(function (x) {
                        return x.hazardous ? c.red : c.cyan;
                    }),
                    borderWidth: 1,
                    borderRadius: 8,
                    maxBarThickness: 42
                }]
            },
            options: baseOptions()
        });
    }

    function renderRiskChart(data) {
        const c = colors();

        const hazardous = data.filter(function (x) {
            return x.hazardous === true;
        }).length;

        const safe = data.length - hazardous;

        createChart('riskChart', {
            type: 'doughnut',
            data: {
                labels: ['Safe', 'Potentially hazardous'],
                datasets: [{
                    data: [safe, hazardous],
                    backgroundColor: [c.green, c.red],
                    borderColor: ['rgba(74,222,128,1)', 'rgba(239,68,68,1)'],
                    borderWidth: 1,
                    hoverOffset: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '66%',
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            color: c.label,
                            usePointStyle: true,
                            padding: 14
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(3,7,18,.96)',
                        borderColor: 'rgba(110,231,255,.25)',
                        borderWidth: 1,
                        titleColor: '#fff',
                        bodyColor: c.label
                    }
                }
            }
        });
    }

    function renderVelocityChart(data) {
        const c = colors();

        const top = data
            .slice()
            .sort(function (a, b) { return b.velocity - a.velocity; })
            .slice(0, 8);

        createChart('velocityChart', {
            type: 'line',
            data: {
                labels: top.map(function (x) { return x.name; }),
                datasets: [{
                    label: 'Velocity',
                    data: top.map(function (x) { return x.velocity; }),
                    borderColor: c.orange,
                    backgroundColor: 'rgba(245,158,11,.18)',
                    pointBackgroundColor: c.orange,
                    pointBorderColor: '#050816',
                    pointRadius: 5,
                    tension: .36,
                    fill: true,
                    borderWidth: 2
                }]
            },
            options: baseOptions()
        });
    }

    function renderScatterChart(data) {
        const c = colors();

        createChart('scatterChart', {
            type: 'scatter',
            data: {
                datasets: [{
                    label: 'Distance vs size',
                    data: data.map(function (x) {
                        return {
                            x: x.diameter,
                            y: x.distance
                        };
                    }),
                    backgroundColor: data.map(function (x) {
                        return x.hazardous ? c.red : c.blue;
                    }),
                    pointRadius: 6,
                    pointHoverRadius: 8
                }]
            },
            options: baseOptions()
        });
    }

    function renderHazardBarChart(data) {
        const c = colors();

        const top = data
            .slice()
            .sort(function (a, b) { return b.diameter - a.diameter; })
            .slice(0, 8);

        createChart('hazardBarChart', {
            type: 'bar',
            data: {
                labels: top.map(function (x) { return x.name; }),
                datasets: [{
                    label: 'Diameter',
                    data: top.map(function (x) { return x.diameter; }),
                    backgroundColor: top.map(function (x) {
                        return x.hazardous ? c.red : c.blue;
                    }),
                    borderRadius: 8,
                    maxBarThickness: 44
                }]
            },
            options: baseOptions()
        });
    }

    function render() {
        if (!window.Chart) {
            console.warn('Chart.js is not loaded.');
            setChartsEmptyState(true);
            return;
        }

        const data = readData();

        destroyCharts();

        if (!data.length) {
            setChartsEmptyState(true);
            console.warn('No real asteroid chart data available.');
            return;
        }

        setChartsEmptyState(false);

        renderDistanceChart(data);
        renderDiameterChart(data);
        renderRiskChart(data);
        renderVelocityChart(data);
        renderScatterChart(data);
        renderHazardBarChart(data);
    }

    return {
        render: render
    };
})();

document.addEventListener('DOMContentLoaded', function () {
    if (window.NEOWatchPagination) {
        window.NEOWatchPagination.initialize();
    }
});

document.body.addEventListener('shown.bs.tab', function (event) {
    if (event.target && event.target.id === 'charts-tab') {
        setTimeout(function () {
            window.NEOWatchCharts.render();
        }, 150);
    }
});

document.body.addEventListener('htmx:afterSwap', function (event) {
    if (event.detail && event.detail.target && event.detail.target.id === 'monitoringContainer') {
        if (window.NEOWatchPagination) {
            window.NEOWatchPagination.initialize();
        }

        setTimeout(function () {
            window.NEOWatchCharts.render();
        }, 150);
    }
});



window.NEOWatchCurrentAsteroidId = null;

document.body.addEventListener('htmx:beforeRequest', function (event) {
    const element = event.detail.elt;

    if (!element || !element.matches('[hx-get^="/asteroids/"]')) {
        return;
    }

    const asteroidId = element.dataset.id;

    if (asteroidId && window.NEOWatchCurrentAsteroidId === asteroidId) {
        event.preventDefault();
        return;
    }

    window.NEOWatchCurrentAsteroidId = asteroidId;
});