#!/usr/bin/env bash
#
# Shim for VHS recordings ONLY: the tapes symlink this as install.sh, so the
# real command on camera ("sudo bash install.sh --network testnet") opens the
# real station-installer terminal app in demo mode (placeholder IP and
# domain) and "installs" with vhs/tui-demo-setup.sh, which touches nothing.
#
# Needs station-installer on PATH, built from the station repo:
#   cd ~/code/station && go build -o ~/go/bin/station-installer ./cmd/station-installer
#
# DEMO_FLAGS adds flags, e.g. DEMO_FLAGS=--simulate-bootnode-down.

here="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
# shellcheck disable=SC2086
exec station-installer --demo --preview=false --script "$here/tui-demo-setup.sh" ${DEMO_FLAGS:-} "$@"
