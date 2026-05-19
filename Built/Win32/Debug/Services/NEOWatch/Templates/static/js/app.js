document.addEventListener('alpine:init', () => {
    Alpine.data('app', () => ({
        theme: "light",

        get iconClass() {
            return this.theme === 'dark' ? 'fa fa-sun' : 'fa fa-moon';
        },

        init() {
            this.initHtmxErrors();
            this.initTheme();
            this.initLoginModalFocus();
        },

        // --- Gestione errori HTMX ---
        initHtmxErrors() {
            window.addEventListener('htmx:responseError', (evt) => {
                evt.preventDefault();
                let xhr = evt.detail.xhr;
                this.showError(xhr);
            });
        },
        showError(xhr) {
            let msg = '';
            try {
                let json = JSON.parse(xhr.responseText);
                msg = json.error || '';
            } catch (e) {
                msg = xhr.responseText;
            }
            Swal.fire({
                title: 'Errore dal server',
                text: `Questa azione non può essere eseguita. ${xhr.status} - ${xhr.statusText} - ${msg}`,
                icon: 'error',
                theme: 'auto',
                confirmButtonText: 'Chiudi'
            });
        },

        // --- Focus automatico sul modale ---
        initLoginModalFocus() {
            const modalEl = this.$refs.loginModal;
            const inputEl = this.$refs.passwordInput;

            if (modalEl && inputEl) {
                modalEl.addEventListener('shown.bs.modal', () => {
                    inputEl.focus();
                    inputEl.value = "";
                });
            }
        },

        // --- Gestione tema chiaro/scuro ---
        initTheme() {
            const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
            this.theme = prefersDark ? 'dark' : 'light';
            this.applyTheme();
        },
        toggleTheme() {
            this.theme = this.theme === 'light' ? 'dark' : 'light';
            this.applyTheme();
        },
        applyTheme() {
            document.documentElement.setAttribute('data-bs-theme', this.theme);
        }
    }));
});