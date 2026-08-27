---
name: write-solution-strategy
description: Usare questa skill quando l'utente chiede di "scrivere la solution strategy", "compilare Solution-Strategy", "documentare le strategie di soluzione della SD", "riassumere le scelte fondamentali dell'architettura", oppure in inglese "write the solution strategy", "solution strategy section", "summarize the key architecture choices", o quando l'orchestratore write-solution-design propone la sezione facoltativa Solution Strategy. Genera la pagina wiki Solution-Strategy.md dal template Unipol.
---

# Sezione: Solution Strategy

Generare la pagina `Solution-Strategy.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Contenuto

Sommario tabellare delle scelte fondamentali che danno forma all'architettura: una riga per strategia con ID | Obiettivo | Scenario | Approccio di soluzione | Link dettagli.

Le strategie coprono (proporle attivamente come categorie durante l'intervista):

1. scelte tecnologiche
2. pattern architetturali o di design adottati
3. scelta di framework e relative linee guida (es. framework aziendali JS4U / EAI4U / JF4U)
4. come vengono soddisfatti i principali requisiti non funzionali (ripartire dagli NFR censiti in Requisiti ed Obiettivi)
5. decisioni rilevanti dell'organizzazione (processo di sviluppo, delega a terze parti)

## Regole di stile (dal template)

- Approcci descritti **per parole chiave**, brevi quanto possibile: overview, non dettaglio. I dettagli vivono altrove.
- Descrivere sempre i **razionali**: conta più il perché del cosa o del come.
- La colonna Link dettagli punta a: ADR collegate (`Decisioni-Architetturali/ADRXX`), Building Blocks, Viste di Runtime, issue o documentazione esterna raggiungibile da tutti gli stakeholder. Se il riferimento non esiste ancora, `_TODO: da completare_`.

Proporre le prime righe della tabella a partire dalle decisioni già registrate in `.sd-state.md` e dalle ADR esistenti, chiedendo conferma riga per riga.
