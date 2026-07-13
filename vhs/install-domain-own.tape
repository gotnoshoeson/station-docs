# Station installer — domain configuration (own domain path).
# Proves VHS can drive interactive gum choose + gum input.
# Renders the mock harness stage; no real DNS/network.
Output static/img/install/domain-own.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera setup: launch the wizard hidden so the clip opens on the prompt,
# not on the harness command ---
Hide
Type "cd /home/liminal/code/station-docs && clear"
Enter
Type "MOCK_CLEAR=1 bash vhs/mock-install.sh --stage domain-own"
Enter
Wait+Screen /configure your domain/
Show

# gum choose — "Own domain" is the first (highlighted) option
Sleep 1500ms
Enter

# gum input — type the domain into the empty field
Wait+Screen /Enter your domain/
Sleep 800ms
Type "demo.qnch.network"
Sleep 700ms
Enter

# DNS "check" resolves
Wait+Screen /DNS resolves/
Sleep 2500ms
