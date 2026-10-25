#!/usr/bin/env bash
#
# Stand-in for setup-station.sh, for VHS recordings of the station-installer
# terminal app ONLY. The app runs it after the questions (as it runs the real
# script with --answers); it prints the real script's progress messages and
# stage markers with placeholder values, and touches nothing.
#
# Strings are copied from station/scripts/setup-station.sh: re-check them when
# that script's messages change (see VHS-OUTLINE.md).

step() { sleep "${2:-0.35}"; echo "$1"; }

# The app passes --network <net> --answers <file>; use the domain answered.
DOMAIN=$(sed -n "s/^STATION_DOMAIN='\(.*\)'$/\1/p" "${4:-/dev/null}" 2>/dev/null)
DOMAIN=${DOMAIN:-demo.qnch.network}

echo "::stage::server"
step "ℹ Using the answers from /tmp/station-answers.env"
step "→ Checking prerequisites..."
step "✓ Docker installed"
step "✓ Docker Compose installed"
step "✓ Docker daemon is running"
step "ℹ Checking if required ports are available..."
step "✓ Ports 80 and 443 are available"

echo "::stage::network"
step "→ Domain Configuration"
step "✓ Server IP: 203.0.113.42"
step "ℹ Checking DNS resolution for ${DOMAIN}..."
step "✓ DNS correctly configured: ${DOMAIN} → 203.0.113.42" 0.6
step "→ Joining the network"
step "✓ Station's bootnode is reachable." 0.6

echo "::stage::config"
step "→ Setting up directories..."
step "✓ Created directory structure"
step "→ Generating configuration files..."
step "✓ Created docker-compose.yml"
step "✓ Created .env"
step "✓ Created traefik/traefik.yml"
step "✓ Created traefik/dynamic.yml"

echo "::stage::containers"
step "→ Starting Station and Traefik..."
step " ✔ Network station-network      Created" 0.6
step " ✔ Container station-traefik    Started" 0.5
step " ✔ Container station-node       Started" 0.5
step " ✔ Container station-watchtower Started" 0.4
step "ℹ Waiting for Traefik to be ready..."

echo "::stage::certificate"
step "ℹ Waiting for certificate provisioning..." 0.4
step "✓ Certificate provisioned successfully!" 1.6

echo "::stage::node"
step "ℹ Waiting for Station to start..."
step "✓ Station is ready" 1.0

echo "::stage::login"
step "→ Retrieving setup PIN from Station..."
step "✓ PIN retrieved successfully" 0.8
echo "::result::domain=${DOMAIN}"
echo "::result::pin=123-456"
echo "::stage::done"
