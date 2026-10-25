# VHS Recording Plan — Station Installer

> Working spec for the `vhs-recorder` agent. Not published (lives at repo root, alongside `DOCS-OUTLINE.md`).
> Last updated: 2026-10-26.

## Current setup (2026-10-26): recordings come from the real terminal app

Since v0.1.0-rc.17 the install command opens the **station-installer terminal app** (Go, Bubble Tea + Huh, `station/cmd/station-installer`); the classic gum wizard only runs with `--classic` or as a fallback. The install page's clips are recorded from the **real app** in demo mode, not from a mock:

- `vhs/tui-install.sh` is symlinked as `install.sh` in each tape, so the real command on camera (`sudo bash install.sh --network testnet`) runs `station-installer --demo --preview=false --script vhs/tui-demo-setup.sh`. `--demo` uses placeholder facts (IP `203.0.113.42`, no real DNS or Docker checks).
- `vhs/tui-demo-setup.sh` stands in for `setup-station.sh` after the questions: it prints the real script's progress messages and `::stage::` / `::result::` markers with placeholder values, and touches nothing. **Its strings are copied from `station/scripts/setup-station.sh`: re-diff them when that script's messages change.**
- Before recording, build the app onto PATH: `cd ~/code/station && go build -o ~/go/bin/station-installer -ldflags "-X main.version=<tag>" ./cmd/station-installer`. The version shows in the title line.
- Render from the repo root: `vhs vhs/install-<name>.tape`.

| Tape | Output | Shows | Page anchor |
|---|---|---|---|
| `install-full.tape` | `full.webm` (+ `full.gif`) | whole run: splash, questions, install, PIN card | top-of-page hero (video) |
| `install-splash.tape` | `splash.gif` | the command, the animated title while checks run, the first question | Step 2 intro |
| `install-duckdns.tape` | `duckdns.gif` | DuckDNS: subdomain, hidden token | "How will listeners reach your server?" |
| `install-entry-node.tape` | `entry-node.gif` | `DEMO_FLAGS=--simulate-bootnode-down`: typo refused, good address accepted | "Joining the network" |
| `install-finish.tape` | `finish.gif` | review, install checklist + log, the "Your Station is live" card with the PIN | Step 3 |

Shared settings differ from the section below: **FontSize 16, 1200×900, Framerate 30**. The app keeps its large STATION title only on terminals of 28 rows or more (smaller ones get a one-line header), so the old 22 px / 700 px size is too short. Placeholder values are unchanged (`music.yourdomain.com`, `you@example.com`, PIN `123-456`).

`vhs/mock-install.sh` now only models the **classic** wizard (`--classic`); no clip uses it. The sections below are the original plan for that wizard (2026-07), kept for history.

## Goal

Record the **Station terminal installer** (`install.sh` setup wizard) as short, embeddable terminal GIFs for the `deployment/install` docs page — a full-flow **hero GIF** at the top plus **per-step clips** inline next to each prose step.

## Scope — VHS records the terminal ONLY

VHS's entire surface here is the **CLI install wizard**. These items from `DOCS-OUTLINE.md`'s "Screenshots needed" list are **NOT** VHS's job — they're browser UI and need real screenshots (or a browser recorder), not tapes:

- ❌ Dashboard **PIN login** screen (`https://<domain>/setup`) — web page
- ❌ The **7 Features pages** (Dashboard, Catalog, New Release, Storefront, Fan Club, Treasury, Settings) — web dashboard

If a request lands on the vhs-recorder agent for any of those, it should push back: wrong tool.

## Decisions (settled 2026-07-13)

1. **Recording method → mock demo harness.** The real script needs root + a live VPS + Docker + DNS + a Let's Encrypt cert, and a real run leaks a real domain/PIN/token and has minutes of dead waiting. Instead we build a local harness that reproduces the wizard's **real interactive prompts and printed output** while **stubbing the system work** (no real Docker/DNS/certs). VHS drives it exactly like a user. See "Mock harness" below.
2. **Granularity → per-step clips + a hero GIF.** ~7 per-step clips embedded inline, plus one end-to-end hero at the top of the page.
3. **Branches → happy path primary, DuckDNS as one variant clip.** Own-domain + Docker-gets-installed + no port conflict + fresh install is the main flow. DuckDNS gets its own domain clip since the docs cover it. Skip the rare conditional prompts (reconfigure / port-conflict) for now.

## Source of truth (keep the mock faithful)

The mock must mirror the **real** wizard's exact prompt text and output. Canonical sources:

- **What users actually run:** `https://qnch.network/install.sh` (re-fetch to diff; a copy was pulled to the session scratchpad on 2026-07-13, 1517 lines).
- **Repo source:** `/home/liminal/code/station/scripts/setup-station.sh`.

⚠️ **Drift is the main risk of the mock approach.** When either source changes (esp. the two recent "fix install command" commits show this file moves), re-diff and update `vhs/mock-install.sh` + re-render. Copy prompt strings **verbatim** — don't paraphrase.

### Exact wizard flow (verified 2026-07-13, from the real script)

Command: `curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet`

1. **Banner** — QNCH ASCII-art logo (purple/cyan) + "Setup Wizard v<version>".
2. **Prereqs box** — rounded border: Ubuntu 20.04/22.04 or Debian 11/12 · root/sudo · ports 80/443/4001/4002 · domain A record (or DuckDNS).
3. **Docker prompt** *(if missing)* — `Install Docker automatically?` [default **Yes**] → `Installing dependencies…` → `Starting Docker service…`.
4. **Domain choice** — `How would you like to configure your domain?` → `Own domain (mymusic.example.com)` | `DuckDNS (free dynamic DNS)`.
   - **Own domain:** spinner `Detecting server's public IP…` → `Enter your domain:` → validates DNS → `✓ DNS resolves to this server` (or prints an A-record box to fix + retry).
   - **DuckDNS:** prints setup steps → `Have you created a DuckDNS account and subdomain?` [no] → `Enter your DuckDNS subdomain:` → `Enter your DuckDNS token:` → `DuckDNS updated successfully`.
5. **Email** — "Let's Encrypt will send certificate expiration notices to this email." → `Enter email address:`.
6. **Watchtower** — `Enable automatic updates via Watchtower?` [default **Yes**].
6b. **Joining the network** *(added 2026-10-25 from the real script, rc.15)* — `→ Joining the network` → spinner `Fetching Station...`.
   - **Bootnode reachable (normal):** `✓ Station's bootnode is reachable.` Nothing is asked.
   - **Bootnode not reachable:** "Station's original bootnode cannot be reached, but you can still join the network." → explanation (copy a Node address from another artist's dashboard, Settings) → `Node address:` (placeholder `/dns4/artist.example.com/tcp/443/wss/p2p/12D3KooW...`, Enter = none). A typo prints `✗ That doesn't look like a node address. It should look like: ...` and asks again. A good address prints `✓ Your node will join the network through: <address>`.
   - **Re-run with a saved entry node:** `ℹ Your saved entry node is: <address>` → `Keep this entry node?` [default **Yes**]. No opens the same `Node address:` prompt.
7. **No more prompts** — `Generating configuration files…` → `Created traefik/traefik.yml` / `dynamic.yml` → `Starting Station and Traefik…` (image pull) → cert provision (30–90s) → health wait → `Retrieving setup PIN from Station…` → `✓ PIN retrieved successfully`.
8. **Success box** — green `✓ Setup completed successfully!` then a **NEXT STEPS** box:
   1. `Open:  https://<domain>/setup`
   2. `Enter PIN:  XXX-XXX`
   3. `Use the dashboard to upload your music`
   4. `Share your namespace with listeners`

gum style palette used by the script: step `→` fg 39 (blue) · success `✓` fg 82 (green) · warn `⚠` fg 214 · error `✗` fg 196 · info `ℹ` fg 39 · boxes border fg 99 (purple).

## Placeholder / redaction rules (never real data)

The mock uses fixed, obviously-fake values so nothing sensitive is ever recorded:

| Field | Value in recordings |
|---|---|
| Domain | `demo.qnch.network` |
| Server public IP | `203.0.113.42` (RFC 5737 TEST-NET — never a real host) |
| Email | `you@example.com` |
| DuckDNS subdomain | `myband` |
| DuckDNS token | shown redacted as `••••••••` |
| Setup PIN | `123-456` |

## Mock harness — `vhs/mock-install.sh`

A single bash script that reproduces the wizard's **real interactive prompts** (via `gum`, matching the strings above) but **stubs the system work**: Docker "install" = a short spinner + canned lines; DNS check = always `✓ resolves`; `docker compose up` = spinner + canned lines; PIN = hardcoded `123-456`. VHS answers the prompts exactly like a user (arrow keys to choose, `Type` the domain/email, `Enter`).

**Staged entry** so each clip renders only its segment without clicking through everything:

```
mock-install.sh --stage run                 # banner + prereqs
mock-install.sh --stage docker              # Docker prompt only
mock-install.sh --stage domain-own          # own-domain prompt chain
mock-install.sh --stage domain-duckdns      # DuckDNS prompt chain
mock-install.sh --stage email-watchtower    # email + Watchtower prompts
mock-install.sh --stage join                # joining the network, bootnode reachable (in --all)
mock-install.sh --stage entry-node          # bootnode unreachable: Node address prompt, typo refused, good address
mock-install.sh --stage provisioning        # config gen + compose up (trimmed)
mock-install.sh --stage success             # PIN + success/NEXT STEPS box
mock-install.sh --all                       # full happy path (own domain) — for the hero
```

**Dependency:** `gum` (Charmbracelet) must be on PATH for the authentic UI — currently **NOT installed**. Install before recording (`sudo dnf install gum`, or the Charm repo / `go install github.com/charmbracelet/gum@latest`). The script may keep a plain-`read` fallback like the real one, but we record the `gum` path.

## Clip list

All tapes live in `vhs/`; outputs go to `static/img/install/` (served at `/img/install/…`). Shared settings below.

| # | Tape (`vhs/…`) | Mock stage | Shows | Output → | Doc anchor | ~len |
|---|---|---|---|---|---|---|
| 1 | `install-run.tape` | `run` | curl command typed → banner → prereqs box | `install/run.gif` | Step 2 (run it) | ~6s |
| 2 | `install-docker.tape` | `docker` | "Install Docker automatically?" → Yes → deps/service lines | `install/docker.gif` | Step 3 (Docker) | ~5s |
| 3 | `install-domain-own.tape` | `domain-own` | domain choice → Own domain → detect IP → enter domain → ✓ DNS resolves | `install/domain-own.gif` | Step 3 (domain) | ~8s |
| 4 | `install-domain-duckdns.tape` | `domain-duckdns` | domain choice → DuckDNS → confirm → subdomain → token (redacted) → ✓ updated | `install/domain-duckdns.gif` | Step 3 (DuckDNS variant) | ~8s |
| 5 | `install-email-watchtower.tape` | `email-watchtower` | enter email → Enable Watchtower? → Yes | `install/email-watchtower.gif` | Step 3 (final prompts) | ~5s |
| 5b | `install-entry-node.tape` *(not recorded yet)* | `entry-node` | "bootnode cannot be reached" → Node address typo refused → good address accepted | `install/entry-node.gif` | Step 2, "Joining the network" | ~10s |
| 6 | `install-provisioning.tape` | `provisioning` | generating configs → starting containers → cert (trimmed via Hide) | `install/provisioning.gif` | Step 4 (it works) | ~6s |
| 7 | `install-success-pin.tape` | `success` | retrieving PIN → ✓ Setup completed + NEXT STEPS box + PIN `123-456` | `install/success-pin.gif` | Step 4/5 (money shot) | ~6s |
| H | `install-full.tape` | `--all` | end-to-end happy path (own domain), long waits trimmed | `install/full.gif` | top-of-page hero | ~30–40s |

The hero is its own tape running `mock-install.sh --all` in one continuous take (not `Source`d — the per-step tapes carry their own `Set`/`Output` headers). Same mock = the hero and clips can never disagree.

## Shared VHS settings (per-tape header)

```
Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60
```

Conventions:
- Prefer `Wait /regex/` on real output over fixed `Sleep`s so timing survives machine speed.
- `Hide`/`Show` around the long provisioning waits (image pull, cert) — show a brief spinner, not 90 real seconds.
- End each clip on its result and rest a beat (`Sleep 2`) so loops read cleanly; consider `Set LoopOffset` on the hero.
- Keep GIFs lean; if any clip is heavy, offer a `.webm` alongside.

## Build order

1. **Install `gum`** (record blocker).
2. **Re-fetch `install.sh`** and confirm the flow/strings still match this outline; note any drift.
3. **Write `vhs/mock-install.sh`** with the staged entry points and verbatim prompt strings + placeholder values.
4. **Author `vhs/install-*.tape`** clips using the shared settings; `vhs validate` then render each; verify each output file exists and is non-empty.
5. **Author `vhs/install-full.tape`** hero once the clips look right.
6. **Embed** in `docs/deployment/install.md` (once that page exists — currently being written by the other instance): hero at top, clips inline per step, `![alt](/img/install/<name>.gif)`.
7. Commit `vhs/` sources + `static/img/install/` outputs together.

## PoC results & VHS gotchas (2026-07-13)

Built and verified the pipeline end-to-end: `vhs/mock-install.sh` + two clips
(`install-domain-own.gif`, `install-success-pin.gif`). Both render cleanly; VHS
drives the interactive `gum choose` and `gum input` correctly. Two non-obvious
gotchas cost a render each — bake these into every future tape:

1. **Use `Wait+Screen /regex/`, never bare `Wait`.** Plain `Wait` matches only the
   *last line*. gum widgets redraw and multi-line boxes (plus the returned `>`
   shell prompt) push the target text off the last line, so bare `Wait` times out.
   `Wait+Screen` matches anywhere on the visible screen.
2. **Put a `gum choose` question in `--header`, not a separate `print` line.** The
   real script prints the prompt then pipes options to `gum choose`; but the choose
   widget redraws over that printed line, so it's neither visible on camera nor
   matchable by `Wait+Screen`. Passing it as `gum choose --header "…"` keeps it
   inside the widget — visible and matchable. (This is the one deliberate deviation
   from the real script's structure; text is unchanged.)

Note: gum `choose`/`input` widgets clear themselves on exit, so the *final* frame
won't show them — they play out mid-clip. QA by sampling frames with
`ffmpeg -ss <t> -i clip.gif -frames:v 1 frame.png`, not just the last frame.

### On-camera command convention

The harness invocation (`bash vhs/mock-install.sh …`) must NEVER appear on camera.
`Hide`/`Show` only pauses frame *capture* — it does not erase screen content — so
hiding the launch isn't enough on its own. Two cases:

- **Mid-wizard clips** (domain, docker, email, provisioning, success): show **no
  command at all** — in a real install you're just answering prompts at this point.
  Pattern: launch the stage inside a `Hide` block with `MOCK_CLEAR=1` (the mock
  `clear`s its own launch line), `Wait+Screen` for the first prompt, then `Show`.
  The clip opens directly on the wizard step. Verified working on both PoC clips.
- **`run` clip + hero**: these start from the shell, so they **do** show the real
  command — `curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash
  install.sh --network testnet` — typed on camera, driven behind the scenes by the
  mock (e.g. via aliasing `sudo`/`curl` + an `install.sh` symlink to the mock, set
  up in a `Hide` block). Never show `bash vhs/mock-install.sh`.

### Wait is edge-triggered AND freezes output (hard-won)

Two `Wait` behaviors bit the hero clip badly — know them:

1. **Edge-triggered:** `Wait` matches when the pattern *appears*, not if it's
   *already* on screen. `Sleep 4s; Wait+Screen /foo/` fails even when `foo` is
   visibly on screen — you missed the edge. Arm the `Wait` *before* the text renders.
2. **Freezes PTY output while active:** a `Wait` can't span a large autonomous
   output burst — the program blocks mid-render and never reaches the awaited text.

Consequences:
- **Mid-wizard clips work** because each launches straight into ~one prompt with
  minimal preceding output: `Enter` → `Wait+Screen /prompt/` (armed immediately) → match.
- **The hero can't use `Wait`** — `run_all` emits big bursts (banner, docker install,
  provisioning) between prompts. It uses **pure `Sleep` pacing**: the mock blocks at
  each prompt and keystrokes buffer in the PTY, so timed `Sleep`+input is reliable.
  Size sleeps with margin above the mock's known spinner durations.
- Modifier order is `Wait+Screen@30s /re/` (not `Wait@30s+Screen`).

## Build status (2026-07-13) — COMPLETE

All clips built, rendered, QA'd (frame-sampled), and embedded in
`docs/deployment/install.md`:

| Clip | Asset | Placement |
|---|---|---|
| hero | `full.webm` (544K, from `full.gif`) | top of page, `<video autoPlay loop muted>` |
| run | `run.gif` | §2 run the installer |
| docker | `docker.gif` | Install Docker? |
| domain-own | `domain-own.gif` | Configure your domain |
| domain-duckdns | `domain-duckdns.gif` | Configure your domain (variant) |
| email-watchtower | `email-watchtower.gif` | Email + Automatic updates |
| provisioning | `provisioning.gif` | §3 Let it finish |
| success-pin | `success-pin.gif` | §3 completion + PIN |

Hero shipped as **webm** (not gif) — the 35s gif was 2.0 MB; vp9 webm is ~0.5 MB.
Docusaurus 3.9.2 renders `.md` via MDX, so the `<video>` tag works. The only
remaining `📷` marker in `install.md` is the `/setup` **browser** screen (not VHS).

## Coordination note

`deployment/install.md` doesn't exist yet — the docs rewrite (per `DOCS-OUTLINE.md`) consolidates `quick-start` + `installation` + `vps-setup` into it. Clips can be **built in parallel** now (they only depend on the installer, not the docs), and **embedded** once that page lands. Tell the docs instance to relabel the two browser items (PIN login, Features pages) as screenshots, not VHS.
