---
name: write-deployment-model
description: Usare questa skill quando l'utente chiede di "scrivere il deployment model", "compilare Deployment-Model", "fare il diagramma di deploy della SD", "documentare l'infrastruttura di deploy", "gestire la doppia filiera", oppure in inglese "write the deployment model", "deployment diagram", "document the deployment infrastructure", "dual pipeline deployment", o quando l'orchestratore write-solution-design propone la sezione facoltativa Deployment Model. Genera la pagina wiki Deployment-Model.md dal template Unipol.
---

# Sezione: Deployment Model

Generare la pagina `Deployment-Model.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Diagramma di Deploy

Costruire il **Diagramma di Deploy** in PlantUML (convenzioni in `references/plantuml-conventions.md`, sezione "Diagramma di Deploy"): livello logico del modello di deploy con infrastruttura (location geografiche, ambienti, macchine, canali e topologie di rete) e **mappatura dei building block sugli elementi infrastrutturali**. Spiegare all'utente cosa si sta rappresentando mentre si disegna.

Intervista guidata:

1. Dove gira ogni componente? Proporre i runtime UniSalute tipici in base alla tipologia già censita in `.sd-state.md` (java-runnable/js4u-app → POD OpenShift via Drakkar; batch → Farm Batch; componenti legacy → WAS/WebLogic; cloud → AWS).
2. Differenze di configurazione hardware/software tra ambienti: documentarle se esistono.
3. Razionali della scelta del modello di deploy e caratteristiche di qualità/performance dell'infrastruttura.
4. Task addizionali per portare il sistema in produzione (utenze e autorizzazioni, directory/ACL, database e utenze DB, migrazioni dati, middleware, firewall, certificati): elencare quelli applicabili, raccomandando l'automazione via script anziché l'esecuzione manuale.

## Doppia filiera manutentiva/evolutiva

Chiedere esplicitamente se il progetto sfrutta la doppia filiera. Se sì (caso descritto nel template): **censire un paragrafo dedicato** con la soluzione adottata per la gestione del deploy sulle due filiere e i relativi ambienti (DEV/DEV-EVO, SIT/SIT-EVO), rimandando alla pagina wiki di gestione ciclo di vita ambienti linkata nel template. Registrare il flag doppia filiera in `.sd-state.md`: serve anche a Mapping-Ambienti e Puntamenti-per-Ambienti.
