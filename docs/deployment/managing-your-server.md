---
sidebar_position: 2
---

# Managing Your Server

Station runs as a set of Docker containers managed by Docker Compose — your Station node, a Traefik reverse proxy for HTTPS, and (optionally) Watchtower for automatic updates. There's no separate `station` system service to manage.

Run all the commands below from the directory where you ran the installer — the one containing `docker-compose.yml`.

## Everyday commands

```bash
# See what's running
docker compose -f docker-compose.yml ps

# Follow the logs (Ctrl+C to stop)
docker compose -f docker-compose.yml logs -f

# Restart everything
docker compose -f docker-compose.yml restart

# Stop, then start again
docker compose -f docker-compose.yml stop
docker compose -f docker-compose.yml up -d
```

## Logs for a single service

The containers are `station` (your node), `traefik` (HTTPS), and — if you enabled it — `watchtower` (updates):

```bash
docker compose -f docker-compose.yml logs -f station
docker compose -f docker-compose.yml logs -f traefik
```

## Get a new setup PIN

Your dashboard login PIN is short-lived. If it expired before you logged in, generate a new one:

```bash
docker compose -f docker-compose.yml restart station
docker compose -f docker-compose.yml logs station | grep -oE '[0-9]{3}-[0-9]{3}' | tail -1
```

Then enter it at `https://your-domain.com/setup`.

## Updates

If you enabled **Watchtower** during install, your Station node updates itself automatically — it checks for new versions every few hours and only touches the Station container. You can also manage updates from the dashboard.

To update manually at any time, pull the latest images and recreate the containers:

```bash
docker compose -f docker-compose.yml pull
docker compose -f docker-compose.yml up -d
```

## Starts on boot automatically

The containers are set to restart on their own, so Station comes back up after a reboot or a crash — no action needed.

## Troubleshooting

**A container keeps restarting**

Check its logs to see why: `docker compose -f docker-compose.yml logs station` (or `traefik`).

**HTTPS or certificate problems**

Look at the Traefik logs: `docker compose -f docker-compose.yml logs traefik`. Make sure ports 80 and 443 are open and your domain still points to this server.

**Need help?**

Open an issue on [GitHub](https://github.com/station/station/issues).
