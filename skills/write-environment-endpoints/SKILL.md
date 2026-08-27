---
name: write-environment-endpoints
description: Usare questa skill quando l'utente chiede di "scrivere i puntamenti per ambienti", "compilare Puntamenti-per-Ambienti", "documentare gli endpoint per ambiente della SD", "compilare la matrice degli ambienti", "censire i puntamenti di sviluppo collaudo produzione", oppure in inglese "write the environment endpoints", "endpoints per environment", "environment matrix", "document dev test prod endpoints", o quando l'orchestratore write-solution-design propone la sezione facoltativa Puntamenti per Ambienti. Genera la pagina wiki Puntamenti-per-Ambienti.md dal template Unipol.
---

# Sezione: Puntamenti per Ambienti

Generare la pagina `Puntamenti-per-Ambienti.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`). Nota: questo template non ha la struttura a tre blocchi — le tabelle che contiene sono lo skeleton.

## Matrice degli Ambienti

Tabella Componente | DEV | DEV-EVO | SIT | SIT-EVO | PREPROD | PROD | HELP con tutti i componenti della soluzione: mostra su quali ambienti effettivi risiedono, specie se fuori perimetro Drakkar. La compilazione è **mandatoria per le sole applicazioni che prevedono la filiera evolutiva** (flag doppia filiera in `.sd-state.md`; chiederlo se non presente). Senza filiera evolutiva, proporre comunque la matrice semplificata omettendo le colonne EVO.

## Puntamenti per ambiente

Una tabella per ambiente — **Sviluppo / Development**, **Collaudo / Integration**, **Produzione / Production**, **Hotfix** — con colonne Sistema | Descrizione | Endpoint | Remote Endpoint | Swagger (dove applicabile) | Note. Mostrano come raggiungere applicazioni e componenti a runtime; oltre ai componenti possono comparire i sistemi di Runtime.

## Intervista

1. Partire dai componenti di `.sd-state.md` (e dall'Elenco puntamenti di URL-Routing-e-Sicurezza se già compilato): proporre le righe precompilate.
2. Per ogni componente Drakkar proporre la convenzione hostname UniSalute e farla confermare: pubblico `https://svilweb.unisalute.it/...` / `collweb` / `www`, remote endpoint `https://<team>-<app>-<comp>-dev.servizi.gr-u.it/` (`-sit`, nessun suffisso + `.ha.` in produzione), Swagger su `<remote>/v1/swagger-ui/#` per i BE.
3. Endpoint non ancora assegnati (tipico per Hotfix): usare `-` o `_TODO: da completare_`, mai inventare hostname.
