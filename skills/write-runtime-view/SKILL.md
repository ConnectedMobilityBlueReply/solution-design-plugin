---
name: write-runtime-view
description: Usare questa skill quando l'utente chiede di "scrivere le viste di runtime", "compilare Viste-di-Runtime", "fare i diagrammi di sequenza della SD", "documentare gli scenari runtime del solution design", oppure in inglese "write the runtime views", "runtime view", "sequence diagrams for the SD", "document runtime scenarios", o quando l'orchestratore write-solution-design arriva alla sezione Viste di Runtime. Genera la pagina wiki Viste-di-Runtime.md dal template Unipol con un diagramma per caso d'uso.
---

# Sezione: Viste di Runtime

Generare la pagina `Viste-di-Runtime.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Selezione degli scenari

Proporre come punto di partenza gli Use Case censiti in `Requisiti-ed-Obiettivi.md` (o in `.sd-state.md`). Il criterio di scelta è la **rilevanza architetturale**: un sottoinsieme rappresentativo che copra i principali casi d'uso e feature, le interazioni su interfacce critiche, e il comportamento in caso di errore ed eccezioni. Chiedere conferma della lista scenari prima di disegnare.

## Un diagramma per caso d'uso

Per ogni scenario confermato produrre un blocco `## Caso d'Uso N` con un **Diagramma di Runtime** (sequence diagram PlantUML) costruito intervistando l'utente passo per passo sul flusso. Convenzioni complete in `references/plantuml-conventions.md`, sezione "Diagramma di Runtime"; in sintesi:

- `autonumber` sempre; `group`/`alt`/`opt` per contenere le dimensioni dei diagrammi.
- **Raggruppare i componenti con `box` in base al team-componente della tripletta Drakkar Unipol** (i team sono in `.sd-state.md`; convenzioni in `references/drakkar-triplet.md`).
- Mai un generico "FE": esplicitare il `participant "Browser"`.

Per ogni **componente** che compare nel diagramma raccogliere e documentare: nome (name esteso Drakkar), responsabilità, interfacce esposte, dipendenze verso altri componenti o servizi esterni. Per ogni **interazione** indicare: tipo (sincrona/asincrona), protocollo (REST, gRPC, WebSocket, ecc.), eventuali vincoli di sicurezza o autenticazione.

Mentre si scrive ogni diagramma, spiegare all'utente quale flusso si sta rappresentando (es. "sto disegnando il flusso di login: il Browser chiama F5, che valida la sessione e stacca il JWT verso il backend...").

## Scenari di errore

Per i casi d'uso critici chiedere esplicitamente il comportamento in caso di errore/indisponibilità dei sistemi coinvolti e rappresentarlo (blocco `alt` nel diagramma dello scenario o diagramma dedicato).
