---
sidebar_position: 6
---

# Treasury

The Treasury is **optional, advanced money management**. It's a single on-chain address you control that collects your share of revenue from your [Fan Club](./fan-club.md) and [Storefront](./storefront.md) in one place — so you can pay out to bandmates or a label, and move to shared, multi-signature control later.

Without a treasury, your revenue is paid straight to your wallet. Add a treasury when you want one pooled balance and more control over it.

> 📷 **Screenshot needed:** the Treasury page.

:::caution Deploy the Treasury first
When you deploy your Fan Club or Storefront, you choose where their revenue is paid — your wallet or your treasury — and **that choice is permanent**. So if you want revenue to flow into your treasury, **deploy the treasury before** those contracts, then select it as the payee.
:::

:::note Wallet required
The Treasury is on-chain, so it needs a connected browser wallet. Connect one from the wallet status bar at the top of the page.
:::

## 1. Deploy your Treasury

1. **Connect your wallet.**
2. **Deploy Treasury.** This is an on-chain transaction with a small deploy cost (in the chain's native token) plus gas.

Your connected wallet becomes the treasury's **owner** — the account that can withdraw. You can transfer ownership to a multisig later without changing the treasury address. Once deployed, the page shows the treasury's contract address and its owner.

## 2. Route your revenue to it

A treasury only fills up if your other contracts pay into it. When you deploy your [Fan Club](./fan-club.md) and [Storefront](./storefront.md), choose your **Treasury** as the payee.

Already deployed one of them straight to your wallet? That payee can't be changed — you'd need to redeploy that contract to reroute it.

## 3. View and withdraw funds

The **Treasury Funds** panel shows what the treasury holds:

- **Native balance** — the chain's native token
- **Stablecoins held** — a row per accepted stablecoin

Withdraw with two buttons: one for the native token, and **Withdraw stablecoins**, which sweeps all stablecoin balances at once. Funds go to your connected wallet, and only the treasury's owner can withdraw.

## 4. Multisig ownership

:::info Coming soon
Shared, more secure control: create a multisig and transfer the treasury's ownership to it, so moving funds requires signatures from multiple members — your band, a label, or a partner — instead of a single key.
:::

## Related

- [Fan Club](./fan-club.md) and [Storefront](./storefront.md) — set your Treasury as their payee
- [Dashboard](./dashboard.md) — see your combined revenue and transactions
