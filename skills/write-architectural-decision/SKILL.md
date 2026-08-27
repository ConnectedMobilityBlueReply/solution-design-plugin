---
name: write-architectural-decision
description: Usare questa skill quando l'utente chiede di "scrivere le decisioni architetturali", "creare una ADR", "compilare Decisioni-Architetturali", "documentare una decisione architetturale della SD", "aggiungere una ADR al solution design", oppure in inglese "write architectural decisions", "create an ADR", "add an ADR", "architecture decision record", "document an architectural decision", o quando l'orchestratore write-solution-design arriva alla sezione Decisioni Architetturali. Genera la pagina indice Decisioni-Architetturali.md e una pagina figlia per ogni ADR.
---

# Sezione: Decisioni Architetturali (ADR)

Generare la **struttura multi-pagina** delle ADR. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagine, aggiornamento `.sd-state.md`).

## Struttura multi-pagina

- **Pagina indice** `Decisioni-Architetturali.md`: tabella ID | Argomento | Status, con l'ID linkato alla pagina figlia (link relativo wiki `[ADR01](Decisioni-Architetturali/ADR01)`). Status: APERTA (in analisi), CHIUSA (formalizzata), DEPRECATA (obsoleta).
- **Una pagina figlia per ogni ADR** in `Decisioni-Architetturali/ADRXX.md` (numerazione progressiva ADR01, ADR02, ...), con le sezioni dello skeleton del template: Descrizione, Issue/Problema, Assunzioni & Vincoli (Assunti A1..., Vincoli V1...), Decisione Presa, Decisione Presa da, Razionali Decisione Presa, Conseguenze Decisione Presa, Alternative (con pro `:white_check_mark:` e contro `:x:` per ciascuna).

Se si aggiorna una SD esistente: leggere l'indice, individuare il prossimo numero ADR libero e appendere la riga senza toccare le ADR esistenti.

## Quali decisioni censire

Dal template: decisioni **critiche, rischiose o ad alto costo**, con effetti a lunga durata, non convenzionali, che influenzano la qualità o molti stakeholder. Devono esistere più possibilità tra cui scegliere — altrimenti sono vincoli e vanno in Requisiti ed Obiettivi. Proporre candidati ADR a partire dalle decisioni emerse nell'intervista e registrate in `.sd-state.md` (scelte tecnologiche, sync vs async, buy vs build, pattern di integrazione).

## Intervista per singola ADR

Per ogni decisione, una domanda alla volta:

1. Qual è il problema/issue da risolvere?
2. Quali assunti e vincoli delimitano la scelta?
3. Quali alternative sono sul tavolo? **Proporre attivamente alternative con trade-off** (pro/contro) basate sulle pratiche UniSalute e sugli esempi reali, se l'utente non le ha già considerate.
4. Quale decisione è stata presa (o è ancora APERTA?) e da chi?
5. Razionali e conseguenze: perché questa alternativa ha vinto e cosa comporta.

Facoltativo (dal blocco Tips del template): per decisioni complesse proporre la tabella dei criteri pesati (ID | Criterio | Importanza/Peso).

Gli stakeholder devono poter **ripercorrere** la scelta: i razionali non sono opzionali — se l'utente non li sa esplicitare, aiutarlo a ricostruirli, altrimenti `_TODO: da completare_`.
