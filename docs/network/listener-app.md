---
sidebar_position: 2
---

# Listener App

The **listener app** is what your fans use. It's a web app at **[beta.qnch.network](https://beta.qnch.network)** — nothing to install, works in any browser.

:::note This is the testnet app
[beta.qnch.network](https://beta.qnch.network) connects to the **testnet** network. It's the right one to share while you're trying Station out.
:::

## Searching for artists

Click 'Search', type the artists namespace.

The app will use the QNCH Network to find the artist and display their content.

Artists can share a link to their content:

```
https://beta.qnch.network/artist/your-namespace
```

## Bye bye algorithms

There's no recommendation engine, no directory, and no browse page. These are not road mapped features, they're intentionally left out.

DSPs didn't only take over hosting and payment. They took over discovery and curation too.

Station intentionally leaves space for others to participate in the music industry: reviewers, critics, DJs, curators, blogs, and listeners sending a link to a friend. Leaving that space empty is what lets those people work as sovereign individuals.

## What fans can do

On your artist page, fans can:

- **Stream** your music with a full player
- **Buy** a track or an album from your [Storefront](../features/storefront.md)
- **Rent** an album for a set window, if you've enabled it — stream-only
- **Join your Fan Club** by minting a [FanPin](../features/fan-club.md)
- **Enjoy Fan Club benefits** you're able to give your patrons special access to releases in your [Catalog](../features/catalog.md)
- **Download** anything they've bought
- **Follow you and save albums**, kept in their own browser

## When a fan needs a wallet

Nothing gets in the way of listening to music you've made public. A wallet only appears when money or fan-only access does.

| No wallet needed | Wallet required |
|---|---|
| Finding you | Buying or renting |
| Viewing your profile and catalog | Minting a FanPin |
| Streaming free, public tracks | Streaming gated music |
| Following and saving | Downloading |

## Fan-only access

When you [gate music to a FanPin generation](../features/fan-club.md), your node checks which generations the fan's wallet holds and serves the audio only if their FanPin opens that door.

Access is **per generation**, not a blanket pass — holding any FanPin doesn't unlock everything. That's what lets early membership mean something.
