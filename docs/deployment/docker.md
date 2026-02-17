---
sidebar_position: 2
---

# Docker Deployment

Want to run Station in Docker? Here's the simple way.

## Quick Start

Pull and run:

```bash
docker pull station/station:latest

docker run -d \
  --name station \
  -p 4001:4001 \
  -p 8080:8080 \
  -v ~/.station:/data \
  station/station:latest
```

Access the portal at `https://your-subdomain.your-domain.com`

(Make sure to set up DNS and configure your reverse proxy for HTTPS)

## Docker Compose

Create `docker-compose.yml`:

```yaml
version: '3.8'

services:
  station:
    image: station/station:latest
    container_name: station
    restart: unless-stopped
    ports:
      - "4001:4001"
      - "8080:8080"
    volumes:
      - ./music:/data/music
```

Start it:

```bash
docker-compose up -d
```

## That's It

Docker automatically handles:
- Service management
- Automatic restarts
- Network isolation

## Troubleshooting

**Container won't start?**
```bash
docker logs station
```

**Port conflicts?**
```bash
docker ps | grep 4001
```
