# Station installer — email for HTTPS + automatic updates prompts (mid-wizard).
Output static/img/install/email-watchtower.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera: launch hidden, open the clip on the email prompt ---
Hide
Type "cd /home/liminal/code/station-docs && clear"
Enter
Type "MOCK_CLEAR=1 bash vhs/mock-install.sh --stage email-watchtower"
Enter
Wait+Screen /Enter email address/
Show

Sleep 800ms
Type "you@example.com"
Sleep 500ms
Enter

Wait+Screen /Enable automatic updates/
Sleep 1200ms
Enter

Wait+Screen /Watchtower enabled/
Sleep 2s
