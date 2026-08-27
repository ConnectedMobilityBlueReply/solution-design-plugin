# solution-design

Plugin Claude Code per la generazione guidata di documenti **Solution-Design** per la wiki GitLab, secondo il template Unipol. Guida l'utente con un'intervista approfondita, genera pagine markdown locali (una per sezione) e diagrammi PlantUML inline.

Contiene 14 skill: un'orchestratrice (`write-solution-design`) e 13 skill di sezione, ciascuna invocabile anche singolarmente per rigenerare o aggiornare una sola sezione di una SD esistente.

---

## Requisiti

- [Claude Code](https://claude.ai/code) ≥ 1.0 (oppure qualsiasi altro harness compatibile con `SKILL.md`, vedi [Installazione via npx skills](#installazione-via-npx-skills))
- Accesso alla rete Unipol (VPN o on-premise) per leggere i template dalla wiki `unisalute-ark`
- Repo wiki GitLab dell'iniziativa clonata in locale (l'output è sempre e solo locale: il plugin non scrive mai direttamente su GitLab)

---

## Installazione

### Come plugin Claude Code

```bash
claude plugin install gh:ConnectedMobilityBlueReply/solution-design-plugin
```

Poi riavviare Claude Code (o ricaricare la sessione) affinché le skill vengano caricate.

### Installazione via npx skills

Ogni skill è self-contained (porta con sé una copia dei propri `references/`) ed è quindi installabile singolarmente, su qualsiasi harness supportato da [`npx skills`](https://github.com/vercel-labs/skills) (Claude Code, Cursor, Codex, OpenCode, Windsurf, e altri):

```bash
# Tutte le skill, su tutti gli harness rilevati
npx skills add ConnectedMobilityBlueReply/solution-design-plugin --all

# Solo l'orchestratore, per un harness specifico
npx skills add ConnectedMobilityBlueReply/solution-design-plugin --skill write-solution-design --agent claude-code

# Elencare le skill disponibili senza installare
npx skills add ConnectedMobilityBlueReply/solution-design-plugin --list
```

Repo privata: `npx skills` riusa le credenziali git/`gh` già configurate in locale, nessun passaggio aggiuntivo richiesto.

---

## Skill disponibili

### Orchestratore (entry point)

| Skill | Descrizione |
|-------|-------------|
| `write-solution-design` | Avvia l'intervista, gestisce componenti (esistenti via `gitlab-navigation`, nuove via tripletta Drakkar), crea `.sd-state.md` e invoca in sequenza le skill di sezione |

### Sezioni obbligatorie

| Skill | Pagina wiki generata |
|-------|----------------------|
| `write-component-list` | `Elenco-dei-Componenti.md` |
| `write-requirements` | `Requisiti-ed-Obiettivi.md` |
| `write-context-technical` | `Contesto-ed-Ambito-Tecnico.md` |
| `write-runtime-view` | `Viste-di-Runtime.md` |
| `write-url-routing-security` | `URL-Routing-e-Sicurezza.md` |
| `write-architectural-decision` | `Decisioni-Architetturali.md` + `Decisioni-Architetturali/ADRXX.md` |

### Sezioni facoltative

| Skill | Pagina wiki generata | Note |
|-------|----------------------|------|
| `write-solution-strategy` | `Solution-Strategy.md` | |
| `write-deployment-model` | `Deployment-Model.md` | Gestisce anche il caso "doppia filiera" |
| `write-building-blocks` | `Building-Blocks.md` | |
| `write-mapping-environment` | `Mapping-Ambienti.md` | **Obbligatoria d'ufficio se sono previsti test** |
| `write-risk-technical-debt` | `Rischi-e-Debiti-Tecnici.md` + `Rischi-e-Debiti-Tecnici/DEBXX.md` | |
| `write-glossary` | `Glossario.md` | |
| `write-environment-endpoints` | `Puntamenti-per-Ambienti.md` | |

---

## Come funziona

1. L'orchestratore chiede quali sono le **componenti coinvolte** (prima domanda, sempre). Per le esistenti tenta `ark-platform:gitlab-navigation`, con fallback manuale; per le nuove guida la scelta del nome secondo la tripletta Drakkar (`team-applicazione-componente`).
2. Chiede cartella di destinazione (repo wiki clonata) e nome dell'iniziativa, crea `<cartella>/<Nome-Iniziativa>/` e il file di stato `.sd-state.md`.
3. Invoca le 6 skill di sezione obbligatorie una alla volta, poi propone le facoltative.
4. Ogni skill di sezione legge il template Unipol corrispondente **a runtime** (mai copiato dentro la skill, per restare allineata se il template evolve), conduce un'intervista mirata (una domanda alla volta, mai dati inventati — placeholder `_TODO: da completare_` se l'informazione manca), genera la pagina markdown e i diagrammi PlantUML necessari.
5. `.sd-state.md` viene aggiornato dopo ogni sezione: se il lavoro si interrompe, ripartire dalla stessa cartella propone di riprendere da dove si era arrivati.
6. Al termine, riepilogo delle pagine generate. **Commit e push della wiki restano sempre manuali.**

---

## Struttura del repository

```
solution-design-plugin/
├── .claude-plugin/
│   └── plugin.json
├── references/                        ← fonte canonica, editare qui
│   ├── template-index.md
│   ├── plantuml-conventions.md
│   ├── drakkar-triplet.md
│   ├── interview-guide.md
│   └── section-pattern.md
├── scripts/
│   └── sync-references.sh             ← vendorizza references/ dentro ogni skill
└── skills/
    ├── write-solution-design/
    │   ├── SKILL.md
    │   └── references/                ← copia vendorizzata (npx skills)
    ├── write-component-list/
    │   ├── SKILL.md
    │   └── references/
    └── ... (una cartella per ciascuna delle altre 12 skill)
```

**Regola di manutenzione**: modificare solo i file sotto `references/` alla radice, poi rilanciare:

```bash
./scripts/sync-references.sh
```

per propagare le modifiche nelle copie vendorizzate dentro ogni skill, prima di committare.

---

## Disinstallazione

```bash
claude plugin uninstall solution-design
```

oppure, se installato con `npx skills`:

```bash
npx skills remove --skill '*' --agent '*'
```

---

## Autore

Enzo Pio Palmisano — [e.palmisano@reply.it](mailto:e.palmisano@reply.it)
ConnectedMobility Blue Reply — UniSalute ARK Team
