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
2. On first login you'll be asked to **choose your chain**. Pick **Paseo Asset Hub**. (Your node restarts briefly to apply it. You can change this in [Settings](../features/settings.md) — but only until your first contract is deployed, after which it's locked.)
3. Click **Connect Wallet** in the wallet status bar at the top of the page.
4. Approve the connection in MetaMask.

Your address appears in the status bar once you're connected.

## 4. Add Paseo Asset Hub to your wallet

Your wallet needs to know about Paseo Asset Hub before it can sign anything there. **Station does this for you** — you don't need to type in network settings by hand.

If the status bar shows a **Wrong Network** badge, click **Switch**. MetaMask will pop up asking to add Paseo Asset Hub with everything filled in. Approve it, then approve the switch. The badge turns green and shows the network name.

:::note Adding it manually
Only needed if the prompt doesn't appear, or you'd rather add the network before installing Station. In MetaMask: open the network dropdown → **Custom** → **Add a custom network**, then enter:

| Field | Value |
|-------|-------|
| Network name | Paseo Asset Hub |
| RPC URL | `https://eth-rpc-testnet.polkadot.io/` |
| Chain ID | `420420417` |
| Currency symbol | `PAS` |
| Block explorer URL | `https://blockscout-testnet.polkadot.io` |

Polkadot's docs keep the canonical copy of these values, along with backup RPC endpoints: [Connect to Polkadot](https://docs.polkadot.com/smart-contracts/connect/). Heads up — **Polkadot's docs and the faucet call this network "Polkadot Hub TestNet"**. It's the same chain as Paseo Asset Hub; check the chain ID is `420420417` and you're in the right place.
:::

## Next step

Your wallet is connected but empty. Every on-chain action — deploying a contract, withdrawing funds — needs PAS to pay the network fee.

→ [Get Test Tokens](./test-tokens.md)
