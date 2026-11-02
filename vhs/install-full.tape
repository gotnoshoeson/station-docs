# Station installer — full walkthrough (HERO clip): splash, questions, install, PIN.
# Real station-installer in --demo mode via vhs/tui-install.sh (see VHS-OUTLINE.md).
Output static/img/install/full.gif
Output static/img/install/full.webm

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
# splash (~2.6 s) while the checks run, then the first question
Sleep 4.5s
# How will listeners reach your server? -> own domain
Enter
Sleep 1s
Type "music.yourdomain.com"
Sleep 500ms
Enter
Sleep 1.2s
Type "you@example.com"
Sleep 500ms
Enter
Sleep 1.5s
# review: install
Enter
# install screen (~14 s), then the card with the PIN
Sleep 16s
Sleep 3s
