---
name: write-building-blocks
description: Usare questa skill quando l'utente chiede di "scrivere i building blocks", "compilare Building-Blocks", "fare il diagramma dei building block della SD", "documentare la decomposizione statica del sistema", oppure in inglese "write the building blocks", "building blocks diagram", "document the static decomposition of the system", o quando l'orchestratore write-solution-design propone la sezione facoltativa Building Blocks. Genera la pagina wiki Building-Blocks.md dal template Unipol.
---

# Sezione: Building Blocks

Generare la pagina `Building-Blocks.md` della Solution-Design. Seguire il contratto comune in `references/section-pattern.md` (contesto, lettura template a runtime via `references/template-index.md`, intervista, scrittura pagina, aggiornamento `.sd-state.md`).

## Contenuto

Decomposizione statica del sistema mostrata come gerarchia: overview **black box** ad alto livello (contesto e ambito dell'applicazione), poi esplosione **white box** di **almeno un livello** di dettaglio, fino al livello appropriato. Produrre il **Diagramma di Building Blocks a Livelli** in PlantUML (convenzioni in `references/plantuml-conventions.md`, sezione "Diagramma di Building Blocks"), spiegando all'utente cosa rappresenta ogni livello mentre lo si disegna.

Partire dai componenti censiti in `.sd-state.md` e in Elenco-dei-Componenti: il primo livello raggruppa i componenti per applicazione/dominio, i livelli successivi esplodono i moduli interni dei componenti nuovi o con evolutive.

Scendendo di livello, chiedere all'utente se specificare (opzionale, dal template):

1. interazioni tra componenti interni ed esterni
2. modalità di comunicazione
3. modalità di protezione (es. JWT tecnico)
4. linguaggio di programmazione dei componenti
5. sistema di version control utilizzato
6. informazioni organizzative (team owner)

Ogni black box esplosa va accompagnata da una breve descrizione testuale delle responsabilità dei blocchi mostrati. Usare i name estesi Drakkar per i componenti (vedere `references/drakkar-triplet.md`).
