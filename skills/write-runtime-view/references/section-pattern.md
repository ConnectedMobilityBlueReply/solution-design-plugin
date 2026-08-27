# Pattern comune delle skill di sezione

Contratto operativo che **ogni** skill di sezione del plugin segue. Le skill di sezione dichiarano solo le proprie specificità; tutto il resto è definito qui.

## Flusso standard

1. **Risolvere il contesto.**
   - Se invocata dall'orchestratore: i dati (cartella output, iniziativa, componenti, triplette) sono in `<cartella>/<Nome-Iniziativa>/.sd-state.md`. Leggerlo.
   - Se invocata **standalone**: cercare `.sd-state.md` nella cartella corrente o in quella indicata dall'utente. Se assente, condurre una mini-intervista di contesto (nome iniziativa, cartella di output, componenti coinvolte con relative triplette) e creare il file di stato prima di procedere.
2. **Leggere il template a runtime.** Risolvere il path del file template tramite `template-index.md` (nella stessa cartella `references/` di questo file) e leggerlo. Mai affidarsi a una copia memorizzata del template: se il template evolve, il plugin deve restare allineato.
3. **Usare i tre blocchi del template:**
   - blocco `# Template (da copiare...)` → skeleton esatto dell'output;
   - blocco `# Guida...` → base per formulare le domande dell'intervista;
   - blocco `# Esempi...` (più gli esempi reali elencati in `template-index.md`) → suggerimenti concreti e contestualizzati da proporre all'utente.
4. **Intervistare** secondo `interview-guide.md`: una domanda alla volta, proposte proattive, mai inventare dati (placeholder `_TODO: da completare_` per le informazioni che l'utente non conosce).
5. **Generare i diagrammi** previsti dalla sezione come codice PlantUML inline (blocchi ` ```plantuml `), rispettando `plantuml-conventions.md` e **spiegando all'utente quale processo/flusso si sta rappresentando mentre lo si scrive**.
6. **Scrivere la pagina** markdown in `<cartella>/<Nome-Iniziativa>/<nome-pagina>.md` (nome pagina da `template-index.md`), rispettando lo skeleton del template. Le sezioni multi-pagina (ADR, Debiti) scrivono anche le pagine figlie nella sottocartella omonima.
7. **Aggiornare `.sd-state.md`**: marcare la sezione come completata, registrare eventuali dati nuovi emersi (nuove componenti, decisioni, vincoli) utili alle sezioni successive.
8. **Mostrare all'utente** un breve riepilogo di cosa è stato scritto e dove, con eventuali `_TODO_` rimasti aperti.

## Formato di `.sd-state.md`

```markdown
# Stato Solution Design — <Nome-Iniziativa>

## Dati iniziativa
- Nome: <Nome-Iniziativa>
- Cartella output: <path assoluto della repo wiki clonata>
- Test previsti: sì | no | da definire
- Note intervista: <sintesi libera>

## Componenti
| Codice/Tripletta | Nome esteso | Tipologia | Impatto | Team | Applicazione | Note |
|------------------|-------------|-----------|---------|------|--------------|------|
| ... | ... | ... | nuovo/esistente/esistente con evolutive | ... | ... | ... |

## Decisioni e vincoli emersi
- ...

## Sezioni
| Sezione | Skill | Stato | File |
|---------|-------|-------|------|
| Elenco dei Componenti | write-component-list | da fare / in corso / completata / saltata | Elenco-dei-Componenti.md |
| ... | ... | ... | ... |
```

Aggiornare sempre il file **riscrivendolo per intero** (non appendere duplicati). Convertire eventuali date relative in assolute.

## Regole trasversali

- **Output solo locale**: il plugin genera file markdown; commit e push della wiki restano manuali a cura dell'utente. Nessuna scrittura diretta su GitLab.
- **Lingua**: documenti e domande in italiano; termini tecnici e identificatori in originale.
- **Nomi componenti nella documentazione**: usare il **name esteso** Drakkar (es. `BE UserRegistration`), non il path (vedere `drakkar-triplet.md`).
