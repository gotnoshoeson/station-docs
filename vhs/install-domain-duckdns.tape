# Station installer — domain via DuckDNS (mid-wizard variant).
# Drives gum choose (2nd option), a gum confirm, and two gum inputs (the token
# is masked). All values are fake placeholders.
Output static/img/install/domain-duckdns.gif

Set Shell "bash"
Set FontSize 22
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 50ms
Set Framerate 60

# --- off-camera: launch hidden, open the clip on the domain choice ---
Hide
Type "cd /home/liminal/code/station-docs && clear"
Enter
Type "MOCK_CLEAR=1 bash vhs/mock-install.sh --stage domain-duckdns"
Enter
Wait+Screen /configure your domain/
Show

# gum choose — move to "DuckDNS" (second option) and select
Sleep 1200ms
Down
Sleep 400ms
Enter

# gum confirm — default No; move to Yes and confirm
Wait+Screen /Have you created a DuckDNS account/
Sleep 800ms
Left
Sleep 400ms
Enter

# subdomain
Wait+Screen /Enter your DuckDNS subdomain/
Sleep 600ms
Type "myband"
Sleep 400ms
Enter

# token (masked input)
Wait+Screen /Enter your DuckDNS token/
Sleep 600ms
Type "demo-duckdns-token"
Sleep 400ms
Enter

Wait+Screen /DuckDNS updated successfully/
Sleep 2500ms
