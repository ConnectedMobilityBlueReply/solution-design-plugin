---
name: write-component-list
description: Usare questa skill quando l'utente chiede di "scrivere l'elenco dei componenti", "compilare Elenco-dei-Componenti", "censire i componenti della SD", "aggiornare la lista componenti del solution design", oppure in inglese "write the component list", "component list section", "update the SD component list", "register solution design components", o quando l'orchestratore write-solution-design arriva alla sezione Elenco dei Componenti. Genera la pagina wiki Elenco-dei-Componenti.md dal template Unipol.
---

# Sezione: Elenco dei Componenti

Generare la pagina `Elenco-dei-Componenti.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Specificità della sezione

Questa sezione è **in gran parte auto-compilata** dai dati dell'intervista dell'orchestratore presenti in `.sd-state.md` (componenti + triplette Drakkar + impatto progettuale). Chiedere solo ciò che manca, non ri-chiedere ciò che è già nello stato.

### Tabella Componenti

Compilare dalla tabella componenti di `.sd-state.md`. Per ogni componente completare i campi previsti dal template: Codice (tripletta con link al repository se esistente), Nome (name esteso Drakkar, vedere `references/drakkar-triplet.md`), Descrizione (responsabilità specifiche), Tipologia (es. java-runnable su POD OpenShift, js4u-app, java-library su NEXUS), Categoria Architetturale (CANALE/WEB/CORE/LIB/APP), Impatto Progettuale (nuovo / esistente / esistente con evolutive / in dismissione), Issue Creazione (numero issue su drakkar/support per i componenti nuovi; se non ancora aperta, `_TODO: da completare_`).

**Importante** (dal template): censire anche i componenti **extra Drakkar** — F5, database, OSB, OAM, servizi Core Delphi, code/topic — chiedendo all'utente se la soluzione li coinvolge.

### Applicazioni Coinvolte

Chiedere quali applicazioni (esistenti o da censire) sono coinvolte; compilare la tabella del template (Progressivo, Codice `team_applicazione`, Nome, Descrizione, Impatto Progettuale, Riferimenti). I codici definiti qui vengono referenziati dalla Matrice delle Integrazioni: mantenerli coerenti.

### Capacity Plan

Sezione opzionale: chiedere se è previsto un capacity plan diverso dallo standard. Se sì, ricordare che va richiesto con issue ad hoc su drakkar/support e riportare il link alla issue nella pagina; se no, lasciare la sezione con una riga che dichiara il capacity plan standard.
