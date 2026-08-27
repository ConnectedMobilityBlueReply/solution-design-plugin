---
name: write-risk-technical-debt
description: Usare questa skill quando l'utente chiede di "scrivere rischi e debiti tecnici", "compilare Rischi-e-Debiti-Tecnici", "censire un debito tecnico", "aggiungere un DEB alla SD", "documentare i rischi del solution design", oppure in inglese "write risks and technical debt", "add a technical debt", "technical debt register", "document solution design risks", o quando l'orchestratore write-solution-design propone la sezione facoltativa Rischi e Debiti Tecnici. Genera la pagina indice Rischi-e-Debiti-Tecnici.md e una pagina figlia per ogni debito.
---

# Sezione: Rischi e Debiti Tecnici

Generare la **struttura multi-pagina** dei debiti tecnici (stesso pattern delle ADR). Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagine, aggiornamento `.sd-state.md`).

## Struttura multi-pagina

- **Pagina indice** `Rischi-e-Debiti-Tecnici.md`: tabella DEB ID | Breve Descrizione | STATO | OWNER, con l'ID linkato alla pagina figlia (`[DEB01](Rischi-e-Debiti-Tecnici/DEB01)`). Stati: APERTO (in essere), CHIUSO (risolto), DEPRECATO (superato da altre attività).
- **Una pagina figlia per ogni debito** in `Rischi-e-Debiti-Tecnici/DEBXX.md` (numerazione progressiva DEB01, DEB02, ...), con le sezioni dello skeleton del template: Descrizione, Issue/Problema, Decisioni prese (link alla ADR collegata se esiste, altrimenti descrizione della decisione), Tempistica soluzione scelta.

Se si aggiorna una SD esistente: leggere l'indice, individuare il prossimo numero DEB libero e appendere senza toccare i debiti esistenti.

## Cosa censire

Dal template: lista **ordinata per priorità** di rischi e debiti tecnici della progettualità — compromessi progettuali presi per tempo o costo che accumulano problemi da risolvere in seguito (codice di bassa qualità, architettura rigida, test carenti, documentazione mancante). Includere anche i debiti **estinti** grazie al solutioning documentato.

Proporre candidati attivamente: i rischi già marcati sul Diagramma di Contesto Tecnico, le alternative scartate "per ora" nelle ADR, i `_TODO_` strutturali emersi nelle altre sezioni.

## Intervista per singolo debito

1. Descrizione del compromesso e problema che genera.
2. Decisioni prese al riguardo: esiste una ADR collegata? Se sì linkare, se no chiedere la decisione.
3. Azioni per minimizzare/mitigare/eliminare, con misura dell'effort quando disponibile.
4. Tempistica della soluzione scelta e owner.
