---
name: write-solution-design
description: Usare questa skill quando l'utente chiede di "scrivere un solution design", "creare una solution design", "nuova SD", "documentare l'architettura sulla wiki", "generare il solution design per la wiki GitLab", "avviare una SD Unipol/UniSalute", oppure in inglese "write a solution design", "create a solution design", "new solution design", "generate solution design documentation", "document the architecture on the wiki", o vuole produrre la documentazione architetturale completa di un'iniziativa secondo il template Unipol. È l'orchestratore che guida l'intervista e invoca le skill di sezione.
---

# Orchestratore Solution-Design

Guidare l'utente nella produzione completa di una Solution-Design per la wiki GitLab secondo il template Unipol: intervista approfondita, generazione di una pagina markdown locale per sezione, diagrammi PlantUML inline. Il processo parte **sempre** da questa skill.

Riferimenti condivisi (leggerli prima di iniziare):

- `references/interview-guide.md` — stile intervista, integrazione gitlab-navigation e fallback
- `references/template-index.md` — mappa skill → template → pagine di output
- `references/drakkar-triplet.md` — convenzioni di naming tripletta Drakkar
- `references/section-pattern.md` — contratto delle skill di sezione e formato `.sd-state.md`

## Fase 0 — Ripresa di lavori esistenti

Se l'utente indica una cartella/iniziativa in cui esiste già un file `.sd-state.md`, leggerlo, riepilogare lo stato (sezioni completate, saltate, da fare) e **proporre di riprendere** dalla prima sezione non completata. Solo se l'utente rifiuta, ricominciare l'intervista.

## Fase 1 — Intervista iniziale approfondita

Condurre l'intervista secondo `interview-guide.md`: domande mirate, **una alla volta**, con proposte proattive.

**La prima domanda è sempre: quali sono le componenti coinvolte nell'iniziativa?**

Poi approfondire, nell'ordine:

1. Per ogni componente: è **esistente** o **nuova**?
2. Obiettivo dell'iniziativa in una frase (servirà a tutte le sezioni).
3. Attori e sistemi esterni coinvolti (utenti, partner, servizi terzi).
4. **Sono previsti test?** (determina l'obbligatorietà di `write-mapping-environment` in Fase 5).

## Fase 2 — Gestione componenti

### Componenti esistenti

Invocare la skill `ark-platform:gitlab-navigation` per navigare la codebase GitLab e recuperare informazioni sulle componenti indicate (tecnologie, interfacce, dipendenze, config Drakkar), così da fornire suggerimenti mirati nelle sezioni successive. Se la skill non è disponibile o la componente non viene trovata, applicare il fallback descritto in `interview-guide.md`: chiedere le informazioni manualmente oppure il path della repository locale.

### Componenti nuove

Guidare l'utente nella definizione seguendo `drakkar-triplet.md`: team e applicazione di destinazione, scelta del path con prefisso corretto (`fe-`/`be-`/`bff-`/`cfg`/libreria), verifica dei vincoli (≤41 caratteri, no ripetizione nome applicazione), proposta del name esteso. Per ogni componente chiedere dettagli specifici (responsabilità, tecnologia prevista) e proporre suggerimenti basati sulle convenzioni UniSalute e sugli esempi reali.

## Fase 3 — Setup output

Chiedere (una domanda alla volta):

1. La **cartella di destinazione**: la repo wiki del progetto clonata in locale.
2. Il **nome dell'iniziativa** (diventerà il nome della cartella/gerarchia pagine wiki, in formato Kebab-Case con iniziali maiuscole, es. `Chiara-2.0`).

Creare la struttura `<cartella>/<Nome-Iniziativa>/`.

## Fase 4 — File di stato

Creare `<cartella>/<Nome-Iniziativa>/.sd-state.md` nel formato definito in `section-pattern.md`, con: dati raccolti nell'intervista (componenti, triplette, decisioni, flag test), elenco sezioni con stato iniziale `da fare` (le facoltative con stato `da valutare`). Aggiornarlo dopo ogni sezione completata.

## Fase 5 — Sezioni obbligatorie

Invocare le skill di sezione **una alla volta tramite Skill tool**, in quest'ordine:

1. `solution-design:write-component-list` (in gran parte auto-compilata dai dati dell'intervista)
2. `solution-design:write-requirements`
3. `solution-design:write-context-technical`
4. `solution-design:write-runtime-view`
5. `solution-design:write-url-routing-security`
6. `solution-design:write-architectural-decision`

Attendere il completamento di ogni sezione (pagina scritta + `.sd-state.md` aggiornato) prima di passare alla successiva.

## Fase 6 — Sezioni facoltative

Al termine delle obbligatorie, proporre le facoltative **una per una**, spiegando in una riga a cosa serve ciascuna:

- `write-solution-strategy` — sommario tabellare delle strategie di soluzione che danno forma all'architettura
- `write-deployment-model` — infrastruttura di run e mappatura building block → elementi infrastrutturali (con diagramma di deploy)
- `write-building-blocks` — decomposizione statica del sistema a livelli (black box → white box)
- `write-mapping-environment` — fasi di test previste e ambienti su cui gira ogni componente
- `write-risk-technical-debt` — censimento di rischi e debiti tecnici (indice + pagina per singolo debito)
- `write-glossary` — glossario dei termini di dominio e tecnici dell'iniziativa
- `write-environment-endpoints` — matrice degli ambienti e puntamenti (Sviluppo, Collaudo, Produzione, Hotfix)

**Regola speciale**: se dall'intervista è emerso che sono **previsti test**, `write-mapping-environment` diventa obbligatoria e va inclusa d'ufficio (comunicarlo all'utente, senza chiedere).

## Fase 7 — Chiusura

Produrre un riepilogo finale:

1. Albero delle pagine generate sotto `<cartella>/<Nome-Iniziativa>/`.
2. Sezioni completate e sezioni saltate (con eventuali `_TODO: da completare_` rimasti aperti).
3. Istruzioni per commit e push **manuali** della wiki (es. `git add`, `git commit`, `git push` dalla repo wiki). Il plugin **non esegue mai** commit o push, né scrive direttamente su GitLab.
