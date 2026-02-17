---
sidebar_position: 1
---

# Install Station

Get your Station server running in just a few minutes.

## Before You Install

### 1. Set Up Your Domain

Point a subdomain to your server:

**If you have a domain:**
1. Go to your DNS provider (Namecheap, Cloudflare, etc.)
2. Create an A record:
   ```
   your-subdomain.your-domain.com  →  your-server-ip
   ```
   Example: `music.myband.com → 203.0.113.42`

**For testing only:**
- Use [DuckDNS](https://duckdns.org) for a free subdomain
- The install script supports DuckDNS

### 2. Wait for DNS

Give DNS a few minutes to propagate (usually 5-15 minutes).

## Install

SSH into your server and run:

```bash
curl -sSL https://qnch.network/install | sudo bash
```

The install script will:
- Download and install Station
- Set up HTTPS with your domain
- Configure the server
- Connect you to the network

That's it. You're done.

## After Installation

Once the install completes, you'll see:

```
✓ Station installed successfully
✓ HTTPS configured
✓ Connected to the network

Your artist portal: https://your-subdomain.your-domain.com
```

Visit your artist portal to add music and configure your profile.

## Need a Server?

Don't have a server yet? Here are some affordable options:

| Provider | Price | Link |
|----------|-------|------|
| Hetzner | $5/month | [hetzner.com](https://hetzner.com) |
| Netcup | $4/month | [netcup.com](https://netcup.com) |
| Contabo | $6/month | [contabo.com](https://contabo.com) |

Any VPS with 1GB RAM and a public IP will work.

## Running from Home?

You can also run Station from a home server. You'll need:
- Port forwarding set up on your router (ports 4001 and 8080)
- A stable internet connection
- A computer that can stay on

## Troubleshooting

**Can't access the artist portal?**
Make sure port 8080 is open in your firewall.

**Server won't start?**
Check the logs: `journalctl -u station -f`

**Need help?**
Open an issue on [GitHub](https://github.com/station/station/issues)
