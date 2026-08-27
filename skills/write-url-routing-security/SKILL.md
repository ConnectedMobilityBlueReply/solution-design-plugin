---
name: write-url-routing-security
description: Usare questa skill quando l'utente chiede di "scrivere URL routing e sicurezza", "compilare URL-Routing-e-Sicurezza", "documentare VIP, APM, LTM della SD", "fare il diagramma di routing", "censire i puntamenti e i certificati JWT del solution design", oppure in inglese "write URL routing and security", "routing and security diagram", "document VIP APM LTM", "JWT certificates and endpoints of the SD", o quando l'orchestratore write-solution-design arriva alla sezione URL Routing e Sicurezza. Genera la pagina wiki URL-Routing-e-Sicurezza.md dal template Unipol.
---

# Sezione: URL Routing e Sicurezza

Generare la pagina `URL-Routing-e-Sicurezza.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Diagramma di Routing e Sicurezza

Dettaglia il routing delle interazioni tecniche: contesti web, componenti infrastrutturali e perimetrali (proxy, reverse proxy, VIP F5, DataPower, API Connect), reti attraversate (VPN/Internet), runtime applicativi e infrastrutturali (Application Server / Web Server / Container). Convenzioni in `references/plantuml-conventions.md`, sezione "Diagramma di Routing e Sicurezza": hostname in DarkRed sotto i nodi, path instradati come etichette delle frecce.

Intervistare l'utente partendo dal Diagramma di Contesto Tecnico già prodotto: per ogni catena di chiamata chiedere VIP/hostname di ingresso, path pubblicati e destinazioni di backend, proponendo i pattern UniSalute tipici (VIP F5 → bilanciatore → Drakkar/WAS; DataPower per inbound/outbound verso partner).

## Sezione Sicurezza (struttura dello skeleton del template)

- **Virtual Server (VIP)** — compilare **solo** se la soluzione usa F5 come componente di frontiera (chiederlo). Elencare per ogni ambiente i virtual server definiti (dev/sit/pp/prod), proponendo la convenzione hostname UniSalute (`<app>-dev.servizi.gr-u.it`, ..., `<app>.ha.servizi.gr-u.it` in produzione).
- **Access Policy Manager (APM)** — policy di accesso sui VIP: controlli di autenticazione/autorizzazione e propagazione dei contesti di sicurezza. Includere il sequence diagram dello scenario di accesso (Client/Browser → F5 → STS → Backend con MRHSession e token JWT) adattato al caso concreto, più il dettaglio delle configurazioni per path (`/`, `/api`).
- **Local Traffic Management (LTM)** — policy di gestione del traffico: endpoint di ingresso, server di backend, logiche di routing. Comprende:
  - **Routing rules**: tabella Path | Destinazione | Security F5 | Security Applicativa | Security IBM API GW
  - **Matrice Ambienti**: tabella Ambiente | VIP | Esposto su Internet | destinazioni Drakkar per path
- **Certificati per validazione JWT** — tabella VIP F5 | Certificato per ambiente (DEV/INTEGRATION/STAGE/PROD); i certificati STS stanno nella repo `datapower/support` (chiedere i link o `_TODO: da completare_`).

## Elenco puntamenti

Tabella Sistema | Descrizione | Ambiente | Endpoint | Remote Endpoint | Swagger | Note per tutti i componenti della soluzione. Riusare i componenti da `.sd-state.md`; per gli endpoint non ancora noti usare `_TODO: da completare_` (la sezione Puntamenti-per-Ambienti, se inclusa, approfondirà per ambiente).
