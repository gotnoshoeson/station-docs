# Station installer — completion + setup PIN (the money shot).
# Renders the mock harness success stage; PIN is the fixed fake 123-456.
Output static/img/install/success-pin.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera setup: launch the wizard hidden so the clip opens on the wizard
# output, not on the harness command ---
Hide
Type "cd /home/liminal/code/station-docs && clear"
Enter
Type "MOCK_CLEAR=1 bash vhs/mock-install.sh --stage success"
Enter
Wait+Screen /Retrieving setup PIN/
Show

Wait+Screen /Setup completed successfully/
Wait+Screen /Share your namespace/
Sleep 3s
