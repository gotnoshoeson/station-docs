# Station installer — the command, the animated splash, the first question.
Output static/img/install/splash.gif

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
Sleep 6s
