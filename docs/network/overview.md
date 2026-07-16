---
sidebar_position: 1
---

# A true Network

Yes you can already self host your music on your own without Station. But for consumers to go to 20 different sites to hear 20 different bands and deal with 20 different layouts/interfaces this DIY thing is going to remain very niche. 

The QNCH Network is what ties all these independent servers together in a cohesive ecosystem. The community gets the benefits of self hosting and of a contemporary listening experience in one app.

## Namespace and a Distributed DNS

Your [namespace](../features/settings.md) is the handle fans use to find you. Imagine two bands called The Chips; one has a namespace of 'thechips' and the other 'thechipsog'.

When you save it, your node (automatically running on your server) announces it to other nodes on the network: *this name belongs to this node, and here's where to reach it.*

Names are claimed first come, first served.

## How a listener reaches your music

When a fan looks you up in the [Listener App](./listener-app.md) at beta.qnch.network:

1. They search your **namespace**.
2. The network resolves that name to your node.
3. Your **catalog** loads directly from your server.
4. Pressing play streams the audio **directly from your server** to their browser.

Step four is the one worth noticing. The audio doesn't pass through us or through anyone else — it's your server talking to your listener. That also means your server's connection is your listeners' experience.

## Your node is your availability

This follows directly from there being no central copy, and it's the most important operational fact about running a Station server:

:::danger If your server is off, your music is unavailable
Nobody else holds a copy of your music. When your node goes offline, fans can't stream, buy, or download from you. When it comes back, everything resumes.

That's the trade for owning your distribution outright: no one can take your music down, and no one can keep it up for you either. It's why a cheap VPS that stays on beats a laptop that sleeps.
:::

## Next steps

- [Listener App](./listener-app.md) — what your fans actually use
- [Settings](../features/settings.md) — your namespace, Peer ID, and network status
