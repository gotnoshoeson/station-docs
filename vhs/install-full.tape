# Station installer — full end-to-end walkthrough (HERO clip).
# Real command on camera, own-domain happy path, driven by the mock via the
# curl/sudo shim (MOCK_NET_SCOPE=all => the whole flow).
#
# NOTE: this clip uses pure Sleep pacing, NOT Wait. VHS `Wait` both freezes PTY
# output and is edge-triggered, so it can't span the mock's large autonomous
# output bursts (banner, docker install, provisioning). The mock blocks at each
# prompt and keystrokes buffer in the PTY, so timed Sleeps + inputs are reliable.
# Sleeps are sized with margin above the mock's known spinner durations.
Output static/img/install/full.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera: shim the real command to the mock ---
Hide
Type "cd $(mktemp -d) && ln -sf /home/liminal/code/station-docs/vhs/mock-install.sh install.sh"
Enter
Type 'curl(){ :; }; sudo(){ "$@"; }; export MOCK_NET_SCOPE=all'
Enter
Type "clear"
Enter
Show

Type "curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet"
Sleep 800ms
Enter

# banner + prereqs + "Install Docker automatically?" render (~1.5s); show, then Yes
Sleep 3s
Enter

# docker install spinners (~3.5s) -> domain choice; show, then select Own domain
Sleep 5s
Enter

# IP detect spinner (~1s) -> "Enter your domain:"; type it
Sleep 3s
Type "demo.qnch.network"
Sleep 600ms
Enter

# DNS check spinner (~2s) -> "Enter email address:"; type it
Sleep 4s
Type "you@example.com"
Sleep 600ms
Enter

# "Enable automatic updates via Watchtower?"; show, then Yes
Sleep 2500ms
Enter

# provisioning (~6s) + PIN + "Setup completed successfully!" box; let it finish
Sleep 10s
