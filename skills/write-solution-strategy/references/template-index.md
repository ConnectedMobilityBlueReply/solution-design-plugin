# Indice dei template Unipol

Mappa tra skill del plugin, file template Unipol da leggere a runtime e pagina wiki di output da generare.

## Percorso base dei template

```
/Users/enzopiopalmisano/Desktop/SiSalute-Wiki/unisalute-ark/public.wiki/home/Linee-Guida-Architetturali/Solution-Design/
```

Se il percorso non esiste sulla macchina corrente, chiedere all'utente dove ha clonato la wiki `unisalute-ark/public` e usare il path `<clone>/home/Linee-Guida-Architetturali/Solution-Design/`. Non proseguire mai senza aver letto il template: è la fonte di verità.

## Mappa skill → template → output

| Skill | File template | Pagina/e di output | Tipo |
|-------|---------------|--------------------|------|
| write-component-list | `Elenco-dei-Componenti.md` | `Elenco-dei-Componenti.md` | Obbligatoria |
| write-requirements | `Requisiti-ed-Obiettivi.md` | `Requisiti-ed-Obiettivi.md` | Obbligatoria |
| write-context-technical | `Contesto-ed-Ambito-Tecnico.md` | `Contesto-ed-Ambito-Tecnico.md` | Obbligatoria |
| write-runtime-view | `Viste-di-Runtime.md` | `Viste-di-Runtime.md` | Obbligatoria |
| write-url-routing-security | `URL-Routing-e-Sicurezza.md` | `URL-Routing-e-Sicurezza.md` | Obbligatoria |
| write-architectural-decision | `Decisioni-Architetturali.md` | `Decisioni-Architetturali.md` + `Decisioni-Architetturali/ADRXX.md` (una per ADR) | Obbligatoria |
| write-solution-strategy | `Solution-Strategy.md` | `Solution-Strategy.md` | Facoltativa |
| write-deployment-model | `Deployment-Model.md` | `Deployment-Model.md` | Facoltativa |
| write-building-blocks | `Building-Blocks.md` | `Building-Blocks.md` | Facoltativa |
| write-mapping-environment | `Mapping-Ambienti.md` | `Mapping-Ambienti.md` | Facoltativa — **obbligatoria se sono previsti test** |
| write-risk-technical-debt | `Rischi-e-Debiti-Tecnici.md` | `Rischi-e-Debiti-Tecnici.md` + `Rischi-e-Debiti-Tecnici/DEBXX.md` (una per debito) | Facoltativa |
| write-glossary | `Glossario.md` | `Glossario.md` | Facoltativa |
| write-environment-endpoints | `Puntamenti-per-Ambienti.md` | `Puntamenti-per-Ambienti.md` | Facoltativa |

## Ordine delle sezioni obbligatorie

1. `write-component-list` (auto-compilata in gran parte dai dati dell'intervista)
2. `write-requirements`
3. `write-context-technical`
4. `write-runtime-view`
5. `write-url-routing-security`
6. `write-architectural-decision`

## Struttura ricorrente di ogni file template

Ogni template contiene tre blocchi, individuabili dagli heading di primo livello:

1. `# Template (da copiare e incollare quando si crea una nuova SD)` → skeleton markdown dell'output da generare (dentro un fence ` ```markdown ` o ` ````markdown `)
2. `# Guida, Informazioni e Glossario di compilazione` → istruzioni di compilazione: da qui derivare le domande dell'intervista
3. `# Esempi di progetti esistenti` → link a Solution-Design reali da citare come riferimento

Eccezioni: `Glossario.md` e `Puntamenti-per-Ambienti.md` non hanno la struttura a tre blocchi completa; usare l'intero contenuto come guida e derivare lo skeleton dalle tabelle presenti.

## Esempi reali consultabili in locale (se le wiki sono clonate accanto a unisalute-ark)

| Progetto | Percorso | Note |
|----------|----------|------|
| Chiara 2.0 | `unisalute-canali/public.wiki/Chiara-2.0/` | SD completa: ADR multi-pagina (ADR01–ADR05), Rischi multi-pagina, Viste-di-Runtime in sottocartella |
| Vigilo | `unisalute-dq/public.wiki/Vigilo/` | SD con Solution-Strategy e Decisioni-Architetturali in sottocartelle |
| Fonia | `unisalute-canali/public.wiki/Fonia/` | SD con Glossario e Routing-e-Sicurezza |
| IPM | `unisalute-gestionale/public.wiki/IPM/` | SD con Deployment-model |
| Esempi ufficiali | `unisalute-canali/public.wiki/Esempi-di-Solution-Design/` | Pagine di esempio per quasi tutte le sezioni |
