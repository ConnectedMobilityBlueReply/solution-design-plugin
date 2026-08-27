# Convenzioni della tripletta Drakkar (team-applicazione-componente)

Fonte: Naming Convention UniSalute (`unisalute-ark/public.wiki/home/Linee-Guida-Architetturali/Naming-Convention.md`) e FAQ Drakkar. Se la wiki è clonata in locale, leggere la pagina originale per verifiche di dettaglio.

## Struttura della tripletta

Un componente su Drakkar è identificato dalla tripla:

```
{TEAM}-{APPLICAZIONE}-{NOMECOMPONENTE}
```

Esempio: `unisalute-canali-idm-be-registration` → repository GitLab `unisalute-canali/idm/be-registration`.

- **Team**: perimetro organizzativo (es. `unisalute-canali`, `unisalute-gestionale`, `unisalute-ark`, `unisalute-dq`, `sisalute`).
- **Applicazione**: perimetro business; tutti i componenti di quel dominio vivono al suo interno (es. `idm`, `chat`, `bi`).
- **Componente**: progetto software autocontenuto con dominio di business ben definito (servizio, SPA, libreria, batch, tool di test, emulatore).

## Vincoli hard

1. **Lunghezza**: la tripletta completa non deve superare **41 caratteri** (l'hostname `-env.servizi.gr-u.it` consuma 20 caratteri e 2 trattini fanno da delimitatori). Eccezione: per le librerie non c'è il limite.
2. **No ripetizione**: il nome dell'applicazione non può essere ripetuto nel componente.
   - Non compliant: `unisalute-canali-survey-be-survey-mng`
   - Compliant: `unisalute-canali-survey-be-mng`
3. Il campo **path** del componente è **immutabile** dopo la creazione e non può contenere il nome dell'applicazione contenitrice.
4. Il campo **name** non supporta lettere accentate (ma è modificabile dopo la creazione).

## Campi della issue di creazione componente

| Campo | Contenuto | Modificabile dopo |
|-------|-----------|-------------------|
| `path` | Acronimo breve del componente (senza nome applicazione) | No |
| `name` | Nome esteso, descrittivo e umanamente comprensibile — **è il nome da usare in tutta la documentazione** (Building Blocks, diagrammi runtime, ecc.) | Sì |
| `description` | Descrizione delle funzionalità del componente | Sì |

Name compliant: `BE UserRegistration`, `BE Survey Management`. Non compliant: `be-user-registration`, `be-mng`.

## Prefissi per layer architetturale

| Layer architetturale | Path | Esempio path | Esempio name |
|----------------------|------|--------------|--------------|
| Componenti che erogano frontend | `fe-{NAME}` | `fe-registration` | FE Registration |
| Servizi che espongono funzionalità di backend | `be-{NAME}` | `be-mng` | BE Survey Management |
| Componenti di interfaccia verso il frontend | `bff-{NAME}` | `bff-primo-accesso` | BFF Pagina primo accesso |
| Librerie | `{NAME}` (no limite 41 char) | `jwt-auth` | JWT Authorization Library |
| Configurazione globale | `cfg` | `cfg-cert` | Configurazioni Globali Certificati UniSalute |
| Servizi Core Delphi | nome as-is | `WSContatto` | WSContatto |
| Servizi esistenti / componenti esterni | solo nome breve | `f5`, `HCL`, `OHS` | F5, HCL, OHS |

Per i componenti esterni **non** usare la tripletta (es. usare `f5`, non `unisalute-canali_idm_f5`).

## Categoria architetturale (per Elenco-dei-Componenti)

- `CANALE` → componente BE di Canale
- `WEB` → componente Web
- `CORE` → componente riutilizzabile in vari contesti (core gestionale o core canale)
- `LIB` → libreria
- `APP` → applicazione Mobile

## Come guidare l'utente nella scelta dei nomi (componenti nuove)

1. Chiedere prima **team** e **applicazione** di destinazione: esiste già un'applicazione per quel perimetro business o va censita nuova?
2. Per il componente, far scegliere il criterio: perimetro funzionale (es. `be-vendita`) oppure entità erogata (es. `be-polizze`).
3. Proporre il path con prefisso corretto (`fe-`/`be-`/`bff-`/`cfg`/nudo per librerie), verificare che tripletta ≤ 41 caratteri e che il nome applicazione non sia ripetuto.
4. Proporre il name esteso corrispondente (es. path `be-mng` → name `BE Survey Management`).
5. Ricordare che ogni componente nuovo richiede issue di creazione su `drakkar/support` (tipo Component; analogamente Team/Application per team e applicazioni nuove): il numero issue va poi censito in Elenco-dei-Componenti.

## Esempi reali (dal progetto Chiara 2.0)

| Tripletta | Tipo | Note |
|-----------|------|------|
| `unisalute-canali/chat/be-boost-ops` | java-library | Gestione risposte generative + integrazione CRM |
| `unisalute-canali/chat/be-boost-inbound` | java-library | Pass-through verso servizi informativi |
| `unisalute-canali/chat/be-boost-agentrag` | python-library | Invocazione LLM e AI Search |
| `unisalute-canali/chat/batch-analytics` | java-library (Farm Batch) | Estrazione conversazioni per dashboard BI |
| `unisalute-ark/chiara-uns/agent` | python-runnable | Agente IA |
