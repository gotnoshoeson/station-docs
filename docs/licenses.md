# Open-Source Licenses

Station is built with open-source software written by many people. Each release carries the license notices for every third-party component it includes, and you can read them here without installing anything.

## On your server

Run this from the directory where you ran the installer, the one containing `docker-compose.yml`:

```bash
docker compose -f docker-compose.yml exec station station licenses
```

It prints the notices for the Station node. The container images also keep their notices in `/usr/share/doc/station/`.

## By release

### 0.1.0-rc.35

| File | What it covers |
|---|---|
| [station.txt](pathname:///licenses/0.1.0-rc.35/station.txt) | The Station node, including the artist dashboard |
| [station-installer.txt](pathname:///licenses/0.1.0-rc.35/station-installer.txt) | The installer that the install command downloads |
| [node-image-alpine-packages.txt](pathname:///licenses/0.1.0-rc.35/node-image-alpine-packages.txt) | The Alpine Linux packages in the node's container image, with a link to each one's source |
| [ethrpc-supervisor.txt](pathname:///licenses/0.1.0-rc.35/ethrpc-supervisor.txt) | Station's supervisor in the ETH-RPC container image |
| [eth-rpc.txt](pathname:///licenses/0.1.0-rc.35/eth-rpc.txt) | Parity's ETH-RPC program in that image, with its source release and Rust crates |
| [eth-rpc-ubuntu-packages.txt](pathname:///licenses/0.1.0-rc.35/eth-rpc-ubuntu-packages.txt) | The Ubuntu packages in that image, with links to their source |

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

## Downloaded by the installer

The installer also has your server download a few programs straight from the people who publish
them. Station doesn't host or change these. They're listed here so you can find each one's license
and source. Versions are what the installer got on 27 November 2026; the ones marked *newest* can
be newer on your server.

| Component | What the installer gets | License | Source and license at that version |
|---|---|---|---|
| Traefik (HTTPS for your domain) | `traefik:latest` from Docker Hub, *newest* when you install: v3.8.0 | MIT | [Source v3.8.0](https://github.com/traefik/traefik/tree/v3.8.0) · [License](https://github.com/traefik/traefik/blob/v3.8.0/LICENSE.md) · [How the image is built](https://github.com/traefik/traefik-library-image/tree/master/v3.8/alpine) |
| Alpine Linux, inside the Traefik image | Alpine 3.24.4: 18 packages, among them BusyBox, apk-tools, musl, OpenSSL, zlib and the CA certificate list | Each package's own: GPL-2.0, MIT, BSD-2-Clause, Apache-2.0, MPL-2.0, Zlib or public domain | [Package list for this image](https://github.com/docker-library/repo-info/blob/master/repos/traefik/local/v3.8.0.md). On 27 November 2026 these were the same versions as in Station's node image, whose [package file](pathname:///licenses/0.1.0-rc.35/node-image-alpine-packages.txt) links each one's exact source |
| Watchtower (applies Station updates, as set in **Settings → Software Updates**) | `nickfedor/watchtower:1.19.0` from Docker Hub | Apache-2.0 | [Source v1.19.0](https://github.com/nicholas-fedor/watchtower/tree/v1.19.0) · [License](https://github.com/nicholas-fedor/watchtower/blob/v1.19.0/LICENSE.md). The image also holds a CA certificate list (MPL-2.0) and time zone data (public domain) from Alpine Linux |
| Docker Engine | Only if Docker isn't on your server and you say yes: `docker-ce` from Docker's repository, *newest* for your system: 29.10.1 | Apache-2.0 | [Source v29.10.1](https://github.com/moby/moby/tree/docker-v29.10.1) · [License](https://github.com/moby/moby/blob/docker-v29.10.1/LICENSE) |
| Docker command line | With Docker Engine: `docker-ce-cli` 29.10.1 | Apache-2.0 | [Source v29.10.1](https://github.com/docker/cli/tree/v29.10.1) · [License](https://github.com/docker/cli/blob/v29.10.1/LICENSE) |
| containerd and runc | With Docker Engine: `containerd.io` 2.4.2, which contains containerd 2.4.2 and runc 1.5.3 | Apache-2.0 | [containerd v2.4.2](https://github.com/containerd/containerd/tree/v2.4.2) · [License](https://github.com/containerd/containerd/blob/v2.4.2/LICENSE) · [runc v1.5.3](https://github.com/opencontainers/runc/tree/v1.5.3) · [License](https://github.com/opencontainers/runc/blob/v1.5.3/LICENSE) |
| Docker Buildx | With Docker Engine: `docker-buildx-plugin` 0.39.1 | Apache-2.0 | [Source v0.39.1](https://github.com/docker/buildx/tree/v0.39.1) · [License](https://github.com/docker/buildx/blob/v0.39.1/LICENSE) |
| Docker Compose | With Docker Engine: `docker-compose-plugin` 5.8.1 | Apache-2.0 | [Source v5.8.1](https://github.com/docker/compose/tree/v5.8.1) · [License](https://github.com/docker/compose/blob/v5.8.1/LICENSE) |
| gum (prompts in the classic installer) | Only with the classic installer: `gum` from Charm's repository, *newest*: 2.0.2 | MIT | [Source v2.0.2](https://github.com/charmbracelet/gum/tree/v2.0.2) · [License](https://github.com/charmbracelet/gum/blob/v2.0.2/LICENSE) |
| Ubuntu or Debian packages | Only if missing, from your server's own package sources: `ca-certificates`, `curl`, `gnupg` and `lsb-release` before installing Docker; `dnsutils` and `curl` for the domain check | Each package's own | Each package's license is in `/usr/share/doc/<package>/copyright` on your server. Source: [Ubuntu](https://launchpad.net/ubuntu) or [Debian](https://sources.debian.org/) |

The Docker versions above are for Ubuntu 22.04 and Debian 12. Docker's repository gives older
releases older versions (on 27 November 2026, Docker Engine 29.8.0 on Debian 11 and 28.1.1 on
Ubuntu 20.04). To see what your server has, run `docker version`.

## Listener app

The listener app links its notices from the bottom of every page at [beta.qnch.network](https://beta.qnch.network). They're also at `beta.qnch.network/THIRD_PARTY_NOTICES.txt`.
