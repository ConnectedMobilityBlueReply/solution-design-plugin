---
name: write-requirements
description: Usare questa skill quando l'utente chiede di "scrivere i requisiti e obiettivi", "compilare Requisiti-ed-Obiettivi", "documentare requisiti funzionali e non funzionali della SD", "fare il diagramma di contesto business", "censire stakeholder e vincoli del solution design", oppure in inglese "write requirements and objectives", "document functional and non-functional requirements", "business context diagram", "capture SD stakeholders and constraints", o quando l'orchestratore write-solution-design arriva alla sezione Requisiti ed Obiettivi. Genera la pagina wiki Requisiti-ed-Obiettivi.md dal template Unipol.
---

# Sezione: Requisiti ed Obiettivi

Generare la pagina `Requisiti-ed-Obiettivi.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

Perimetro (dal template): requisiti rilevanti per il **solutioning**, non l'analisi funzionale di dettaglio. Documentare pochi casi d'uso e feature: quelli architetturalmente significativi.

## Blocchi da produrre (nell'ordine dello skeleton del template)

### Obiettivi di Business + Diagramma di Contesto Business

Chiedere gli obiettivi di business in forma concisa (max una pagina). Poi costruire il **Diagramma di Contesto Business** in PlantUML (convenzioni in `references/plantuml-conventions.md`, sezione dedicata): sistema come black box, attori e partner con i flussi di dominio scambiati. Spiegare all'utente cosa rappresenta il diagramma mentre lo si scrive.

### Requisiti Funzionali

- **Lista dei requisiti funzionali**: elenco numerato `[FR1]`, `[FR2]`, ... (o identificativi esterni se esiste già un documento requisiti, es. BRD — in tal caso citare il documento e mantenere la corrispondenza dei codici). Per ogni requisito chiedere dettagli e far emergere gli impatti architetturali (es. "invio SMS dal pannello" → integrazione con sistema SMS).
- **Lista degli Use-Cases**: una tabella per use case con Codice, Descrizione breve, Precondizioni, Attori, Flusso di eventi, Postcondizioni. Proporre gli use case a partire dai requisiti raccolti; farli confermare.

### Requisiti Non Funzionali

Tabella `CATEGORIA` | `NFR` con identificativi `NFR1`, `NFR2`, ... Per ogni NFR chiedere scenario e metrica. Proporre proattivamente le categorie tipiche: Time Behaviour (tempi di risposta/throughput), Resource Utilization, Capacity (volumi, carichi non noti a priori), Availability/disponibilità, Security, Modularity (mastership dei dati), Reusability. Riferimento: principi della Reference Architecture Unipol (link presente nel template).

### Vincoli

Elenco numerato `[V1]`, `[V2]`, ... di vincoli tecnici e organizzativi che restringono la libertà di design (infrastrutture imposte, framework aziendali come EAI4U/JS4U, composizione team, ecc.). Valutare e rappresentare sempre le **conseguenze** dei vincoli che possono portare a costi/effort extra.

### Stakeholders

Tabella Nome | Ruolo | Contatto | Aspettative. Proporre i ruoli tipici (solution architect, lead sviluppo, security architect, legale, referente business) e chiedere nomi e aspettative; per i contatti non noti usare `_TODO: da completare_`.
