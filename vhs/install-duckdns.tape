# Station installer — DuckDNS instead of your own domain (token masked).
Output static/img/install/duckdns.gif

Set Shell "bash"
Set FontSize 16
Set Width 1200
Set Height 900
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 45ms
Set Framerate 30

# --- off-camera: the real command runs the real terminal app in demo mode ---
Hide
Type "cd $(mktemp -d) && ln -sf /home/liminal/code/station-docs/vhs/tui-install.sh install.sh"
Enter
Type 'curl(){ :; }; sudo(){ "$@"; }'
Enter
Type "clear"
Enter
Show
Type "curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet"
Sleep 600ms
Enter
Sleep 4s
Down
Sleep 600ms
Enter
Sleep 1.5s
# Have you created a DuckDNS account and subdomain? -> yes
Left
Sleep 400ms
Enter
Sleep 800ms
Type "myband"
Sleep 400ms
Enter
Sleep 800ms
Type "a1b2c3d4-e5f6-7890-abcd-ef1234567890"
Sleep 500ms
Enter
Sleep 2s
