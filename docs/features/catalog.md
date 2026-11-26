---
sidebar_position: 2
---

# Catalog

Your Catalog is where you review everything you've published and control **who can hear it, and when**. To *add* music, head to [New Release](./new-release.md) — the Catalog is for managing what already exists.

> 📷 **Screenshot needed:** the Catalog page with a few albums.

## Albums at a glance

Each album shows its cover, title, year, and track count, along with status badges:

- **Published** — the album has access rules set and is discoverable by listeners.
- **Staged** — no access rules yet, so it isn't discoverable. Setting access (below) flips it to Published.
- **Disabled** — you've switched the album off (see [Disable an album](#disable-an-album)). Nobody can hear it until you enable it again.
- **Price badge** — if the album is sold as an on-chain product, its price shows here.
- **No purchase path** (orange warning) — the album has no way for listeners to buy it. Fix it on your [Storefront](./storefront.md): set a per-album price, or set a universal track price.

Click an album to expand its access settings.

## How access works

Station lets you release music to your fan club first, stagger it across tiers, and optionally open it to the public later. Expanding an album reveals two editors.

### Fan Club Access (album level)

Access is built from **generation groups**. A *generation* is a batch of [Fan Club](./fan-club.md) passes (called FanPins) that you've minted; grouping generations together lets you grant them the same access. For each group you set:

- **Generations** — which Fan Club generations the group covers
- **Available from** — the date access opens (set it in the future to schedule a release)
- **Streaming** — **Free** or **Paid** for that group

Add multiple groups to stagger access — for example, your earliest supporters (Generation 1) stream free today, while a later generation gets access next month.

**Public release** is an optional final tier: turn it on to open the album to *everyone* from a date you choose (free or paid). Leave it off and the album stays fan-club-exclusive.

:::note
Every album needs at least one access path — either a public release date, or a group with a generation and a date. If you haven't deployed a Fan Club or minted any generations yet, the editor links you straight to the [Fan Club](./fan-club.md) page to do that first.
:::

### Track Access (per track)

By default, every track inherits the album's access rules. Expand a track to give it its own — a per-track override **fully replaces** the album settings for that track (handy for a single or a bonus cut). To revert to inheritance, remove the track's groups, turn off its public release, and save.

> 📷 **Screenshot needed:** an expanded album showing the Fan Club Access editor.

## Edit an album

Choose **Edit** on an album to change it after upload:

- **Album details** — everything on the [New Release](./new-release.md) form, and the cover (replace or remove it).
- **Tracks** — rename a track, drag tracks into a new order, and change the explicit flag, featured artists and lyrics.
- **Replace audio** — upload a new MP3, FLAC or WAV file (up to 100 MB) for a track. The track keeps its place, its access settings and everyone who bought it; listeners hear the new file from their next play, and fans who already downloaded it keep their copy.
- **Earlier versions** — every audio file a track has had stays on your server, listed by upload date and file name. Choose **Use this version** to switch back. Versions aren't deleted.

Changes show in the listener app the next time a listener's app refreshes your catalog.

## Add tracks to an album

Choose **Add tracks** on an album to upload more tracks to it — a bonus track, or the rest of a release whose upload didn't finish. It works like the Tracks section of [New Release](./new-release.md): pick files, set each track's title, explicit flag, featured artists and lyrics, and drag them into order. New tracks go after the album's last track.

New tracks follow the album's access settings, so on a published album they go live to its listeners right away. If one upload fails, the upload stops there and shows which tracks made it and which didn't; nothing is deleted, and you can add the rest the same way.

## Disable an album

Albums can't be deleted, but you can switch one off. Choose **Disable** on the album:

- The album disappears from the listener app, and **nobody can play or download it** — not the public, not your fan club, and not fans who bought or are renting it. Before it switches off, you're told how many buyers and renters will lose access.
- **Nothing is deleted.** Its tracks, files, access settings and prices stay on your server, and your sales history and income statement keep every sale.
- Choose **Enable** to bring it back exactly as it was. Everyone who had access gets it back.
- Nothing changes on the blockchain. A rental keeps counting down while the album is off, and a fan's library shows it as **Unavailable right now** until you enable it.

You can still edit a disabled album and its access settings.

## Related

- [New Release](./new-release.md) — add albums and upload tracks
- [Fan Club](./fan-club.md) — create the generations you grant access to
- [Storefront](./storefront.md) — set album and track prices so listeners can buy
