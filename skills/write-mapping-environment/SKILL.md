---
name: write-mapping-environment
description: Usare questa skill quando l'utente chiede di "scrivere il mapping ambienti", "compilare Mapping-Ambienti", "documentare le fasi di test della SD", "mappare i test sugli ambienti", oppure in inglese "write the environment mapping", "test phases mapping", "map test phases to environments", o quando l'orchestratore write-solution-design arriva alla sezione Mapping Ambienti (facoltativa, ma obbligatoria se il progetto prevede test). Genera la pagina wiki Mapping-Ambienti.md dal template Unipol.
---

# Sezione: Mapping Ambienti (fasi di test)

Generare la pagina `Mapping-Ambienti.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

**Nota di obbligatorietà**: la sezione è facoltativa, ma diventa **obbligatoria se il progetto prevede test** (flag in `.sd-state.md`; l'orchestratore la include d'ufficio in quel caso).

## Contenuto

Tabella delle **Fasi di Test**: una riga per componente coinvolto, colonne RUNTIME | COMPONENTI | DEV | TEST | UT | FIT | SIT | PT | SMOT | STAB | FUN | UAT | CDD | NRT | PEN | SMOTA | PROD. In ogni cella indicare l'ambiente su cui il componente svolge quella fase di test (o `-` se la fase non è prevista). Obiettivo (dal template): visione a 360° delle fasi di sviluppo e test per non incorrere in incroci di ambienti.

## Intervista

1. Partire dai componenti di `.sd-state.md`: proporre la lista righe già pronta.
2. Chiedere quali **tipologie di test** sono previste per il progetto. Il blocco Guida del template contiene il glossario completo delle fasi (UT, FIT, SIT, PT, SMOT, STAB, FUN, UAT, CDD, NRT, PEN, SMOTA): usarlo per spiegare all'utente le fasi che non conosce, una definizione alla volta se richiesta.
3. Per ogni fase prevista, chiedere su quale ambiente viene svolta per ciascun componente, proponendo i default UniSalute (UT in DEV, FIT/SIT in SIT, PT/STAB in PP/staging, SMOT/SMOTA in PROD). Con doppia filiera attiva, distinguere gli ambienti EVO.
4. Fasi non previste: lasciare la cella vuota o `-`, senza inventare.
