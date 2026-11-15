---
sidebar_position: 2
---

# Set Up Your Wallet

A **wallet** is the app that holds your keys and signs transactions. It's how Station knows the Fan Club, Storefront, and Treasury you're deploying belong to you — and it's where your revenue lands.

You only have to do this once. Budget about ten minutes, and don't rush the backup step.

## 1. Install a wallet

Station works with any browser wallet that supports Polkadot's Asset Hub. **[MetaMask](https://metamask.io/)** is the most common choice and the one these docs assume; **[Talisman](https://talisman.xyz/)** works too and is built for the Polkadot ecosystem.

Polkadot's own guide walks through both: [Wallets for Polkadot Smart Contracts](https://docs.polkadot.com/smart-contracts/integrations/wallets/).

Install the extension, then choose **Create a new wallet** and follow the prompts.

## 2. Back up your recovery phrase

When you create a wallet, it shows you a **recovery phrase** — 12 random words. Those words *are* your wallet. Anyone who has them owns your money, and if you lose them, nobody on earth can get your account back.

:::danger This is the one step you cannot undo
There is **no password reset** and **no support line**. Station cannot recover your wallet, and neither can MetaMask — nobody has a copy.

- **Write the words on paper**, in order. Store it somewhere you'd keep a passport.
- **Don't screenshot it, don't email it, don't put it in a notes app** or anything that syncs to the cloud.
- **Never type it into a website.** Not one that looks like MetaMask, not one claiming to help, not Station. No legitimate site will ever ask for it.
- **Consider a second paper copy** in a different physical location.

Lose the phrase and you lose your [Treasury](../features/treasury.md) — the wallet that deploys it is the only account that can ever withdraw from it. Right now, on testnet, that costs you nothing. On mainnet it will be real money.
:::

Take the time to do this properly now, while the stakes are zero. Practicing on testnet is exactly what testnet is for.

:::caution Pick one account and stay on it
MetaMask can hold many accounts. **The account you're connected with when you deploy is the account that owns the contract and receives the revenue** — permanently. If you switch accounts partway through setup, you'll deploy your Storefront to one address and your Fan Club to another, and there's no undo. Decide on one account before you deploy anything, and check the wallet status bar shows that address each time.
:::

## 3. Connect it to Station

1. Open your Station dashboard and log in.
2. On first login you'll be asked to **choose your chain**. Pick **Polkadot Hub TestNet**. (Your node restarts briefly to apply it. You can change this in [Settings](../features/settings.md) — but only until your first contract is deployed, after which it's locked.)
3. Click **Connect Wallet** in the wallet status bar at the top of the page.
4. Approve the connection in MetaMask.

Your address appears in the status bar once you're connected.

## 4. Add Polkadot Hub TestNet to your wallet

Your wallet needs to know about Polkadot Hub TestNet before it can sign anything there. This test network is also called **Paseo**, so you may see that name in other guides. **Station does this for you.** You don't need to type in network settings by hand.

If your wallet is on another network, the status bar shows a **Switch to Polkadot Hub TestNet** button. (Some pages show a **Wrong Network** badge with a **Switch** button instead. It does the same thing.) Click it. Your wallet asks to add the network with everything filled in, then asks to switch to it. Approve both. The badge turns green and shows the network name.

Your wallet lists the network as **Polkadot Testnet**. That's the name wallets use for the same chain.

If it doesn't go smoothly, the dashboard tells you what happened:

- **You declined in the wallet.** The dashboard says the request was cancelled, and you can choose **Try again** when you're ready. If it still won't work, choose **Still not working? Add it by hand** to see the network details.
- **Your wallet couldn't add the network on its own.** The dashboard shows a card with each value and a **Copy** button beside it. Add them as described below.

You don't have to come back here before each transaction. When you deploy a contract, save a price in your Storefront, or send any other transaction, the dashboard checks your wallet's network first. If it's on the wrong one, your wallet asks to switch before anything is sent.

:::note Adding it manually
Only needed if the prompt doesn't appear, or you'd rather add the network before installing Station. In MetaMask, open the menu (top right), choose **Networks**, then **Add a custom network**. On mobile, tap the network selector on the Tokens tab, open **Custom**, then **Add a custom network**. Enter these values (the RPC URL goes in with **Add RPC URL**) and choose **Save**:

| Field | Value |
|-------|-------|
| Network name | Polkadot Testnet |
| RPC URL | `https://eth-rpc-testnet.polkadot.io` |
| Chain ID | `420420417` |
| Currency symbol | `PAS` |
| Block explorer URL | `https://blockscout-testnet.polkadot.io` |

Polkadot's docs keep the canonical copy of these values, along with backup RPC endpoints: [Connect to Polkadot](https://docs.polkadot.com/smart-contracts/connect/). You'll see a few names for this network. Station shows it as **Polkadot Hub TestNet**, wallets list it as **Polkadot Testnet**, and older guides call it **Paseo** or **Paseo Asset Hub**. They're all the same chain. Check the chain ID is `420420417` and you're in the right place.
:::

## Next step

Your wallet is connected but empty. Every on-chain action — deploying a contract, withdrawing funds — needs PAS to pay the network fee.

→ [Get Test Tokens](./test-tokens.md)
