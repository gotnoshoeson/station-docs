---
sidebar_position: 3
---

# Systemd Service

The install script already set up Station as a systemd service. Here's how to manage it.

## Basic Commands

```bash
# Check status
systemctl status station

# View logs
journalctl -u station -f

# Restart server
systemctl restart station

# Stop server
systemctl stop station
```

That's all you need to know.

## Auto-Start on Boot

Station automatically starts when your server boots. No configuration needed.

## Troubleshooting

**Service won't start?**
```bash
journalctl -u station -e
```

**Permission issues?**
```bash
sudo chown -R station:station ~/.station
```
