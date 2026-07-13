# Station installer — "Install Docker automatically?" prompt (mid-wizard).
Output static/img/install/docker.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera: launch hidden, open the clip on the prompt ---
Hide
Type "cd /home/liminal/code/station-docs && clear"
Enter
Type "MOCK_CLEAR=1 bash vhs/mock-install.sh --stage docker"
Enter
Wait+Screen /Install Docker automatically/
Show

Sleep 1200ms
Enter
Wait+Screen /Docker service started/
Sleep 2s
