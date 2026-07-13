---
sidebar_position: 4
---

# Storefront

Your Storefront is where you **sell your music** — individual tracks, whole albums, and time-limited album rentals. It runs on an on-chain **Station Shop** smart contract that you deploy once. Every purchase flows through that contract, which splits each payment between you and a small protocol fee; your earnings collect in the contract until you withdraw them.

> 📷 **Screenshot needed:** the Storefront page.

:::note Wallet required
Selling happens on-chain, so the Storefront needs a connected browser wallet. Connect one from the wallet status bar at the top of the page.
:::

## 1. Deploy your Station Shop

Before you can set any prices, deploy your shop contract — a one-time step:

1. **Connect your wallet.**
2. **Choose where your revenue is paid** — your connected wallet, or your [Treasury](./treasury.md).
3. **Deploy Station Shop.** This is an on-chain transaction with a small deploy cost (shown in the chain's native token) plus gas.

When it finishes, your shop shows a **Deployed** badge and its contract address, and the pricing tools below unlock.

## 2. Set your prices

You can price in the chain's **native token**, and in **USD (stablecoin)** on chains that support one. Chains without a stablecoin are native-token only.

### Universal Track Price

One price for **every individual track** — set it once and it applies to all single-track purchases. Albums are priced separately.

### Album Pricing

Set a price **per album**; each album becomes its own on-chain product.

- Albums start at **No price set**. Enter a price and choose **Set Price** to publish the album as a purchasable product.
- Priced albums can be **edited**, and **activated / deactivated** to control whether they're currently for sale.
- A badge shows how many of your albums have prices set.

Nothing to price yet? Upload music in [New Release](./new-release.md) — albums appear here automatically.

### Album Rental Terms

Let listeners **rent** streaming access to your albums for a limited time before they commit to buying.

- Set one **rental price** and **duration** (in hours or days) that applies to all albums.
- Once both price and duration are set, use **Enable** to turn rentals on. You can **Pause** them at any time.

## 3. Get paid

- **Revenue** — view your Storefront earnings on the page and **withdraw** your balance to your payee.
- **Export income statement (CSV)** — download your sales and rental income for your records. (It's an income statement, not a tax document.)

Your full finances — balances across Storefront and Fan Club, withdrawals, and revenue splits — live in [Treasury](./treasury.md).

## Related

- [New Release](./new-release.md) — add the music you'll sell
- [Catalog](./catalog.md) — control who can stream each release
- [Treasury](./treasury.md) — manage and withdraw your earnings
