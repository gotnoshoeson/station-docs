---
sidebar_position: 2
---

# Configuration Reference

Complete reference for Station configuration file (`~/.station/config.yaml`).

## Configuration File Structure

```yaml
artist:
  name: string
  display_name: string
  bio: string
  profile_image: string

server:
  port: number
  host: string
  max_concurrent_streams: number

libp2p:
  port: number
  bootstrap_peers: array
  announce_addresses: array
  enable_mdns: boolean

storage:
  music_dir: string
  metadata_db: string
  cache_dir: string

logging:
  level: string
  format: string
  output: string
```

## Artist Configuration

### artist.name

**Type**: `string`
**Required**: Yes
**Description**: Unique identifier for your artist profile. Must be lowercase, alphanumeric with hyphens.

**Example**:
```yaml
artist:
  name: "my-artist-name"
```

### artist.display_name

**Type**: `string`
**Required**: No
**Default**: Value of `artist.name`
**Description**: Human-readable artist name shown to listeners.

**Example**:
```yaml
artist:
  display_name: "My Artist Name"
```

### artist.bio

**Type**: `string`
**Required**: No
**Description**: Artist biography/description (markdown supported).

**Example**:
```yaml
artist:
  bio: "Independent musician creating electronic soundscapes."
```

### artist.profile_image

**Type**: `string`
**Required**: No
**Description**: Path to artist profile image (relative to config or absolute).

**Example**:
```yaml
artist:
  profile_image: "~/.station/images/profile.jpg"
```

## Server Configuration

### server.port

**Type**: `number`
**Required**: No
**Default**: `8080`
**Description**: HTTP API server port.

**Example**:
```yaml
server:
  port: 8080
```

### server.host

**Type**: `string`
**Required**: No
**Default**: `"0.0.0.0"`
**Description**: Server bind address. Use `0.0.0.0` to listen on all interfaces.

**Example**:
```yaml
server:
  host: "0.0.0.0"
```

### server.max_concurrent_streams

**Type**: `number`
**Required**: No
**Default**: `50`
**Description**: Maximum number of concurrent audio streams.

**Example**:
```yaml
server:
  max_concurrent_streams: 100
```

## libp2p Configuration

### libp2p.port

**Type**: `number`
**Required**: No
**Default**: `4001`
**Description**: Port for libp2p peer-to-peer networking.

**Example**:
```yaml
libp2p:
  port: 4001
```

### libp2p.bootstrap_peers

**Type**: `array` of multiaddrs
**Required**: No
**Default**: Official Station bootstrap nodes
**Description**: List of bootstrap peers to connect to on startup.

**Example**:
```yaml
libp2p:
  bootstrap_peers:
    - "/ip4/bootstrap.station.fm/tcp/4001/p2p/12D3KooW..."
    - "/ip4/bootstrap2.station.fm/tcp/4001/p2p/12D3KooW..."
```

### libp2p.announce_addresses

**Type**: `array` of multiaddrs
**Required**: No
**Description**: Addresses to announce to the network (useful if behind NAT).

**Example**:
```yaml
libp2p:
  announce_addresses:
    - "/ip4/203.0.113.1/tcp/4001"
    - "/dns4/music.mydomain.com/tcp/4001"
```

### libp2p.enable_mdns

**Type**: `boolean`
**Required**: No
**Default**: `true`
**Description**: Enable mDNS peer discovery on local network.

**Example**:
```yaml
libp2p:
  enable_mdns: false  # Disable for production servers
```

## Storage Configuration

### storage.music_dir

**Type**: `string`
**Required**: No
**Default**: `"~/.station/music"`
**Description**: Directory containing music files and albums.

**Example**:
```yaml
storage:
  music_dir: "/mnt/music"
```

### storage.metadata_db

**Type**: `string`
**Required**: No
**Default**: `"~/.station/metadata.db"`
**Description**: Path to metadata database file.

**Example**:
```yaml
storage:
  metadata_db: "~/.station/metadata.db"
```

### storage.cache_dir

**Type**: `string`
**Required**: No
**Default**: `"~/.station/cache"`
**Description**: Directory for temporary cache files.

**Example**:
```yaml
storage:
  cache_dir: "/tmp/station-cache"
```

## Logging Configuration

### logging.level

**Type**: `string`
**Required**: No
**Default**: `"info"`
**Options**: `debug`, `info`, `warn`, `error`
**Description**: Logging verbosity level.

**Example**:
```yaml
logging:
  level: "debug"
```

### logging.format

**Type**: `string`
**Required**: No
**Default**: `"json"`
**Options**: `json`, `text`
**Description**: Log output format.

**Example**:
```yaml
logging:
  format: "text"
```

### logging.output

**Type**: `string`
**Required**: No
**Default**: `"stdout"`
**Description**: Log output destination (`stdout`, `stderr`, or file path).

**Example**:
```yaml
logging:
  output: "/var/log/station/station.log"
```

## Complete Example

```yaml
artist:
  name: "cosmic-vibes"
  display_name: "Cosmic Vibes"
  bio: "Electronic music producer from Earth"
  profile_image: "~/.station/profile.jpg"

server:
  port: 8080
  host: "0.0.0.0"
  max_concurrent_streams: 100

libp2p:
  port: 4001
  bootstrap_peers:
    - "/ip4/bootstrap.station.fm/tcp/4001/p2p/12D3KooW..."
  announce_addresses:
    - "/dns4/music.cosmicvibes.com/tcp/4001"
  enable_mdns: false

storage:
  music_dir: "/mnt/music"
  metadata_db: "~/.station/metadata.db"
  cache_dir: "/tmp/station-cache"

logging:
  level: "info"
  format: "json"
  output: "stdout"
```

## Environment Variable Override

Any config value can be overridden with environment variables:

```bash
STATION_SERVER_PORT=9000
STATION_LIBP2P_PORT=4002
STATION_LOGGING_LEVEL=debug
```

Format: `STATION_<SECTION>_<KEY>` in uppercase.

## Next Steps

- [CLI Commands](./cli-commands.md) - Command reference
- [API Reference](./api.md) - HTTP API endpoints
