---
sidebar_position: 2
---

# Managing Your Server

Station runs as a set of Docker containers managed by Docker Compose — your Station node, a Traefik reverse proxy for HTTPS, Watchtower for updates, and ETH-RPC. There's no separate `station` system service to manage.

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

The containers are `station` (your node), `traefik` (HTTPS), `watchtower` (updates), and `eth-rpc`. ETH-RPC keeps a copy of the chain's transactions for your node. It stays idle until you pick a chain that uses it.

```bash
docker compose -f docker-compose.yml logs -f station
docker compose -f docker-compose.yml logs -f traefik
docker compose -f docker-compose.yml logs -f eth-rpc
```

## Get a new setup PIN

Your dashboard login PIN is short-lived. If it expired before you logged in, generate a new one:

```bash
docker compose -f docker-compose.yml restart station
docker compose -f docker-compose.yml logs station | grep -oE '[0-9]{3}-[0-9]{3}' | tail -1
```

Then enter it at `https://your-domain.com/setup`.

## Reset your dashboard login

If you've lost your dashboard password, reset the login from the server. Your music, sales and settings stay as they are; only the login is replaced.

```bash
docker compose -f docker-compose.yml stop station
docker compose -f docker-compose.yml run --rm --no-deps station station reset-auth --data-dir /data
docker compose -f docker-compose.yml start station
docker compose -f docker-compose.yml logs station | grep -oE '[0-9]{3}-[0-9]{3}' | tail -1
```

The node has to be stopped first: the reset can't open its data while the node is running. The last line prints the setup PIN the node creates when it starts again. Enter it at `https://your-domain.com/setup` and create a new login.

## Updates

Station checks for a new version every 6 hours. By default it only tells you: the news appears in **Settings → Software Updates** in your dashboard, and nothing changes on your server until you act.

If you'd rather your node update itself, choose **Auto-update** in [Settings → Software Updates](../features/settings.md#software-updates). Station then asks **Watchtower** to update its containers when a new version is out. Watchtower is always installed, but it never updates anything on its own. It waits for Station to ask, and it leaves Traefik alone.

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

Ask in the [Station Telegram group](https://t.me/+EwzB7vuSRZozYTEx), or open an issue on [GitHub](https://github.com/gotnoshoeson/station-docs/issues).
