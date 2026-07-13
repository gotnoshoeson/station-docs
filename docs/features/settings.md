---
sidebar_position: 7
---

# Settings

Settings is where you manage your public **artist profile** and your **node configuration**. It's a long page — here's each section, top to bottom.

> 📷 **Screenshot needed:** the Settings page.

## Artist Profile

Your public identity on the network.

- **Display Name** — how your name appears to fans (e.g. "The Clash"). It doesn't have to be unique.
- **Namespace** — your unique ID on the network, used for discovery and in URLs. Lowercase letters, numbers, and hyphens only. This is the handle you share with listeners.
  - Your namespace is **claimed on the network** when you save. Once it's claimed and confirmed, it's **permanent and can't be changed** — so choose carefully.
  - If another node already holds the name you want, you'll be told, and you can pick a different one. (Your display name is separate and always stays yours.)
- **Artist Avatar** — upload a profile image (up to 5 MB), or remove it.
- **Bio** — tell fans about yourself.
- **Social Links** — website, Twitter, and Instagram URLs.

Choose **Save Profile** to save your details and claim your namespace.

:::tip
New here? A short onboarding checklist at the top of Settings walks you through the essentials — display name and namespace (required), plus bio and avatar (optional).
:::

## Node Information

A read-only view of your server's health on the network, refreshed automatically:

- **Network status** — connected, or still connecting to peers
- **Peer ID** — your node's unique network identity (copyable)
- **Domain** — the address your node is served at
- **Connected Peers**, **DHT status**, and **routing table size**

Handy for confirming your server is online and discoverable.

## Blockchain Network

The chain your [Fan Club](./fan-club.md), [Storefront](./storefront.md), and [Treasury](./treasury.md) contracts deploy to. You choose it on first login, and you can change it here — **until your first contract is deployed**. After that, the chain is **locked** (permanent), because your contracts live on it.

Switching chains restarts your node to apply the change.

## Blockchain RPC Endpoints

*Advanced.* This is where your node reads on-chain activity (fan club mints, shop purchases). Your node keeps an **ordered list** of RPC endpoints — built-in public ones plus any you add — and uses the highest-priority working one, falling back down the list if one fails.

You can reorder, enable or disable, **test**, and add or remove your own endpoints. Changes apply live, with no restart. Most artists never need to touch this — the built-in endpoints work out of the box.

## Software Updates

- See your **current version** and build time, and get an **Update Available** banner when a new release is out (with a link to the changelog).
- **Update preferences:**
  - **Auto-update** — update automatically via Watchtower (if you enabled it during install)
  - **Notify only** — just tell you when an update is available
  - **Disabled** — don't check for updates
- When an update is ready, the app shows the exact commands to run on your server:
  ```bash
  docker compose pull station
  docker compose up -d station
  ```
  Your data and settings are preserved through the update.

## Fan Access

Set the **maximum number of devices** a single fan can be signed in on at once. If a fan signs in on a new device beyond the limit, their oldest session is signed out automatically. Pick a value within the allowed range and **Save**.
