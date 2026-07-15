---
sidebar_position: 1
---

# Overview

Your music lives on your server. Your **money** lives on a public blockchain.

Your [Fan Club](../features/fan-club.md), [Storefront](../features/storefront.md), and [Treasury](../features/treasury.md) are **smart contracts** — small programs you deploy once and own outright. When a fan mints a FanPin or buys a track, their payment goes straight to your contract and settles in seconds. No bank, no card processor, no platform sitting in the middle deciding whether you get paid.

## Minimally extractive

This is why Station exists.

Minimal extraction here isn't a value we hold or a promise we're asking you to take on faith. It's a **cryptographic law**. The share Station takes is written into the contracts you deploy and own — not a policy in a document we can revise, not a number in a database we control. It's math, and it's yours.

In the beginning, the split is **0% | 100%** — nothing to Station, everything to you. Early adopters lock that rate in for good. Artists who arrive later get whatever the split is on the day they deploy, and keep that. [Revenue Split](./revenue-split.md) covers how it's enforced.

Everything below is what that buys you — plus the three things you need before any of it works: a **wallet**, the **network** it talks to, and some **tokens** to pay for transactions.

## A sovereign payment system

The same way running your own server means nobody can deplatform your music, running your own contracts means nobody can deplatform your income:

- **You hold the keys.** Your revenue is paid to an address only you control. There's no account to suspend and no support queue to wait in.
- **No approval needed.** No application, no underwriting, no merchant account. Deploy a contract and you can take payment from anyone, anywhere, immediately.
- **No chargebacks.** Settled payments are final. Nobody can claw back a sale months later.
- **No percentage cut.** Station's split starts at **0% | 100%** — you keep everything — and it's locked into your contract the day you deploy, so it can't be raised on you later. See [Revenue Split](./revenue-split.md).
- **Open by default.** Every transaction is publicly verifiable on a block explorer — including the ones paying you.

## Very low transaction costs

Station runs on Polkadot's **Asset Hub**, which is built for cheap, fast settlement. A transaction — a fan minting a FanPin, a sale, a withdrawal — typically costs a fraction of a cent in network fees. It's a flat fee, so it doesn't scale with your success: selling a $20 record costs about the same to settle as a $2 one.

The bigger difference is how little there is to understand. Streaming payouts arrive through a genuinely complicated financial model — revenue pools, per-stream rates that move month to month, distributors, labels, several kinds of royalty — with enough moving parts that working out what you earned, or why, becomes a job of its own. Station isn't a cheaper version of that model. It doesn't have one. A fan pays, your contract splits the payment, you withdraw, and every step is readable on a block explorer.

## Secured by a global network

The security here isn't a promise from a company — it's cryptography and a decentralized validator network, the same design that secures the broader blockchain economy. [More than $2 trillion of value](https://coinmarketcap.com/) is currently held on public blockchains, which is the practical measure of how much scrutiny and incentive there is to keep these systems sound.

The tradeoff is that this security is **yours to maintain**. There's no password reset. Your keys are the account, which is why [Set Up Your Wallet](./wallet.md) spends most of its time on backing them up properly.

:::tip Right now, this is a testing environment
Station is live on **Paseo Asset Hub**, Polkadot's test network. The PAS tokens you'll use are **free from a faucet and worth nothing** — they exist so you can deploy contracts, take fake payments, and make mistakes without losing anything real.

**Mainnet hasn't launched yet.** When it does, the same flow will move real currency with real value, and a lost key will mean lost money. This is the moment to get comfortable — practice here, where there's nothing to lose. We'll update these docs the moment mainnet is live.
:::

## Next steps

1. [Set Up Your Wallet](./wallet.md) — install a wallet, back it up, and connect it to Station
2. [Get Test Tokens](./test-tokens.md) — grab free PAS from the faucet
3. [Revenue Split](./revenue-split.md) — how Station earns, and why your rate can't be raised later
