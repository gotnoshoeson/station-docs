---
sidebar_position: 3
---

# Get Test Tokens

Every on-chain action costs a small network fee, paid in the network's own token. On Paseo Asset Hub that token is **PAS**, and it's free.

You need PAS before you can deploy your [Fan Club](../features/fan-club.md), [Storefront](../features/storefront.md), or [Treasury](../features/treasury.md). A wallet with a zero balance can connect to Station, but it can't sign anything.

## Get PAS from the faucet

A **faucet** hands out free test tokens on request. Polkadot runs the official one.

1. **Copy your wallet address.** In MetaMask, click your account name at the top — it copies the address (a long string starting with `0x`).
2. **Go to the [Polkadot Faucet](https://faucet.polkadot.io/).**
3. **Select the network.** Choose **Paseo Asset Hub** from the Network dropdown. (Polkadot labels this **Polkadot Hub TestNet** in some places — same chain.)
4. **Paste your address** into the address field.
5. **Complete the CAPTCHA**, then click **Get some PASs**.

Your tokens arrive in a few seconds. Polkadot's own walkthrough is here if you want a second reference: [Connect to Polkadot → Test Tokens](https://docs.polkadot.com/smart-contracts/connect/#test-tokens).

## Check that it worked

Open MetaMask with **Paseo Asset Hub** selected as the network and you should see a PAS balance.

If it's still zero:

- **Check the network.** A balance only shows on the network it's on. Make sure MetaMask is on Paseo Asset Hub (chain ID `420420417`), not Ethereum Mainnet.
- **Check the address.** Confirm the address you pasted matches the one in your wallet — and that it's the account you plan to deploy with.
- **Look it up directly.** Paste your address into [Blockscout](https://blockscout-testnet.polkadot.io) to see what the chain actually thinks your balance is.
- **Give it a minute**, then try the faucet again. Faucets rate-limit repeat requests, so if you've asked recently you may need to wait before it'll dispense again.

## How much do you need?

Not much. Deploying a contract is the most expensive thing you'll do, and one faucet request covers deploying a Fan Club, a Storefront, and a Treasury with plenty left over for day-to-day transactions. If you run low, just ask the faucet again.

:::note These tokens aren't worth anything
PAS is free, unlimited, and has no market value — it's play money for a test network. You can't cash it out, and revenue you "earn" on testnet isn't real revenue.

That's the point: deploy things, take fake payments, get a withdrawal wrong, and try again. Nothing here can cost you. When mainnet launches, this same flow will move real currency — and there'll be no faucet. See [Overview](./overview.md) for what changes.
:::

## Next step

Wallet connected, network added, tokens in hand. You're ready to start taking payments.

- [Revenue Split](./revenue-split.md) — worth reading before you deploy: your rate is locked in at deploy time
- [Fan Club](../features/fan-club.md) — turn listeners into paying supporters
- [Storefront](../features/storefront.md) — sell tracks, albums, and rentals
- [Treasury](../features/treasury.md) — pool your revenue in one address you control (deploy this **first** if you want to use it)
