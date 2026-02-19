---
sidebar_position: 2
---

# Quick Start

Get a Station server running in under 5 minutes.

## 1. Get a Server

You need a VPS with a public IP address running Linux (Ubuntu or Debian recommended). Any provider works — here are the minimum specs:

| Resource | Minimum |
|----------|---------|
| Type | Shared (VPS) |
| CPU | x86, 2 vCPUs |
| RAM | 4 GB |
| Storage | 40 GB SSD |
| Traffic | 20 TB/mo |

[Spin up a cloud server on Hetzner](https://hetzner.cloud/?ref=q50D7EEbjbcu) — this link includes free credits so you can test the waters without paying out of pocket. You can also [compare providers](https://cloudcompare.xyz/) to find one that works for you.

## 2. Install Station

Open a terminal on your server and run the install command below. Most cloud providers offer a web-based console you can launch directly from their dashboard — no extra setup needed. Alternatively, you can connect via [SSH](https://www.cloudflare.com/learning/access-management/what-is-ssh/) if you're comfortable with it.

```bash
sudo curl -sSL https://qnch.network/install | bash
```

The interactive setup will walk you through everything. Here's what it handles:

- **DNS setup** — Your server needs a public domain for HTTPS. If you have your own domain, you can point it at your server's IP. Otherwise, the setup can register a free [DuckDNS](https://duckdns.org) subdomain as a fallback.
- **TLS certificates** — Automatically provisions HTTPS via Let's Encrypt using your domain.
- **Reverse proxy** — Configures Traefik to route traffic and terminate TLS.
- **Station binary** — Downloads and installs the latest Station release.
- **Systemd service** — Registers Station as a system service so it starts on boot and restarts on failure.
- **Network connection** — Connects your server to the Station peer-to-peer network so listeners can discover you.

Follow the prompts and your server will be live in a few minutes.

## What's Next?

Your Station server is running. Now you can:

- **Upload your music** — Visit your self-hosted artist dashboard at the domain the setup gave you to upload tracks and manage your catalog.
- **Discover your music** — Find your station on the listener app at [beta.qnch.network](https://beta.qnch.network).
