# Station installer — running the command (docs step 2).
# Shows the REAL install command on camera; behind the scenes it's driven by the
# mock (curl/sudo shimmed to no-ops, install.sh symlinked to the mock in a temp
# dir — see the Hide block). MOCK_NET_SCOPE=run => banner + prereqs only.
Output static/img/install/run.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera: shim the real command to the mock in a clean temp dir ---
Hide
Type "cd $(mktemp -d) && ln -sf /home/liminal/code/station-docs/vhs/mock-install.sh install.sh"
Enter
Type 'curl(){ :; }; sudo(){ "$@"; }; export MOCK_NET_SCOPE=run'
Enter
Type "clear"
Enter
Show

Type "curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet"
Sleep 1s
Enter
Wait+Screen /Setup Wizard/
Wait+Screen /Ports 80, 443/
Sleep 3s
