
## 1. Introduzione

**NEO Watch** è una web app progettata per esplorare e visualizzare dati reali sugli asteroidi vicini alla Terra, utilizzando la NASA NeoWs API.

L’obiettivo del progetto è trasformare dati grezzi provenienti dalla NASA in una dashboard leggibile, interattiva e utile, permettendo all’utente di consultare asteroidi per range di date, filtrarli, ordinarli, visualizzare grafici e analizzare il dettaglio di un singolo oggetto.

Il progetto nasce come risposta alla challenge **NASA NEO Dashboard**, che richiede la realizzazione di una dashboard completa con backend proxy, caching, gestione dei limiti API, frontend interattivo e deploy online.



## 2. Obiettivo del progetto

L’obiettivo principale è realizzare una dashboard web che permetta all’utente di:
- selezionare un range di date
- visualizzare gli asteroidi vicini alla Terra
- filtrare gli asteroidi potenzialmente pericolosi
- ordinare i risultati per distanza o dimensione
- visualizzare grafici riepilogativi
- consultare una scheda dettaglio per ogni asteroide

La web app non comunica direttamente con la NASA dal browser. Tutte le richieste passano attraverso un backend proprietario, che si occupa di sicurezza, caching, validazione e normalizzazione dei dati.


## 3. Scelte tecnologiche

Per questo progetto è stato scelto uno stack alternativo rispetto a quello consigliato dalla challenge.

Backend: Delphi
Frontend: HTMX
Architettura: Clean Architecture + MVC
Grafici: Chart.js oppure ECharts
Deploy: Docker su servizio cloud

La challenge consente l’utilizzo di tecnologie diverse da quelle consigliate, purché il progetto rimanga solido, completo e raccontabile.


## 4. Motivazione delle scelte

### Backend Delphi

Delphi viene scelto per realizzare un backend compilato, tipizzato e performante.  
Il backend sarà responsabile della comunicazione con la NASA API, della gestione della cache, della validazione delle date e della preparazione dei dati per il frontend.

### Frontend HTMX

HTMX viene scelto per realizzare una web app server-driven, riducendo la complessità tipica di una SPA.

Con HTMX, il frontend può aggiornare dinamicamente parti della pagina, come tabella, filtri e dettaglio asteroide, senza dover costruire un’applicazione React completa.

### Clean Architecture

La Clean Architecture viene utilizzata per separare le responsabilità del progetto:

- Domain: entità principali e regole di dominio
- Application: casi d’uso e logica applicativa
- Infrastructure: NASA API, cache, configurazione
- Presentation: controller, view, partial HTMX

### MVC

Il pattern MVC viene applicato nello strato Presentation:

Model: ViewModel e DTO usati dalle viste
View: template HTML e partial HTMX
Controller: endpoint HTTP che ricevono richieste e invocano i casi d’uso


## 5. Architettura generale

Il flusso principale dell’applicazione sarà:

Utente
  ↓
Browser con HTMX
  ↓
Backend Delphi
  ↓
NASA NeoWs API



Il browser non chiamerà mai direttamente la NASA API.  
Il backend Delphi agirà come proxy intelligente tra l’utente e la NASA.

Questo approccio permette di:

- proteggere la NASA API key
- ridurre il numero di richieste esterne
- gestire il rate limit
- normalizzare i dati
- centralizzare la gestione degli errori


## 6. Funzionalità previste

La web app prevede le seguenti funzionalità principali.

### Ricerca per range di date

L’utente potrà scegliere una data di inizio e una data di fine.  
Il backend riceverà il range e recupererà gli asteroidi relativi a quel periodo.

### Gestione range superiori a 7 giorni

La NASA NeoWs API accetta al massimo 7 giorni per singola chiamata.  
Per questo motivo, il backend dividerà automaticamente i range più lunghi in blocchi da massimo 7 giorni.

Esempio:

Range richiesto:
01/05/2026 - 20/05/2026

Chunk generati:
01/05/2026 - 07/05/2026
08/05/2026 - 14/05/2026
15/05/2026 - 20/05/2026

I risultati dei singoli chunk verranno poi aggregati in una sola risposta.

### Lista asteroidi

Per ogni asteroide verranno mostrati:
- nome
- distanza minima in km
- diametro stimato minimo e massimo
- velocità relativa
- classificazione di pericolosità


### Filtri e ordinamento

L’utente potrà filtrare i risultati per:
- tutti gli asteroidi
- solo asteroidi potenzialmente pericolosi
- solo asteroidi non pericolosi


Inoltre potrà ordinare i risultati per:

- distanza minima dalla Terra
- dimensione stimata


### Grafici

Saranno presenti almeno due grafici:
1. distanza di avvicinamento nel tempo
2. distribuzione delle dimensioni degli asteroidi


I grafici permetteranno di rendere più comprensibili i dati NASA, trasformando dati grezzi in informazioni visuali.

### Scheda dettaglio asteroide

Cliccando su un asteroide, l’utente potrà visualizzare una scheda di dettaglio con informazioni più complete, tra cui:

- ID NASA
- nome
- link alla pagina NASA/JPL
- dati orbitali
- close approach storici
- diametro stimato
- classificazione di pericolosità


## 7. Caching

Il backend implementerà un sistema di caching lato server.

Lo scopo della cache è evitare chiamate ripetute alla NASA API per gli stessi dati, riducendo il rischio di raggiungere il rate limit.

Esempio:
Prima richiesta:
01/05/2026 - 07/05/2026
→ chiamata alla NASA
→ salvataggio in cache

Seconda richiesta identica:
01/05/2026 - 07/05/2026
→ lettura dalla cache
→ nessuna chiamata alla NASA



Nella prima versione del progetto verrà utilizzata una cache file-based.  
Ogni risposta NASA verrà salvata come file JSON identificato dal tipo di richiesta e dal range di date.

Esempio:
cache/
├── feed_2026-05-01_2026-05-07.json
├── feed_2026-05-08_2026-05-14.json
└── neo_3542519.json



## 8. Gestione errori ed edge case

La web app dovrà gestire in modo chiaro diversi scenari:

- caricamento dati in corso
- range di date non valido
- data iniziale successiva alla data finale
- errore della NASA API
- rate limit raggiunto
- nessun asteroide trovato
- backend non disponibile


Per migliorare l’esperienza utente saranno usati messaggi chiari, loading state e partial HTMX dedicati agli errori.


## 9. Endpoint previsti

Gli endpoint principali previsti sono:

```
GET /
```

Mostra la dashboard principale.

```
GET /partials/asteroids
```

Restituisce la tabella aggiornata degli asteroidi, usata da HTMX.

Parametri previsti:

```
start_dateend_datehazardoussort_bysort_dir
```

```
GET /partials/asteroids/{id}
```

Restituisce il dettaglio di un singolo asteroide come partial HTML.

```
GET /api/asteroids
```

Restituisce gli asteroidi in formato JSON.

```
GET /api/asteroids/{id}
```

Restituisce il dettaglio asteroide in formato JSON.

```
GET /api/charts/asteroids
```

Restituisce i dati normalizzati per i grafici.


## 10. Conclusione

NEO Watch sarà una web app server-driven per l’esplorazione degli asteroidi vicini alla Terra tramite dati NASA reali.

La scelta di Delphi e HTMX permette di realizzare una soluzione diversa dallo stack consigliato, mantenendo comunque tutti i requisiti principali della challenge: backend proxy, caching, gestione dei range superiori a 7 giorni, filtri, grafici, dettaglio asteroide, gestione errori e deploy online.

L’obiettivo finale è ottenere un progetto completo, funzionante e pubblicato online, con una struttura chiara e un README in grado di raccontare le scelte tecniche effettuate.