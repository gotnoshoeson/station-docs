# Station installer — bootnode unreachable: a typo is refused, a good node address accepted.
Output static/img/install/entry-node.gif

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
Type "export DEMO_FLAGS=--simulate-bootnode-down && clear"
Enter
Show
Type "curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet"
Sleep 600ms
Enter
Sleep 4s
Enter
Sleep 800ms
Type "music.yourdomain.com"
Enter
Sleep 800ms
Enter
Sleep 800ms
Enter
Sleep 1.5s
Type "/dns4/friend.example.com/tcp/443/wss/p2p/12D3KooWfriend"
Sleep 500ms
Enter
Sleep 2.5s
Ctrl+U
Type "/dns4/friend.example.com/tcp/443/wss/p2p/12D3KooWPkKH9HGouLzmsjLeRHWip9Bt9eF4qLbFkGtEnRUheJmq"
Sleep 500ms
Enter
Sleep 3s
