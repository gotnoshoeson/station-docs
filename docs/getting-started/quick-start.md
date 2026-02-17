---
sidebar_position: 2
---

# Quick Start

Get a Station server running in under 5 minutes.

## 1. Get a Server

You need a VPS with a public IP address. [Spin up a free cloud server on Hetzner](https://hetzner.cloud/?ref=q50D7EEbjbcu) to get started.

Choose any Linux distribution (Ubuntu or Debian recommended), the smallest tier works fine.

## 2. Install Station

SSH into your server and run:

```bash
sudo curl -sSL https://qnch.network/install | bash
```

The interactive setup will walk you through everything. Here's what it handles:

- **DuckDNS domain** — Your server needs a public domain for HTTPS. The setup registers a free [DuckDNS](https://duckdns.org) subdomain and points it at your server's IP so you don't need to buy a domain name.
- **TLS certificates** — Automatically provisions HTTPS via Let's Encrypt using your DuckDNS domain.
- **Reverse proxy** — Configures Traefik to route traffic and terminate TLS.
- **Station binary** — Downloads and installs the latest Station release.
- **Systemd service** — Registers Station as a system service so it starts on boot and restarts on failure.
- **Network connection** — Connects your server to the Station peer-to-peer network so listeners can discover you.

Follow the prompts and your server will be live in a few minutes.

## What's Next?

Your Station server is running. Now you can:

- **Upload your music** — Visit your self-hosted artist dashboard at the domain the setup gave you to upload tracks and manage your catalog.
- **Discover your music** — Find your station on the listener app at [beta.qnch.network](https://beta.qnch.network).
