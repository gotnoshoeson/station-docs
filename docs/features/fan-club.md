---
sidebar_position: 5
---

# Fan Club

Your Fan Club is a patronage service that works directly with your streaming service; neither of which is a subscription.

Your Fan Club is powered by the [FanSociety](https://www.fansociety.xyz/) protocol.

> 📷 **Screenshot needed:** the Fan Club page.

FanPins are organized into **generations** — this is a way to catalog your supporters throughout your career. The alternatives have already been tried without much success. Past fan clubs have used a rarity model, in which an artist would create say 10,000 membership slots; which basically means whoever has the most money gets to be in the club, lame. This is a model that can grow with an artist throughout their career and is able to highlight early supporters. Fans love to claim being an early follower or supporter of bands; and when they blow up, there's a sort of dissatisfaction. FanSociety was designed to create stronger connections in this social contract that exists between fans and artists. 

:::note Wallet required
The Fan Club is on-chain, so it needs a connected browser wallet holding enough PAS to cover the deploy cost and gas. Connect one from the wallet status bar at the top of the page.

New to wallets? Start with [Blockchain Network](../blockchain-network/overview.md) — it covers setting one up and getting free test tokens.
:::

## 1. Deploy your Fan Club

A one-time setup step:

1. **Connect your wallet.**
2. **Choose where your revenue is paid** — your connected wallet, or your [Treasury](./treasury.md).
3. **Deploy Fan Club.** This is an on-chain transaction with a small deploy cost (in the chain's native token) plus gas.

Once deployed, your Fan Club shows a **Deployed** badge and its contract address.

## 2. Create a FanPin generation

Each generation has no limit and only is only available to mint until you create a new generation. In the **Create FanPin** form, set:

- **Token Fee** — minimum donation amount (in the native token)
- **FanPin Image** — the pin artwork (up to 10 MB)
- **Description** — what this generation is about, put whatever info you want here, or don't

Choose **Create FanPin** to publish it on-chain. It becomes your **active** generation — the one new fans mint — and the **Active FanPin** panel shows its artwork, generation number, and fee.

Create a new generation whenever you want. When you create a new generation, the previous generation is no longer available. This means, over time, your supporters can be identified in cohorts of fans. Station currently provides one way of using this data; giving privileged access to your music to supporters at your discretion. But we're pretty sure you can come up with some great ideas to give back to your community too, and we're working on this too.

## 3. See your supporters

**FanPin History** lists every generation you've created, newest first — each with its artwork, fee, description, and **mint count**. Click any generation to open its **supporter list**: the fans who minted it, how much they paid, when, and a link to view each transaction on the block explorer.

## 4. Get paid

- **Revenue** — view your membership earnings and **withdraw** your balance to your payee.
- **Export income statement (CSV)** — download your Fan Club income for your records. (It's an income statement, not a tax document.)

Your combined finances across the Fan Club and [Storefront](./storefront.md) live in [Treasury](./treasury.md).

## Connect FanPins to your music

Minting a FanPin is only half the story — you decide what it unlocks. On the [Catalog](./catalog.md) page you have a lot of options to customize what works for you. Some examples include, early release schedule for one or multiple genertions of supporters, bonus tracks that only FanPin holders can stream. Our goal was to give you the tools to do what works for you rather than dictate a feature.

## Related

- [Catalog](./catalog.md) — grant generations access to your music
- [Treasury](./treasury.md) — manage and withdraw your earnings
- [Storefront](./storefront.md) — sell music outright alongside memberships
