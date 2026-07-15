---
sidebar_position: 5
---

# Fan Club

Your Fan Club turns listeners into supporters. Fans join by minting a **FanPin** — a membership pass they pay a fee for — and in return you can give them early or exclusive access to your music. It runs on an on-chain **FanSociety** contract that you deploy once; mint fees are split between you and Station — **0% | 100%** in this first round, meaning you keep all of it — and collect in the contract until you withdraw. See [Revenue Split](../blockchain-network/revenue-split.md).

Your Fan Club is powered by the [FanSociety](https://www.fansociety.xyz/) protocol.

> 📷 **Screenshot needed:** the Fan Club page.

FanPins are organized into **generations** — think of each generation as a numbered edition with its own artwork, description, and fee. When you set [Catalog](./catalog.md) access, you grant it to specific generations, so the fans holding those FanPins can stream that music.

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

Each generation is a new edition of your membership pass. In the **Create FanPin** form, set:

- **Token Fee** — what fans pay to mint this generation's pin (in the native token)
- **FanPin Image** — the pin artwork (up to 10 MB)
- **Description** — what this generation is about

Choose **Create FanPin** to publish it on-chain. It becomes your **active** generation — the one new fans mint — and the **Active FanPin** panel shows its artwork, generation number, and fee.

Create a new generation whenever you want a fresh edition — a new drop, tier, or season. Older generations stay valid for the fans who already hold them.

## 3. See your supporters

**FanPin History** lists every generation you've created, newest first — each with its artwork, fee, description, and **mint count**. Click any generation to open its **supporter list**: the fans who minted it, how much they paid, when, and a link to view each transaction on the block explorer.

## 4. Get paid

- **Revenue** — view your membership earnings and **withdraw** your balance to your payee.
- **Export income statement (CSV)** — download your Fan Club income for your records. (It's an income statement, not a tax document.)

Your combined finances across the Fan Club and [Storefront](./storefront.md) live in [Treasury](./treasury.md).

## Connect FanPins to your music

Minting a FanPin is only half the story — you decide what it unlocks. On the [Catalog](./catalog.md) page, grant album or track access to specific generations so their holders can stream it, on whatever schedule you set.

## Related

- [Catalog](./catalog.md) — grant generations access to your music
- [Treasury](./treasury.md) — manage and withdraw your earnings
- [Storefront](./storefront.md) — sell music outright alongside memberships
