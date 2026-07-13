# Station Docs — Restructure Outline

> Working reference for the docs cleanup. Not published (lives at repo root, outside `docs/`).
> Last updated: 2026-07-13.

## Goal

Three clear top-level sections with no overlap:

1. **Getting Started** — a general overview of Station and the setup process, plus what to prepare *before* deploying. Orientation, not step-by-step.
2. **Deployment** — the one authoritative walkthrough: run the `curl` install command, answer the CLI prompts, use the printed PIN to create a dashboard login.
3. **Features** *(new)* — a page per dashboard screen, in side-menu order: Dashboard, Catalog, New Release, Storefront, Fan Club, Treasury, Settings.

---

## Build-out status (2026-07-13) — DONE, `npm run build` passes (no broken links)

**Built:**
- Getting Started: `introduction.md` (trimmed to overview + testnet), `what-you-need.md` (specs 1 GB/4 GB + providers + domain/DNS + ports).
- Deployment: `install.md` (real wizard flow → PIN → `/setup`), `managing-your-server.md` (docker compose).
- Features: all 7 pages (Dashboard, Catalog, New Release, Storefront, Fan Club, Treasury, Settings) written from the real artist-portal source in `~/code/station/web/artist-portal/`. Each still carries `> 📷 **Screenshot needed:**` markers for you to fill.
  - Found + fixed an in-app copy bug: Catalog's "No purchase path" tooltip says to set the universal track price "under Settings," but it's actually on **Storefront**. Docs point to Storefront; worth fixing the app tooltip too.
- Deleted: `quick-start`, all of `running-server/`, `deployment/docker`, all of `reference/`.
- `sidebars.ts` rewritten; `docusaurus.config.ts` footer link fixed + domains → qnch.network.

**Waiting on you:**
- **Screenshots** — grep the docs for `📷` to find all placeholders (CLI prompts, `/setup` login, 7 dashboard pages). Drop images in `static/img/…` and replace the marker with `![alt](/img/…)`.
- **Features content** — the 7 stubs are scaffolding; the "What you'll find here" bullets are best-guess and marked Draft. Confirm/flesh out with real details.

**Two things I changed on judgment — confirm or correct:**
- `docusaurus.config.ts` `url` set to `https://docs.qnch.network` (guessed the docs subdomain from the qnch.network decision). Change if the docs deploy elsewhere.
- **GitHub URLs left as `github.com/station/station`** (navbar, footer, in-page "open an issue" links). The container image is `ghcr.io/gotnoshoeson/station`, so the real org may be `gotnoshoeson` — didn't want to guess a URL that 404s. Give me the correct repo and I'll update all of them.

---

## Current state audit

### What's actually maintained vs. stale

From `git log`, only **4 files** have changed since the initial commit — these reflect current reality (testnet, `qnch.network` install script):

- `getting-started/introduction.md`
- `getting-started/quick-start.md`
- `running-server/installation.md`
- `deployment/vps-setup.md`

Everything else is **untouched since the initial scaffold** and is stale, duplicative, or fabricated:

- `getting-started/system-requirements.md`
- `running-server/configuration.md` ("Adding Your Music")
- `running-server/first-run.md` ("Your Server is Running")
- `deployment/docker.md`
- `deployment/systemd.md`
- `reference/cli-commands.md`, `reference/configuration.md`, `reference/api.md`

### Current sidebar

```
Getting Started
  ├─ getting-started/introduction      (Welcome to Station)
  ├─ getting-started/quick-start       (Quick Start)
  ├─ getting-started/system-requirements (What You Need)
  ├─ running-server/installation       (Install Station)
  ├─ running-server/configuration      (Adding Your Music)
  └─ running-server/first-run          (Your Server is Running)
Deployment
  ├─ deployment/vps-setup              (Deploy to a VPS)
  ├─ deployment/docker                 (Docker Deployment)
  └─ deployment/systemd                (Systemd Service)
Reference
  ├─ reference/cli-commands
  ├─ reference/configuration
  └─ reference/api
```

Note: the "Getting Started" sidebar category actually pulls in 3 pages from the `running-server/` folder — so the folder structure and the sidebar labels already don't match.

---

## Ground truth — what `install.sh` actually does (verified 2026-07-13)

Read directly from `https://qnch.network/install.sh` (Setup Wizard; a copy is saved in the session scratchpad). This is the source of truth for the Deployment section.

**Command & flags**
- `curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet`
- Must run as **root/sudo**. Script self-installs `gum` for nicer prompts (falls back to plain prompts).
- `--network production|testnet|local` (default **production**; testnet passes `--network testnet`).
- `--chain …` optional — normally left unset; the chain is chosen **in the dashboard** after first login.

**Stated prerequisites (printed by the script)**
- Ubuntu 20.04/22.04 or Debian 11/12 VPS · root/sudo · ports **80, 443, 4001, 4002** reachable from the internet · domain A record pointing at the server (or a DuckDNS account).

**Interactive prompts, in order**
1. *(only if a previous `.env` exists)* "Do you want to reconfigure?" [default **no**] — otherwise it just tells you to `docker compose … up -d`.
2. *(if Docker missing)* "Install Docker automatically?" [default **yes**]. Auto-install is Ubuntu/Debian only; otherwise install Docker manually and re-run.
3. *(if ports 80/443 busy)* "Stop these services and continue?" [default **no**].
4. "How would you like to configure your domain?" → **Own domain** or **DuckDNS (free dynamic DNS)**.
   - Own domain: auto-detects the server's public IP, then "Enter your domain:". Validates format + that DNS resolves to this server; if not, prints the exact A record to create (Type A / Name / Value = server IP / TTL 300) and offers "Try again after configuring DNS?".
   - DuckDNS: "Have you created a DuckDNS account and subdomain?" → "Enter your DuckDNS subdomain:" → "Enter your DuckDNS token:"; it updates DuckDNS automatically.
5. "Enter email address:" — for Let's Encrypt expiry notices (optional; falls back to `admin@<domain>`).
6. "Enable automatic updates via Watchtower?" [default **yes**] — checks every 6h, updates only the Station container, can be turned off later in the dashboard.

**Then, no more prompts:** creates `data/ traefik/ logs/`, generates `docker-compose.yml`, `.env`, `traefik/traefik.yml`, `traefik/dynamic.yml`, runs `docker compose up -d` (pulls images, starts **Traefik + Station + optional Watchtower**), waits for Traefik, provisions a **Let's Encrypt** cert (30–90s), waits for Station health, then extracts the **`XXX-XXX` setup PIN** from the Station container logs.

**Final output → the flow we document**
- "✓ Setup completed successfully!" then a NEXT STEPS box:
  1. Open **`https://<your-domain>/setup`**
  2. Enter PIN **`XXX-XXX`**
  3. Use the dashboard to upload your music
  4. Share your **namespace** with listeners
- Useful commands it prints: `docker compose -f docker-compose.yml logs -f`, `… ps`; PIN expired → `… restart station` then grep logs for `[0-9]{3}-[0-9]{3}`.

**Architecture facts (for accuracy across the docs)**
- Orchestration: **Docker Compose**. Containers: `station-traefik`, `station-node` (image `ghcr.io/gotnoshoeson/station:<version>`), optional `station-watchtower`. Network `station-network` (172.20.0.0/24).
- **Host ports:** 80 + 443 (Traefik/HTTPS), 4001/tcp + 4002/udp (libp2p). Port **8080 is internal-only** (Station behind Traefik) — never exposed to the host.
- HTTPS/TLS via Traefik + Let's Encrypt (production certs). Browser libp2p uses `wss` on 443.
- Config lives in the **install directory**: `.env` + `traefik/*.yml`. Data in `./data`. **No `~/.station/config.yaml`.** The binary is flag/env-configured (`station start --data-dir /data --port 8080`), no YAML config file.
- Current version is pre-1.0 (`version.json`, fallback `0.1.0-rc.4`).

**Corrections the current docs MUST make**
- ❌ **systemd** everywhere (`systemctl status station`, `journalctl -u station -f`, "Systemd service" success line) → ✅ **Docker Compose** commands, run from the install dir.
- ❌ "open port **8080**" / "ports 4001 and 8080" → ✅ **80, 443, 4001, 4002**.
- ❌ portal at `https://<domain>` (root) with no login → ✅ **`https://<domain>/setup`** + **PIN** login.
- ❌ "artist portal" only → ✅ it's the **dashboard**; listeners get a **namespace**.
- ❌ Reference CLI (`station init/peers/albums/config`), `config.yaml`, `/api/v1` HTTP API, `v1.0.0`/2024 dates → all fabricated; deleting the Reference section.

---

## Problems identified

### 1. The install command is duplicated 4×

```
curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet
```

appears in `introduction.md`, `quick-start.md`, `installation.md`, and `vps-setup.md`. Every future edit (like the two recent "fix install command" commits) has to be made in four places.

### 2. The testnet callout is duplicated 4×

Same `:::tip Testnet is live` block, reworded slightly, in the same four files.

### 3. VPS provider / spec tables duplicated and *conflicting*

| File | RAM | CPU | Storage |
|------|-----|-----|---------|
| `quick-start.md` | **4 GB** | 2 vCPU | 40 GB |
| `system-requirements.md` | **1 GB** | — | 10 GB |
| `installation.md` | **1 GB** | — | — |

Three different minimums. Provider tables (Hetzner/Netcup/Contabo/OVH) are repeated in `quick-start`, `system-requirements`, `installation`, and `vps-setup` with slightly different prices and links. **Need one source of truth.**

### 4. DNS / domain prep duplicated

`installation.md`, `vps-setup.md`, and `quick-start.md` each explain A records + DuckDNS + propagation waits separately.

### 5. "Access your portal / upload music" duplicated 3×

`running-server/configuration.md`, `running-server/first-run.md`, and the tail of `quick-start.md`/`installation.md` all cover "visit the portal, upload an album." None mention the actual PIN login flow.

### 6. Stale / inconsistent domains

- Maintained files use `qnch.network` (install) and `beta.qnch.network` (listener app).
- Stale files use `listen.station.fm` (introduction.md, first-run.md), `station.fm`, `docs.station.fm`, `bootstrap.station.fm` (reference/*), `app.station.fm` (reference/api.md).
- **Open question:** which domain is canonical going forward? (See Open Decisions.)

### 7. The entire Reference section is fabricated

`cli-commands.md`, `configuration.md`, and `api.md` describe a `station init` / `station start` CLI, a `~/.station/config.yaml` schema, and an HTTP API — none of which match the current reality (a `curl` install script that sets up a systemd service + a web dashboard with PIN login). Version strings say `v1.0.0`, build dates say `2024`. This reads as leftover Docusaurus-template filler. **Does not describe the real product.**

### 8. No coverage of the real product surface

- **Nothing** documents the PIN → dashboard login flow.
- **Nothing** documents the dashboard pages (Dashboard, Catalog, New Release, Storefront, Fan Club, Treasury, Settings).
- The CLI install prompts aren't shown step-by-step (screenshots would help).

---

## Proposed new structure

```
Getting Started
  ├─ introduction        What Station is, why, how setup works at a glance
  └─ what-you-need        Server specs + providers + domain/DNS prep (SINGLE SOURCE)
Deployment
  ├─ install              The one walkthrough: curl → CLI prompts (incl. Docker yes/no) → PIN → dashboard login
  └─ managing-your-server docker compose ps/logs/restart + updates (Station runs on Docker Compose, NOT systemd)
Features
  ├─ dashboard
  ├─ catalog
  ├─ new-release
  ├─ storefront
  ├─ fan-club
  ├─ treasury
  └─ settings
Reference        (see Open Decisions — likely removed or rewritten)
```

### Page-by-page plan

#### Getting Started

**`introduction`** *(rewrite of `getting-started/introduction.md`)*
- What is Station / Why Station (keep the current framing — it's good).
- Keep the testnet callout **here only**.
- Add a short "How setup works" overview: (1) get a server, (2) run one install command, (3) log into your dashboard with the PIN. Link to Deployment for the actual steps.
- **Remove** the inline install command and the "What You Need" bullet list (they move to `what-you-need` / Deployment). Keep one link to the listener app.

**`what-you-need`** *(merge of `system-requirements.md` + the "Get a Server" specs from `quick-start.md`)*
- One authoritative server-spec table (resolve the 1 GB vs 4 GB conflict — **need confirmation of real minimums**).
- One provider table (Hetzner referral link + cloudcompare, from current quick-start).
- Domain + DNS prep: A record, DuckDNS fallback, propagation wait — explained once.
- "Running from home" note.

*Result: Getting Started = orientation + prep only. No install command, no PIN flow.*

#### Deployment

**`install`** *(consolidation of `quick-start.md` + `installation.md` + `vps-setup.md`; matches the real wizard — see Ground Truth below)*
- Prereq recap: Ubuntu 20.04/22.04 or Debian 11/12, root/sudo, ports 80/443/4001/4002 open, domain A record already pointing at the server (link back to `what-you-need`).
- Step 1 — open a terminal / console on your server (SSH or provider web console); you'll run as root/sudo.
- Step 2 — run the install command *(defined once, here)*.
- Step 3 — walk through the wizard prompts, in order: install Docker? → (port conflict?) → domain (own domain vs DuckDNS) → email for Let's Encrypt → enable Watchtower auto-updates? **CLI screenshots go here.**
- Step 4 — the wizard pulls images, starts the containers, provisions the TLS cert, and prints a **`XXX-XXX` setup PIN**.
- Step 5 — open **`https://<your-domain>/setup`**, enter the PIN, create your login. **Screenshot of the login screen.**
- Where to go next → Features. Mention: share your **namespace** with listeners (listener app at beta.qnch.network).
- Troubleshooting (folded + corrected — Docker-Compose-based, not systemd; cert/DNS timeouts; PIN-expired reset).

**`managing-your-server`** *(replaces `systemd.md` — its content is wrong)*
- Station runs as **Docker Compose** services (`station-traefik`, `station-node`, optional `station-watchtower`), **not** a systemd unit. Run these from the install directory (where `docker-compose.yml` was generated):
  - Status: `docker compose -f docker-compose.yml ps`
  - Logs: `docker compose -f docker-compose.yml logs -f`
  - Restart / stop: `docker compose -f docker-compose.yml restart` / `stop`
  - Start (after a reconfigure exit): `docker compose -f docker-compose.yml up -d`
- Get a fresh PIN if it expired: `docker compose ... restart station` then grep logs for `[0-9]{3}-[0-9]{3}`.
- Updates: automatic via Watchtower (every 6h) if enabled at install, or manually via the dashboard. Auto-start on boot is handled by `restart: unless-stopped` on the containers + Docker's own systemd service.

#### Features *(all new — content + screenshots to be supplied)*

One page each, in side-menu order. Suggested shared shape per page: what it's for → key actions → screenshot(s) → tips.

1. **`dashboard`** — landing/overview screen: stats, at-a-glance state.
2. **`catalog`** — browse/manage existing releases & tracks.
3. **`new-release`** — upload flow: tracks, cover art, metadata, publish.
4. **`storefront`** — public-facing page / how listeners see the artist.
5. **`fan-club`** — membership / supporter features.
6. **`treasury`** — payments / earnings / payouts.
7. **`settings`** — profile, account, server config surfaced in the UI.

> Placeholders to be filled from screenshots + notes you provide.

---

## Content moves (single source of truth)

| Topic | New home | Removed from |
|-------|----------|--------------|
| Install command | `deployment/install` | introduction, quick-start, vps-setup |
| Testnet callout | `getting-started/introduction` | quick-start, installation, vps-setup |
| Server specs table | `getting-started/what-you-need` | quick-start, installation |
| Provider table | `getting-started/what-you-need` | system-requirements, installation, vps-setup |
| DNS / domain prep | `getting-started/what-you-need` (prep) + brief recap in `deployment/install` | installation, vps-setup, quick-start |
| Portal / upload music | `features/new-release` + `features/catalog` | running-server/configuration, first-run |
| Server management (docker compose) | `deployment/managing-your-server` | replaces the wrong systemd/systemctl content |

---

## Screenshots needed (you'll provide)

- [ ] CLI install prompts (DNS question, domain entry, progress, completion + PIN) → `deployment/install`
- [ ] Dashboard PIN login screen → `deployment/install`
- [ ] Each dashboard page (7 total) → `features/*`

Screenshots go in `static/img/` (e.g. `static/img/features/catalog.png`) and are referenced with `![alt](/img/features/catalog.png)`.

---

## Decisions (settled 2026-07-13)

1. **Reference section** → **REMOVE entirely.** Delete `cli-commands`, `configuration`, `api`, and the Reference sidebar category. Fabricated / misleading; real reference docs can come later.
2. **Docker deployment page** → **REMOVE.** *(Revised after reading the script.)* Docker is not a separate deployment path — the wizard prompts "Install Docker automatically?" and runs everything via Docker Compose. So there's no standalone Docker page; the Docker prompt is documented as one step in `deployment/install`.
3. **Canonical domain** → **`qnch.network`** (and `beta.qnch.network` for the listener app). Fix all stale `station.fm` references and update `docusaurus.config.ts` (`url`, footer links, GitHub org/repo if applicable).
4. **Server specs** → **1 GB RAM minimum / 4 GB recommended** (4 GB = 2 vCPU, 40 GB SSD as the comfortable target). State both in `what-you-need`. *(Note: the script's own stated prereq is Ubuntu 20.04/22.04 or Debian 11/12 — reflect that OS list.)*

### Still to confirm
- **Page slugs / naming**: OK to rename `system-requirements` → `what-you-need`, drop the `running-server/` folder, and delete `quick-start` as a standalone (content merges into `deployment/install`)? Add redirects if any of these URLs are already shared publicly.

---

## Edit plan (once approved)

| File | Action |
|------|--------|
| `getting-started/introduction.md` | Rewrite (trim to overview + testnet) |
| `getting-started/system-requirements.md` | Rewrite → `what-you-need.md` (merge specs) |
| `getting-started/quick-start.md` | Delete (content → `deployment/install`) |
| `running-server/installation.md` | Delete (content → `deployment/install`) |
| `running-server/configuration.md` | Delete (content → Features) |
| `running-server/first-run.md` | Delete (content → Features / Deployment) |
| `deployment/vps-setup.md` | Rewrite → `deployment/install.md` (real wizard flow + PIN/setup) |
| `deployment/systemd.md` | Rewrite → `deployment/managing-your-server.md` (**docker compose**, not systemctl) |
| `deployment/docker.md` | **Delete** — Docker isn't a separate path; it's one prompt in the wizard |
| `reference/*` | Delete all three + Reference category |
| `features/*.md` | Create 7 new pages |
| `sidebars.ts` | Rewrite to match new structure |
| `docusaurus.config.ts` | Update footer links + domains (pending decision #3) |
