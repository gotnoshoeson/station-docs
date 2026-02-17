---
sidebar_position: 1
---

# CLI Commands

Complete reference for Station command-line interface.

## Global Flags

Available for all commands:

```bash
--config string      Path to config file (default: ~/.station/config.yaml)
--log-level string   Log level: debug, info, warn, error (default: info)
--help, -h          Show help
--version, -v       Show version
```

## station init

Initialize Station configuration.

```bash
station init [flags]
```

### Flags

```bash
--force          Overwrite existing config file
--artist string  Set artist name during initialization
```

### Examples

```bash
# Create default config
station init

# Initialize with artist name
station init --artist my-artist-name

# Force overwrite existing config
station init --force
```

## station start

Start the Station server.

```bash
station start [flags]
```

### Flags

```bash
--port int              HTTP API port (default: 8080)
--libp2p-port int      libp2p port (default: 4001)
--bootstrap strings    Bootstrap peer multiaddrs
--music-dir string     Music directory path
```

### Examples

```bash
# Start with default settings
station start

# Start on custom port
station start --port 9000

# Start with custom music directory
station start --music-dir /mnt/music

# Start with debug logging
station start --log-level debug
```

## station peers

Show connected peers.

```bash
station peers [flags]
```

### Flags

```bash
--verbose, -v    Show detailed peer information
--json          Output as JSON
```

### Examples

```bash
# List connected peers
station peers

# Show detailed peer info
station peers --verbose

# Output as JSON
station peers --json
```

## station stats

Display server statistics.

```bash
station stats
```

### Output

```
Station Server Stats
├── Uptime: 2h 15m
├── Peers: 5
├── Albums: 3
├── Tracks: 28
├── Active Streams: 2
├── Total Bandwidth: 150MB
└── Memory Usage: 45MB
```

## station albums

Manage albums.

```bash
station albums [command]
```

### Subcommands

```bash
list              List all albums
add <path>        Add album from directory
remove <id>       Remove album by ID
refresh           Refresh album metadata
```

### Examples

```bash
# List all albums
station albums list

# Add new album
station albums add /path/to/album

# Remove album
station albums remove album-id-123

# Refresh all metadata
station albums refresh
```

## station config

View and modify configuration.

```bash
station config [command]
```

### Subcommands

```bash
show              Display current configuration
set <key> <val>   Set configuration value
get <key>         Get configuration value
```

### Examples

```bash
# Show full config
station config show

# Set artist name
station config set artist.name my-artist

# Get server port
station config get server.port
```

## station version

Show version information.

```bash
station version
```

### Output

```
Station v1.0.0
Git commit: abc123def
Build date: 2024-02-14
Go version: go1.21.5
OS/Arch: linux/amd64
```

## Environment Variables

Override config via environment variables:

```bash
STATION_CONFIG          Config file path
STATION_PORT           HTTP API port
STATION_LIBP2P_PORT    libp2p port
STATION_MUSIC_DIR      Music directory
STATION_ARTIST_NAME    Artist identifier
STATION_LOG_LEVEL      Log level
```

### Example

```bash
export STATION_PORT=9000
export STATION_LOG_LEVEL=debug
station start
```

## Exit Codes

- `0` - Success
- `1` - General error
- `2` - Configuration error
- `3` - Network error
- `4` - Storage error

## Next Steps

- [Configuration Reference](./configuration.md) - Detailed config options
- [API Reference](./api.md) - HTTP API endpoints
