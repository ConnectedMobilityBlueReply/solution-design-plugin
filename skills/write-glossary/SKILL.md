---
name: write-glossary
description: Usare questa skill quando l'utente chiede di "scrivere il glossario", "compilare Glossario", "aggiungere termini al glossario della SD", "definire i termini di dominio del solution design", oppure in inglese "write the glossary", "glossary section", "add terms to the SD glossary", "define domain terms", o quando l'orchestratore write-solution-design propone la sezione facoltativa Glossario. Genera la pagina wiki Glossario.md dal template Unipol.
---

# Sezione: Glossario

Generare la pagina `Glossario.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`). Nota: questo template non ha la struttura a tre blocchi — usare la tabella a due colonne che contiene come skeleton.

## Contenuto

Tabella a due colonne Termine | Definizione con i termini **di dominio e tecnici** usati dagli stakeholder per parlare del sistema. Obiettivo: tutti gli stakeholder devono comprendere i termini in maniera chiara.

## Intervista

1. **Proporre una prima lista automatica** estratta dal lavoro già fatto: acronimi e termini ricorrenti in `.sd-state.md` e nelle pagine già generate (nomi di sistemi, protocolli, sigle tipo JWT, APIC, VIP, APM, LTM, STS, fasi di test usate in Mapping-Ambienti).
2. Far confermare/correggere le definizioni proposte una manciata alla volta; per i termini di dominio business chiedere la definizione all'utente senza inventarla (`_TODO: da completare_` se non la sa).
3. Chiedere se ci sono altri termini che gli stakeholder usano e che meritano una voce.

Ordinare la tabella alfabeticamente prima di scrivere la pagina.
