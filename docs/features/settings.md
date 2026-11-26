---
sidebar_position: 7
---

# Settings

Settings is where you manage your public **artist profile** and your **node configuration**. It's a long page — here's each section, top to bottom.

> 📷 **Screenshot needed:** the Settings page.

## Artist Profile

Your public identity on the network.

- **Display Name** — how your name appears to fans (e.g. "The Clash"). It doesn't have to be unique.
- **Namespace** — your unique ID on the network, used for discovery and in URLs. Lowercase letters, numbers, and hyphens only, 3 to 32 characters long. It can't start or end with a hyphen. This is the handle you share with listeners.
  - Your namespace is **claimed on the network** when you save. Once it's claimed and confirmed, it's **permanent and can't be changed** — so choose carefully.
  - If another node already holds the name you want, you'll be told, and you can pick a different one. (Your display name is separate and always stays yours.)
- **Artist Avatar** — upload a profile image (up to 5 MB), or remove it.
- **Bio** — tell fans about yourself.
- **Website** — a link to your own site.

Choose **Save Profile** to save your details and claim your namespace.

:::tip
New here? A short onboarding checklist at the top of Settings walks you through the essentials — display name and namespace (required), plus bio and avatar (optional).
:::

## Node Information

A read-only view of your server's health on the network, refreshed automatically:

- **Network status** — connected, or still connecting to peers
- **Peer ID** — your node's unique network identity (copyable)
- **Domain** — the address your node is served at
- **Node address** — your node's full address, with a copy button. Share it so others can join the network through your node: a new artist can paste it into the Station install wizard, and a listener can add it in the [listener app](../network/listener-app.md#connecting-through-another-node). It looks like `/dns4/your-domain/tcp/443/wss/p2p/12D3KooW...`. If your node only has an address for one of the two, you'll see two labelled rows instead, or a short note explaining what's missing.
- **Connected Peers**, **DHT status**, and **routing table size**

Handy for confirming your server is online and discoverable.

## Blockchain Network

The chain your [Fan Club](./fan-club.md), [Storefront](./storefront.md), and [Treasury](./treasury.md) contracts deploy to. You choose it on first login, and you can change it here — **until your first contract is deployed**. After that, the chain is **locked** (permanent), because your contracts live on it.

The lock doesn't wait for a deploy. It applies as soon as any contract address is saved to your node.

Switching chains restarts your node to apply the change.

## Local Indexer

*Advanced.* Station's indexer runs on your server and watches your Fan Club and Storefront contracts, recording sales and fan access. It reads the chain through an **ordered list** of endpoints and uses the first one that works, falling back down the list if one fails. If you run [ETH-RPC](#eth-rpc) on your server, it is first in the list as **Your local eth-rpc**; public endpoints follow.

You can reorder, enable or disable, **test**, and add or remove your own endpoints. Changes apply live, with no restart. Most artists never need to touch this — the built-in endpoints work out of the box.

## ETH-RPC

*Advanced.* Shown only on Polkadot Hub, Kusama Hub and Polkadot Hub TestNet. ETH-RPC is a service on your server that keeps its own database of the chain's transactions; the Local Indexer reads from it. ETH-RPC in turn reads blocks from an **ordered list** of Substrate RPC nodes run by public providers, and uses the first one that works.

A status box shows which node ETH-RPC is reading from. If a node stops answering, ETH-RPC moves to the next one on its own. Changing the first node in the list restarts ETH-RPC (about 30 seconds; it resumes where it left off), and it won't switch again within 5 minutes unless you press **Check now**.

## Software Updates

- See your **current version** and build time, and get an **Update Available** banner when a new release is out (with a link to the changelog). Station checks every 6 hours.
- **Update preferences:**
  - **Auto-update** — update automatically. Station asks Watchtower, which every install includes, to apply the new version.
  - **Notify only** — just tell you when an update is available. This is the default.
  - **Disabled** — don't check for updates
- When an update is ready, the app shows the exact commands to run on your server:
  ```bash
  docker compose pull station
  docker compose up -d station
  ```
  Your data and settings are preserved through the update.

## Change Password

Enter your current password and a new one (at least 8 characters), then confirm it. When the password changes, every other browser signed in to your dashboard is signed out; the one you're using stays signed in.

## Fan Access

Set the **maximum number of devices** a single fan can be signed in on at once. If a fan signs in on a new device beyond the limit, their oldest session is signed out automatically. Pick a value within the allowed range and **Save**.
