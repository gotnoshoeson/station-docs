---
sidebar_position: 2
---

# What You Need

Station is designed to run on minimal hardware. You don't need much.

## Server Requirements

**Minimum:**
- 1GB RAM
- 10GB storage + space for your music
- Stable internet connection
- **A domain name** (highly recommended)

**That's it.**

Any cheap VPS will work. Even a home computer.

## Domain Name

You'll need a domain to access your artist portal securely via HTTPS.

**Options:**
- **Own domain**: Use any subdomain like `music.yourdomain.com` or `station.yourdomain.com`
- **DuckDNS** (testing only): Free dynamic DNS if you just want to try the beta

You'll point an A record to your server IP before installation.

## Recommended VPS Providers

| Provider | Price | Best For |
|----------|-------|----------|
| **Hetzner** | $5/month | Most artists (recommended) |
| **Netcup** | $4/month | Budget option |
| **Contabo** | $6/month | More resources |
| **OVHCloud** | $15/month | Enterprise needs |

## Storage

How much space do you need?

- **FLAC**: ~30-50MB per track
- **MP3**: ~8-12MB per track
- **Covers**: ~1-5MB each

**Example**: 50 tracks = ~2-3GB

## Running from Home?

You can run Station from home if:
- Your computer can stay on
- You can forward ports on your router
- You have a stable connection

Most artists prefer a VPS for reliability.

## Next Steps

Got your server? → [Install Station](../running-server/installation.md)
