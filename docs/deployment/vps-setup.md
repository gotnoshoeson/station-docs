---
sidebar_position: 1
---

# Deploy to a VPS

Running Station on a VPS gives you a reliable, always-on server for streaming your music.

## Get a VPS

Pick any cheap VPS provider:

| Provider | Price | Link |
|----------|-------|------|
| **Hetzner** | $5/month | [hetzner.com](https://hetzner.com) |
| **Netcup** | $4/month | [netcup.com](https://netcup.com) |
| **Contabo** | $6/month | [contabo.com](https://contabo.com) |

**Recommended:** Hetzner CPX11 (2GB RAM, $5/month)

When creating your VPS, choose **Ubuntu 22.04** or newer.

## Set Up DNS

Before installing, point a subdomain to your server:

1. Get your server IP from your VPS provider
2. Go to your DNS provider (Namecheap, Cloudflare, etc.)
3. Create an A record:
   ```
   music.yourdomain.com  →  your-server-ip
   ```

Wait 5-15 minutes for DNS to propagate.

## Install Station

SSH into your server:

```bash
ssh root@your-server-ip
```

Run the install script:

```bash
curl -sSL https://qnch.network/install | sudo bash
```

The script will prompt you for your domain and set up HTTPS automatically.

Done. Your server is now running.

## Access Your Portal

Visit:

```
https://music.yourdomain.com
```

Upload music and configure your profile from there.

## Troubleshooting

**Can't access the portal?**
- Verify your DNS A record is correct
- Wait a few more minutes for DNS propagation
- Check the domain you entered during installation

**Server not responding?**
```bash
systemctl status station
journalctl -u station -f
```

**Need help?**
[Open an issue on GitHub](https://github.com/station/station/issues)
