# Station installer — review, the install screen, and the card with the setup PIN.
Output static/img/install/finish.gif

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
Hide
Type "curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet"
Enter
Sleep 4s
Enter
Sleep 800ms
Type "music.yourdomain.com"
Enter
Sleep 800ms
Type "you@example.com"
Enter
Sleep 800ms
Enter
Sleep 1.5s
Show
Sleep 2s
Enter
Sleep 16s
Sleep 3s
