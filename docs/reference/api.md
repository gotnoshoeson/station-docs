---
sidebar_position: 3
---

# API Reference

HTTP API reference for Station server.

## Base URL

```
http://localhost:8080/api/v1
```

## Authentication

Currently, the API is unauthenticated. Future versions will support token-based authentication.

## Endpoints

### Health Check

Check if server is running and connected to peers.

**Request**:
```http
GET /health
```

**Response**:
```json
{
  "status": "ok",
  "peers": 5
}
```

---

### Get Artist Information

Retrieve artist profile information.

**Request**:
```http
GET /api/v1/artist
```

**Response**:
```json
{
  "name": "cosmic-vibes",
  "display_name": "Cosmic Vibes",
  "bio": "Electronic music producer from Earth",
  "profile_image_url": "/api/v1/artist/profile-image"
}
```

---

### Get Artist Profile Image

Retrieve artist profile image.

**Request**:
```http
GET /api/v1/artist/profile-image
```

**Response**: Image binary (JPEG/PNG)

---

### List Albums

Get all albums from this artist.

**Request**:
```http
GET /api/v1/albums
```

**Response**:
```json
{
  "albums": [
    {
      "album_id": "cosmic-dreams-2024",
      "title": "Cosmic Dreams",
      "release_date": "2024-01-15",
      "track_count": 10,
      "cover_url": "/api/v1/albums/cosmic-dreams-2024/cover"
    }
  ]
}
```

---

### Get Album Details

Get detailed information about a specific album.

**Request**:
```http
GET /api/v1/albums/{album_id}
```

**Response**:
```json
{
  "album_id": "cosmic-dreams-2024",
  "title": "Cosmic Dreams",
  "release_date": "2024-01-15",
  "tracks": [
    {
      "track_number": 1,
      "title": "Stellar Voyage",
      "duration": 245
    },
    {
      "track_number": 2,
      "title": "Nebula Drift",
      "duration": 312
    }
  ]
}
```

---

### Get Album Cover

Retrieve album cover image.

**Request**:
```http
GET /api/v1/albums/{album_id}/cover
```

**Response**: Image binary (JPEG/PNG)

---

### Stream Track

Stream audio for a specific track.

**Request**:
```http
GET /api/v1/albums/{album_id}/tracks/{track_number}/stream
```

**Headers**:
```
Range: bytes=0-
```

**Response**: Audio binary (FLAC/MP3) with `Content-Type: audio/flac`

**Status Codes**:
- `200 OK`: Full file
- `206 Partial Content`: Range request successful
- `404 Not Found`: Track doesn't exist
- `416 Range Not Satisfiable`: Invalid range

---

### Get Peer Information

Get information about connected peers.

**Request**:
```http
GET /api/v1/peers
```

**Response**:
```json
{
  "peers": [
    {
      "peer_id": "12D3KooWABC...",
      "addresses": [
        "/ip4/192.168.1.100/tcp/4001"
      ],
      "connected_since": "2024-02-14T10:30:00Z"
    }
  ]
}
```

---

### Get Server Stats

Get server statistics and metrics.

**Request**:
```http
GET /api/v1/stats
```

**Response**:
```json
{
  "uptime_seconds": 8100,
  "peer_count": 5,
  "album_count": 3,
  "track_count": 28,
  "active_streams": 2,
  "total_bytes_served": 157286400,
  "memory_usage_bytes": 47185920
}
```

## Error Responses

All errors follow this format:

```json
{
  "error": {
    "code": "NOT_FOUND",
    "message": "Album not found"
  }
}
```

### Error Codes

- `NOT_FOUND` - Resource doesn't exist
- `BAD_REQUEST` - Invalid request parameters
- `INTERNAL_ERROR` - Server error
- `RATE_LIMIT` - Too many requests

## Rate Limiting

Default limits (configurable):
- 100 requests per minute per IP
- 10 concurrent streams per IP

## CORS

CORS is enabled for all origins by default. Configure in `config.yaml`:

```yaml
server:
  cors_origins:
    - "https://station.fm"
    - "https://app.station.fm"
```

## Examples

### cURL Examples

```bash
# Get artist info
curl http://localhost:8080/api/v1/artist

# List albums
curl http://localhost:8080/api/v1/albums

# Download album cover
curl http://localhost:8080/api/v1/albums/cosmic-dreams/cover -o cover.jpg

# Stream a track
curl http://localhost:8080/api/v1/albums/cosmic-dreams/tracks/1/stream -o track.flac

# Get server stats
curl http://localhost:8080/api/v1/stats
```

### JavaScript Example

```javascript
// Fetch albums
const response = await fetch('http://localhost:8080/api/v1/albums')
const data = await response.json()
console.log(data.albums)

// Stream track
const audio = new Audio('http://localhost:8080/api/v1/albums/cosmic-dreams/tracks/1/stream')
audio.play()
```

## Next Steps

- [CLI Commands](./cli-commands.md) - Command-line reference
- [Configuration](./configuration.md) - Config file reference
