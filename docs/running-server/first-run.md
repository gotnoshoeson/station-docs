---
sidebar_position: 3
---

# Your Server is Running

After installation, your Station server is already running. Here's what to do next.

## Access Your Artist Portal

Open your browser and go to:

```
https://your-subdomain.your-domain.com
```

This is your artist dashboard where you can:
- Upload music
- Manage your profile
- View listener stats
- Get your artist link

## Upload Your First Album

1. Click **Upload Album**
2. Drag and drop your tracks
3. Add cover art
4. Fill in metadata (title, release date, etc.)
5. Click **Publish**

Your music is now live on the network.

## Share Your Artist Link

Your artist page is available at:

```
https://listen.station.fm/artist/your-artist-name
```

Share this link with fans. They can:
- Stream your music
- Support you directly
- Join your fan club

## Check Server Status

To see if your server is running:

```bash
systemctl status station
```

To view logs:

```bash
journalctl -u station -f
```

## Troubleshooting

**Can't access the portal?**
- Make sure your DNS A record is pointing to the correct server IP
- Wait a few minutes for DNS to propagate
- Check that the domain you entered during install matches your DNS record

**Music not showing up?**
- Check the upload completed successfully
- Refresh the page

**Need help?**
- Check [GitHub Issues](https://github.com/station/station/issues)
- Ask in the community Discord
