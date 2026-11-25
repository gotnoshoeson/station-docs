# Open-Source Licenses

Station is built with open-source software written by many people. Each release carries the license notices for every third-party component it includes, and you can read them here without installing anything.

## On your server

Run this from the directory where you ran the installer, the one containing `docker-compose.yml`:

```bash
docker compose -f docker-compose.yml exec station station licenses
```

It prints the notices for the Station node. The container images also keep their notices in `/usr/share/doc/station/`.

## By release

### 0.1.0-rc.34

| File | What it covers |
|---|---|
| [station.txt](pathname:///licenses/0.1.0-rc.34/station.txt) | The Station node, including the artist dashboard |
| [station-installer.txt](pathname:///licenses/0.1.0-rc.34/station-installer.txt) | The installer that the install command downloads |
| [node-image-alpine-packages.txt](pathname:///licenses/0.1.0-rc.34/node-image-alpine-packages.txt) | The Alpine Linux packages in the node's container image, with a link to each one's source |
| [ethrpc-supervisor.txt](pathname:///licenses/0.1.0-rc.34/ethrpc-supervisor.txt) | Station's supervisor in the ETH-RPC container image |
| [eth-rpc.txt](pathname:///licenses/0.1.0-rc.34/eth-rpc.txt) | Parity's ETH-RPC program in that image, with its source release and Rust crates |
| [eth-rpc-ubuntu-packages.txt](pathname:///licenses/0.1.0-rc.34/eth-rpc-ubuntu-packages.txt) | The Ubuntu packages in that image, with links to their source |

### 0.1.0-rc.33

| File | What it covers |
|---|---|
| [station.txt](pathname:///licenses/0.1.0-rc.33/station.txt) | The Station node, including the artist dashboard |
| [station-installer.txt](pathname:///licenses/0.1.0-rc.33/station-installer.txt) | The installer that the install command downloads |
| [node-image-ca-certificates.txt](pathname:///licenses/0.1.0-rc.33/node-image-ca-certificates.txt) | The certificate list in the node's container image |
| [ethrpc-supervisor.txt](pathname:///licenses/0.1.0-rc.33/ethrpc-supervisor.txt) | Station's supervisor in the ETH-RPC container image |
| [eth-rpc.txt](pathname:///licenses/0.1.0-rc.33/eth-rpc.txt) | Parity's ETH-RPC program in that image, with its source release and Rust crates |
| [eth-rpc-ubuntu-packages.txt](pathname:///licenses/0.1.0-rc.33/eth-rpc-ubuntu-packages.txt) | The Ubuntu packages in that image, with links to their source |

## Listener app

The listener app links its notices from the bottom of every page at [beta.qnch.network](https://beta.qnch.network). They're also at `beta.qnch.network/THIRD_PARTY_NOTICES.txt`.
