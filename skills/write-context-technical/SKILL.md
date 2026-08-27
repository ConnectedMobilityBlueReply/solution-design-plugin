---
name: write-context-technical
description: Usare questa skill quando l'utente chiede di "scrivere il contesto tecnico", "compilare Contesto-ed-Ambito-Tecnico", "fare il diagramma di contesto tecnico", "compilare la matrice delle integrazioni della SD", oppure in inglese "write the technical context", "technical context diagram", "integration matrix", "document SD integrations", o quando l'orchestratore write-solution-design arriva alla sezione Contesto ed Ambito Tecnico. Genera la pagina wiki Contesto-ed-Ambito-Tecnico.md dal template Unipol.
---

# Sezione: Contesto ed Ambito Tecnico

Generare la pagina `Contesto-ed-Ambito-Tecnico.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Diagramma di Contesto Tecnico

Vista di dettaglio tecnico delle interazioni disegnate nel Contesto Business (sezione Requisiti). Costruirlo interrogando l'utente **una interazione alla volta**, con proposte proattive basate sulle informazioni recuperate via gitlab-navigation o dagli esempi reali. Per ogni interazione individuare:

- **protocolli** utilizzati (rest / wss / soap / jdbc / etc.)
- **tipo di sicurezza** (http/s, jwt, basic auth, saml2.0, no auth, one time link, etc.)
- **interazione**: sincrona / asincrona / flussi
- **direzionalità**: il verso parte dal sistema che inizia l'interazione

Indicare **esplicitamente sul diagramma** eventuali rischi di: **disponibilità**, **costo**, **sicurezza**, **tendenza al repentino cambiamento** dei sistemi esterni, **complessità**, **operations**. Definizioni complete, resa grafica (note colorate) e convenzioni di frecce/colori/sprite in `references/plantuml-conventions.md`, sezione "Diagramma di Contesto Tecnico". Chiedere attivamente all'utente, integrazione per integrazione, se uno di questi rischi si applica.

Collocare i sistemi sul layer architetturale opportuno secondo la Vista Logica della Reference Architecture Unipol (link nel template). Se il diagramma non è troppo complesso è accettabile riportare le componenti Drakkar a questo livello; altrimenti rimandare il dettaglio alla vista Building Blocks.

## Matrice delle Integrazioni

**Obbligatoria** per tutti i progetti tranne quelli afferenti ad AR (dove le integrazioni sono già note): chiedere all'utente se il progetto è in perimetro AR.

Compilare la tabella del template, una riga per integrazione con codice progressivo `INT1`, `INT2`, ...: Applicazione Sorgente e Destinataria (usare i **codici** definiti in Applicazioni Coinvolte dell'Elenco dei Componenti), Contesto Sicurezza Destinatario, Autorizzazioni previste, Audit previsti (normativi o tecnici), Conversione di Token, Funzionalità che motiva l'integrazione, Note (impatti architetturali, debiti tecnici, peculiarità).

Ogni integrazione della matrice deve comparire anche sul diagramma e viceversa: verificare la coerenza prima di chiudere la pagina.
