---
sidebar_position: 2
---

# What You Need

Station runs on modest hardware. Here's what to get ready before you install.

## A server

You need a Linux server with a public IP address. The installer supports **Ubuntu 20.04 / 22.04** and **Debian 11 / 12**, and can set up Docker for you automatically on those systems.

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| CPU | 1 vCPU (x86) | 2 vCPUs |
| RAM | 1 GB | 4 GB |
| Storage | 10 GB + space for your music | 40 GB SSD |
| Network | Stable connection | 20 TB/mo traffic |

1 GB of RAM is enough to get started. 4 GB gives you comfortable headroom as your catalog and listenership grow.

### Where to get a server

Any VPS provider works. A few affordable options:

| Provider | Starting at | Notes |
|----------|-------------|-------|
| **[Cherry Servers](https://www.cherryservers.com/pricing/virtual-servers)** | ~$4/mo | Global regions, hourly billing available |
| **Netcup** | ~$4/mo | Budget option |
| **Contabo** | ~$6/mo | More resources for the money |
| **Hetzner** | ~$7/mo | Reliable and well-documented; free trial credits |

Prices are **starting points** and change with region, plan, and availability — the cheapest plans can sell out, so the real cost may be higher. Pick any plan that meets the minimums above.

[Spin up a server on Hetzner](https://hetzner.cloud/?ref=q50D7EEbjbcu) — this referral link includes free credits so you can try it without paying out of pocket. Or [compare providers](https://cloudcompare.xyz/) to find one that fits.

**Prefer to run from home?** You can, as long as your machine stays on, you can forward the required ports (see below), and you have a stable connection. Most artists choose a VPS for reliability.

## A domain name

Your server needs a domain so listeners can reach it securely over HTTPS. You have two options, and the installer supports both:

- **Your own domain (recommended)** — use any subdomain, e.g. `music.yourdomain.com`. Before installing, create an **A record** pointing that subdomain at your server's IP address. DNS changes can take anywhere from 5 to 60 minutes to take effect.
- **A free DuckDNS subdomain** — no domain of your own? The installer can set up a free [DuckDNS](https://www.duckdns.org/) subdomain. Create a DuckDNS account and subdomain first, and have your token ready.

:::note
The installer checks that your domain points to your server before continuing, and it provisions a free HTTPS certificate from Let's Encrypt automatically. You don't have to configure any of that yourself.
:::

## Ports

Make sure these ports are reachable from the internet. Most VPS providers leave them open by default.

| Port | Purpose |
|------|---------|
| 80 | HTTP — certificate validation and redirect to HTTPS |
| 443 | HTTPS — your dashboard and listener traffic |
| 4001 | Peer-to-peer networking (TCP) |
| 4002 | Peer-to-peer networking (QUIC / UDP) |

## Storage planning

How much space your music needs:

- **FLAC**: ~30–50 MB per track
- **MP3**: ~8–12 MB per track
- **Cover art**: ~1–5 MB each

**Example:** 50 FLAC tracks ≈ 2–3 GB.

## Next step

Got your server and domain ready? → [Install Station](../deployment/install.md)
