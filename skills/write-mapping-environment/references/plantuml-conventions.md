# Convenzioni PlantUML per i diagrammi delle Solution-Design

Regole valide per **tutti** i diagrammi generati dal plugin. I diagrammi vanno sempre emessi come codice PlantUML inline nei markdown, dentro blocchi ` ```plantuml ` (la wiki GitLab li renderizza). Mentre si genera un diagramma, spiegare sempre all'utente quale processo o flusso si sta rappresentando.

## Convenzioni comuni a tutti i diagrammi

1. **Intestazione standard**: ogni diagramma ha `title <Titolo parlante>` e `footer IT UniSalute`.
2. **Legenda obbligatoria** (`legend bottom right ... end legend`) quando il diagramma usa più di un colore/stile di freccia o colori di riempimento con significato.
3. **Stile frecce e colori** (dalla Reference Architecture UniSalute):
   - `-[#DarkGreen,bold]->` REST/HTTP - REST/HTTPS
   - `-[#DarkRed,bold]->` SOAP/HTTP - SOAP/HTTPS
   - `-[#DarkCyan,bold]->` Frontend (navigazione browser)
   - `-[#Black,bold]->` altri protocolli (JDBC, Kafka, file, ecc.)
4. **Sincrono vs asincrono**: freccia piena (`->`) per interazioni sincrone, freccia tratteggiata (`..>`) per interazioni asincrone/eventi. In alternativa etichettare esplicitamente la freccia (`: async via Kafka`). Nei sequence diagram usare `->` per la richiesta e `-->` per la risposta.
5. **Direzionalità**: la freccia parte **sempre** dal sistema che inizia l'interazione, non dal verso del flusso dati.
6. **Colori di riempimento con significato** (da riportare in legenda):
   - `#LightGoldenRodYellow` componenti di nuova realizzazione
   - `#White` componenti esistenti
   - `#LightSlateGray` prodotti / SaaS
7. **Sprite standard** disponibili nei template Unipol (copiare la definizione dal template a runtime quando servono): `$drakkar` (componente Drakkar/OpenShift), `$f5` (VIP/bilanciatori F5), `$websphere` (WAS), `$kafka-icon` (topic/DLQ Kafka), `$delphi` (servizi Core Delphi).
8. **Rischi sul diagramma**: rappresentare i rischi come `note` PlantUML colorate (es. `note right of X #Pink`) ancorate all'elemento o all'interazione interessata, con prefisso esplicito del tipo di rischio (es. `RISCHIO DISPONIBILITÀ: ...`).

## Diagramma di Contesto Business (write-requirements)

- Mostra il sistema come **black box** e le interfacce di dominio verso i partner (persone e sistemi). Niente dettagli tecnici.
- Usare lo standard C4: `!include <c4/C4_Context.puml>` con `Person(...)`, `System(...)`, `Rel_(...)`. Icone opzionali da plantuml-stdlib `<office/...>`.
- Ogni relazione descrive il flusso di dominio scambiato ("Consultazione posizione, quotazione preventivo, ...").

## Diagramma di Contesto Tecnico (write-context-technical)

Vista di dettaglio tecnico delle interazioni disegnate nel Contesto Business. Per **ogni interazione** individuare e riportare sul diagramma:

- **protocolli** utilizzati (rest / wss / soap / jdbc / etc.)
- **tipo di sicurezza** (http/s, jwt, basic auth, saml2.0, no auth, one time link, etc.)
- **interazione**: sincrona / asincrona / flussi
- **direzionalità**: il verso dell'interazione parte dal sistema che inizia l'interazione

Indicare **esplicitamente sul diagramma** eventuali rischi di:

- **disponibilità**: il sistema dipende dalla disponibilità di sistemi esterni
- **costo**: la comunicazione con sistemi esterni è onerosa economicamente
- **sicurezza**: comunicazioni potenzialmente interessanti per attacchi (es. trasporto di dati sensibili)
- **tendenza al repentino cambiamento** dei sistemi esterni, che mina la stabilità delle scelte di implementazione delle comunicazioni
- **complessità**: interfaccia onerosa per complessità del flusso dati, framework esoterici o difficoltà nello stabilire la comunicazione
- **operations**: manutenzione/amministrazione dell'interfaccia particolarmente difficoltosa o con molto effort manuale

Struttura consigliata: `rectangle` annidati per perimetri organizzativi (es. "UnipolSai", "Unisalute", partner esterni), `cloud` per reti attraversate (Internet / VPN) con `label` del protocollo, componenti Drakkar con sprite `$drakkar`.

## Diagramma di Runtime (write-runtime-view)

Sequence diagram, uno per caso d'uso rilevante. Rappresenta le interazioni tra i componenti in esecuzione, evidenziando flussi di dati e dipendenze.

- Iniziare con `autonumber`.
- Usare `group` / `alt` / `opt` per contenere le dimensioni dei diagrammi.
- **Raggruppare i componenti con `box` in base al team-componente della tripletta Drakkar Unipol** (es. `box "unisalute-canali" #LightGreen ... end box`). Sistemi esterni in box separati per organizzazione.
- **Mai rappresentare un generico "FE"**: esplicitare sempre il `participant "Browser"` come entità distinta, così le chiamate client-to-server e server-to-server restano distinguibili.
- Per ogni componente coinvolto documentare (nel diagramma o nel testo che lo accompagna): nome, responsabilità, interfacce esposte, dipendenze verso altri componenti o servizi esterni.
- Per ogni interazione indicare: tipo (sincrona/asincrona), protocollo (REST, gRPC, WebSocket, ecc.), eventuali vincoli di sicurezza o autenticazione.
- Coprire anche scenari di errore ed eccezione dei casi d'uso critici (blocchi `alt`).
- Opzionale ma gradita: `Legend` tabellare con Step | Descrizione | Componente Origine | Componente Destinazione | Input | Output.

## Diagramma di Routing e Sicurezza (write-url-routing-security)

Dettaglia il routing delle interazioni tecniche dando nota di:

- contesti web
- componenti infrastrutturali e perimetrali coinvolti (proxy / reverse proxy / VIP F5 / DataPower / API Connect)
- specificità delle reti su cui transitano le comunicazioni (es. VPN)
- aspetti di runtime applicativo e infrastrutturale (Application Server / Web Server / Container)

Convenzioni specifiche:

- Riportare gli **hostname** dei nodi in `<color:DarkRed>` sotto il nome del componente (es. `sisalute-sophia-dev.servizi.gr-u.it`).
- Etichettare le frecce con i **path** instradati (es. `: <b>/api\n<b>/apiPI`).
- Componenti F5 con sprite `$f5`, componenti Drakkar con `$drakkar`.
- A supporto: sequence diagram per lo scenario di autenticazione APM (Client → F5 → STS → Backend).

## Diagramma di Deploy (write-deployment-model)

- Usare il modello UML di deployment: `node` per macchine/ambienti/container, `artifact` per i building block deployati.
- Mostrare: distribuzione geografica/ambienti, relazioni fisiche, mappatura building block → elementi infrastrutturali.
- Documentare le differenze di configurazione tra ambienti quando esistono.
- In caso di doppia filiera manutentiva/evolutiva, rappresentare entrambe le filiere e i rispettivi ambienti.

## Diagramma di Building Blocks (write-building-blocks)

- Decomposizione statica a livelli: prima una overview black box del sistema, poi esplosione white box di **almeno un livello** di dettaglio.
- Scendendo di livello è possibile specificare: interazioni interne/esterne, modalità di comunicazione, protezione (es. JWT tecnico), linguaggio, version control, team owner.
