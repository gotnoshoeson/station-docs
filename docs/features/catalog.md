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

## Related

- [New Release](./new-release.md) — add albums and upload tracks
- [Fan Club](./fan-club.md) — create the generations you grant access to
- [Storefront](./storefront.md) — set album and track prices so listeners can buy
