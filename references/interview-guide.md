# Guida allo stile dell'intervista

Regole di conduzione dell'intervista, valide per l'orchestratore e per tutte le skill di sezione.

## Stile

1. **Una domanda alla volta.** Mai elencare 5 domande in un messaggio: porre la domanda più importante, attendere la risposta, proseguire. Raggruppare al massimo 2-3 sotto-punti solo quando strettamente correlati (es. "protocollo e tipo di autenticazione di questa integrazione?").
2. **Proposte proattive.** Non porre domande a vuoto: accompagnarle con un default ragionato ricavato dal contesto, dagli esempi reali o dalle convenzioni UniSalute. Formato tipico: "Per componenti come X di solito si usa Y — confermi o preferisci altro?". L'utente deve poter rispondere "sì" nella maggior parte dei casi.
3. **Suggerire e guidare le scelte.** Quando esistono alternative (es. sync vs async, nuovo componente vs evolutiva), presentarle brevemente con trade-off e una raccomandazione.
4. **Mai inventare dati.** Se un'informazione manca, chiederla. Se l'utente non la sa, inserire nel documento un placeholder esplicito `_TODO: da completare_` (mai un valore plausibile ma non confermato).
5. **Riepiloghi brevi.** A fine di ogni blocco tematico, riepilogare in 2-4 righe quanto raccolto prima di passare oltre; correggere subito se l'utente obietta.
6. **Lingua**: intervista e documenti in italiano; termini tecnici e identificatori in originale.

## Recupero informazioni sulle componenti esistenti

Per ogni componente **esistente** citata dall'utente:

1. Invocare la skill `ark-platform:gitlab-navigation` (tramite Skill tool) per navigare la codebase GitLab su `code.servizi.gr-u.it` e recuperare: tecnologie usate, interfacce esposte (controller/endpoint), dipendenze (pom/package.json), configurazione Drakkar (`.drakkar/config.yaml`), wiki di progetto.
2. Usare le informazioni recuperate per formulare suggerimenti mirati nelle sezioni successive (protocolli, sicurezza, integrazioni già in essere).

### Fallback

Se `gitlab-navigation` non è disponibile (skill o MCP GitLab non installati/autenticati) oppure la componente non viene trovata:

1. Dirlo esplicitamente all'utente ("non riesco a raggiungere GitLab / non trovo la componente X").
2. Chiedere in alternativa: (a) le informazioni chiave a voce (tecnologia, interfacce, dipendenze), oppure (b) il **path della repository clonata in locale**, da esplorare direttamente con gli strumenti di lettura file.
3. Se nessuna delle due strade è percorribile, procedere con placeholder `_TODO: da completare_` sulle informazioni mancanti.

## File di stato `.sd-state.md`

Vedere `section-pattern.md` per il formato. Regole d'oro:

- L'orchestratore lo crea al termine dell'intervista iniziale; ogni skill di sezione lo **aggiorna** al termine del proprio lavoro (stato sezione + eventuali nuovi dati emersi).
- Se all'avvio dell'orchestratore il file esiste già nella cartella dell'iniziativa, proporre di **riprendere** dal punto in cui il lavoro si era interrotto (prima sezione non completata), riepilogando lo stato.
