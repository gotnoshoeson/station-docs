#!/usr/bin/env bash
#
# Mock of the Station installer wizard, for VHS recordings ONLY.
#
# Reproduces the REAL interactive gum prompts and printed output of the setup
# wizard (see qnch.network/install.sh and station/scripts/setup-station.sh),
# but STUBS every side effect — no Docker, no DNS lookups, no certs, no network.
# Nothing here touches the system. NEVER run this on a real server expecting it
# to install anything.
#
# Values are fixed, fake placeholders (see VHS-OUTLINE.md):
#   domain demo.qnch.network · IP 203.0.113.42 · email you@example.com · PIN 123-456
#
# Usage:
#   mock-install.sh --stage <run|docker|domain-own|email-watchtower|provisioning|success>
#   mock-install.sh --all        # full happy path (own domain) — for the hero clip
#
set -u

STATION_VERSION="0.1.0-rc.4"
DEMO_DOMAIN="demo.qnch.network"
DEMO_IP="203.0.113.42"
DEMO_PIN="123-456"

# ---- gum helpers (mirror the real script's style palette) ----
print_step()    { gum style --foreground 39  "→ $1"; }
print_success() { gum style --foreground 82  "✓ $1"; }
print_error()   { gum style --foreground 196 "✗ $1"; }
print_warning() { gum style --foreground 214 "⚠ $1"; }
print_info()    { gum style --foreground 39  "ℹ $1"; }

gum_confirm() { # prompt  default(yes|no)
    local prompt="$1" default="${2:-yes}"
    if [ "$default" = "yes" ]; then
        gum confirm --default=yes "$prompt"
    else
        gum confirm --default=no "$prompt"
    fi
}

gum_input() { # prompt  placeholder
    gum input --prompt "$1 " --placeholder "${2:-}"
}

gum_input_secret() { # prompt  placeholder — masks typed chars (for the DuckDNS token)
    gum input --password --prompt "$1 " --placeholder "${2:-}"
}

gum_choose() { # prompt  option...
    # NOTE: the real script prints the prompt separately then pipes to `gum choose`.
    # We pass it as --header instead so the question stays visible inside the widget
    # while selecting — this is what lets VHS Wait+Screen match it during recording.
    local prompt="$1"; shift
    printf '%s\n' "$@" | gum choose --header "$prompt"
}

show_banner() {
    local banner
    banner=$(cat <<'BANNER'
 ██████╗ ███╗   ██╗ ██████╗██╗  ██╗
██╔═══██╗████╗  ██║██╔════╝██║  ██║
██║   ██║██╔██╗ ██║██║     ███████║
██║▄▄ ██║██║╚██╗██║██║     ██╔══██║
╚██████╔╝██║ ╚████║╚██████╗██║  ██║
 ╚══▀▀═╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝
BANNER
)
    echo ""
    echo "$banner" | gum style --foreground 212 --bold
    echo ""
    gum style --foreground 99 --bold "         Setup Wizard v$STATION_VERSION"
    echo ""
}

# ---- stages ----

stage_run() {
    show_banner
    gum style --border rounded --border-foreground 99 --padding "1 2" --margin "1 0" \
"Before you begin, make sure you have:

• Ubuntu 20.04/22.04 or Debian 11/12
• root or sudo access
• Ports 80, 443, 4001, 4002 open to the internet
• A domain pointing to this server (or a DuckDNS account)"
}

stage_docker() {
    print_warning "Docker is not installed."
    if gum_confirm "Install Docker automatically?" "yes"; then
        gum spin --spinner dot --title "Installing dependencies..." -- sleep 2
        print_success "Installed Docker Engine, CLI, and Compose"
        gum spin --spinner dot --title "Starting Docker service..." -- sleep 1
        print_success "Docker service started"
    fi
}

stage_domain_own() {
    local choice domain
    choice=$(gum_choose "How would you like to configure your domain?" \
        "Own domain (mymusic.example.com)" \
        "DuckDNS (free dynamic DNS)")
    gum spin --spinner dot --title "Detecting server's public IP..." -- sleep 1
    print_info "Server public IP: $DEMO_IP"
    domain=$(gum_input "Enter your domain:" "mymusic.example.com")
    [ -z "$domain" ] && domain="$DEMO_DOMAIN"
    gum spin --spinner dot --title "Checking DNS for $domain..." -- sleep 2
    print_success "DNS resolves to this server"
}

stage_domain_duckdns() {
    local sub token
    gum_choose "How would you like to configure your domain?" \
        "Own domain (mymusic.example.com)" \
        "DuckDNS (free dynamic DNS)" >/dev/null
    print_info "Using DuckDNS"
    echo "Create a free account and subdomain at https://www.duckdns.org/"
    gum_confirm "Have you created a DuckDNS account and subdomain?" "no" || true
    sub=$(gum_input "Enter your DuckDNS subdomain:" "myband")
    token=$(gum_input_secret "Enter your DuckDNS token:" "your-token-here")
    sub=${sub:-myband}
    print_step "Updating DuckDNS IP address..."
    gum spin --spinner dot --title "Updating ${sub}.duckdns.org..." -- sleep 1
    print_success "DuckDNS updated successfully"
    print_success "Domain set to ${sub}.duckdns.org"
}

stage_email_watchtower() {
    echo "Let's Encrypt will send certificate expiration notices to this email."
    gum_input "Enter email address:" "your@email.com" >/dev/null
    echo ""
    print_info "Watchtower can automatically update your Station node when new versions release."
    if gum_confirm "Enable automatic updates via Watchtower?" "yes"; then
        print_success "Watchtower enabled — checks every 6h, updates only the Station container"
    else
        print_info "Watchtower will not be installed. You can update manually via the dashboard."
    fi
}

stage_provisioning() {
    print_step "Generating configuration files..."
    sleep 0.4; print_success "Created docker-compose.yml"
    sleep 0.3; print_success "Created traefik/traefik.yml"
    sleep 0.3; print_success "Created traefik/dynamic.yml"
    print_step "Starting Station and Traefik..."
    gum spin --spinner dot --title "Pulling images and starting containers..." -- sleep 2
    gum spin --spinner dot --title "Provisioning Let's Encrypt certificate..." -- sleep 2
    print_success "Certificate provisioned"
    gum spin --spinner dot --title "Waiting for Station to become healthy..." -- sleep 1
    print_success "Station is healthy"
}

stage_success() {
    print_step "Retrieving setup PIN from Station..."
    gum spin --spinner dot --title "Reading Station logs..." -- sleep 1
    print_success "PIN retrieved successfully"
    echo ""
    gum style --foreground 82 --bold "✓ Setup completed successfully!"
    gum style --border double --border-foreground 99 --padding "1 2" --margin "1 0" \
"NEXT STEPS

1. Open:       https://$DEMO_DOMAIN/setup
2. Enter PIN:  $DEMO_PIN
3. Use the dashboard to upload your music
4. Share your namespace with listeners"
}

run_all() {
    stage_run;              echo
    stage_docker;           echo
    stage_domain_own;       echo
    stage_email_watchtower; echo
    stage_provisioning;     echo
    stage_success
}

case "${1:-}" in
    --all) run_all ;;
    # The real command is `sudo bash install.sh --network testnet`. The run/hero
    # tapes shim that command to this mock (alias sudo/curl + install.sh symlink),
    # so we accept --network and pick scope from MOCK_NET_SCOPE: `run` = just the
    # banner/prereqs (for the run clip), anything else = the whole flow (hero).
    --network|--network=*)
        case "${MOCK_NET_SCOPE:-all}" in
            run) stage_run ;;
            *)   run_all ;;
        esac ;;
    --stage)
        # MOCK_CLEAR=1 wipes the launch command off the screen before the stage
        # renders, so mid-wizard excerpt clips open cleanly on the prompt (the
        # tape hides the launcher, the mock erases its own command line).
        [ -n "${MOCK_CLEAR:-}" ] && clear
        case "${2:-}" in
            run)              stage_run ;;
            docker)           stage_docker ;;
            domain-own)       stage_domain_own ;;
            domain-duckdns)   stage_domain_duckdns ;;
            email-watchtower) stage_email_watchtower ;;
            provisioning)     stage_provisioning ;;
            success)          stage_success ;;
            *) echo "unknown stage: ${2:-}" >&2; exit 1 ;;
        esac ;;
    *) echo "usage: $0 --stage <run|docker|domain-own|domain-duckdns|email-watchtower|provisioning|success> | --all | --network <net>" >&2; exit 1 ;;
esac
