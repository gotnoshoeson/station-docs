# Station installer — provisioning phase, no input needed (mid-wizard).
Output static/img/install/provisioning.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera: launch hidden, open the clip on the first progress line ---
Hide
Type "cd /home/liminal/code/station-docs && clear"
Enter
Type "MOCK_CLEAR=1 bash vhs/mock-install.sh --stage provisioning"
Enter
Wait+Screen /Generating configuration files/
Show

Wait+Screen /Station is healthy/
Sleep 2s
