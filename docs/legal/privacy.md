---
sidebar_position: 2
---

# Privacy Policy

**Version:** `2026-11-27` · **Effective:** 27 November 2026

This Privacy Policy explains what information **Colour Labs LLC** ("Colour Labs", "we", "us") receives when you use the Services described in our [Terms of Service](/legal/terms), what we do with it, and what we don't receive at all. Words defined in the Terms mean the same here.

## 1. The short version

- **We receive very little.** Artists' music lives on their own servers. We don't run accounts, and we don't host anyone's music.
- **Most information is held by someone else.** Each artist's server holds the records about the people who use it, and the artist is responsible for them. Payments are recorded on a public blockchain, which no one, including us, can change.
- **Some third-party services see you when you use the listener app**, in particular Reown, the company behind the wallet-connection tool the app uses. Section 3.2 lists them.
- **We don't sell personal information, and we don't use it for advertising.**

## 2. Who is responsible for what

- **Colour Labs** is responsible for the information described in § 3: what reaches our websites, the listener app we host, our boot nodes and our email.
- **Each artist or operator** runs their own server and is responsible for the information on it, such as who streamed, bought or rented what (§ 4). We have no access to it and are not responsible for how artists handle it. An artist may have their own privacy notice.
- **The blockchain** records payments, wallet addresses and FanPins publicly and permanently (§ 5). No one, including us, can change or remove what is recorded there.

## 3. What Colour Labs receives

### 3.1 Our websites: qnch.network and docs.qnch.network

Our websites are hosted by Vercel. When you visit them, or when the install script, the installer or a Station server downloads files from them, Vercel receives standard request information: your IP address, your browser or client details, the address requested and the time. Vercel handles it under its own [privacy notice](https://vercel.com/legal/privacy-policy), and we can see it in Vercel's logs.

We don't use analytics, advertising or tracking tools of our own on these websites. The qnch.network site loads fonts from Google Fonts, so Google receives your IP address and browser details when you open it; Google handles them under its own [privacy policy](https://policies.google.com/privacy). The docs.qnch.network site doesn't contact any outside service.

### 3.2 The listener app: beta.qnch.network

The listener app is a website we host on Vercel. It has no accounts and asks you for no personal details. Using it sends information to the following places:

- **Vercel**, our host, receives the same request information as for our websites (§ 3.1).
- **Reown.** To let you connect a wallet, the app uses Reown's AppKit. **Every time the app opens**, before you connect a wallet and whether or not you ever do, AppKit contacts Reown's servers to load its settings and fonts and to report that the app has started. These requests carry our project ID, the address of the page, the app's settings and the time, along with your IP address and browser details. If you connect a wallet through WalletConnect, messages between the app and your wallet pass through WalletConnect's relay servers. Reown handles this information under its own terms and [privacy policy](https://reown.com/privacy-policy).
- **Your wallet.** Your wallet app or extension is provided by another company and has its own privacy practices.
- **Blockchain endpoints.** To show on-chain information and to check payments, the app reads from public blockchain endpoints run by third parties, such as Parity's. Those providers receive your IP address and the queries the app makes, which can include your wallet address.
- **Our boot node.** The app connects to one of our boot nodes to look artists up. The boot node receives your IP address, a random network identity your browser creates each time the app starts, and the artist names you look up. It may record these in its logs.
- **Artists' servers.** When you open an artist, your browser fetches the catalog, artwork and audio directly from that artist's server. That server receives your IP address, your browser details and what you request. When you connect a wallet for gated, bought or rented music, it also receives your wallet address, a message signed by your wallet to prove you control it, and a key your browser creates for that session. That information is held by the artist, not by us (§ 4).

**What stays in your browser.** The artists you follow, the albums you save, your recent searches, the servers you connect through, the choices you make between competing artist names, and cached catalogs are stored in your browser. Reown and the wallet libraries also store connection details there. None of this is sent to us. You can delete it by clearing your browser's data for the site.

### 3.3 The Station software on an artist's server

The Station software runs on the operator's own server. Your dashboard email and password, your music, your settings, the record of your acceptance of the Terms, and your server's records about listeners stay on your server. We don't receive them.

What the software does send:

- **To us:** a request for our version file on qnch.network when it starts and every six hours, unless you turn update checks off. That request carries your server's IP address. Your server also takes part in the network (§ 3.4), so our boot nodes receive what any other Station server would.
- **To third parties:** container images are downloaded from GitHub's registry and Docker Hub. The installer looks up your server's public IP address through ipify or ifconfig.me, sends your subdomain and token to DuckDNS if you choose DuckDNS, and installs software from Docker and Charm's package repositories. Let's Encrypt receives the email address you enter during install, to issue your HTTPS certificate. The web server the installer sets up checks for its own updates. Your server reads blockchain data from the endpoints in its list. Each of these services handles that information under its own terms.

### 3.4 Our boot nodes

Our boot nodes are Station servers that help other Station servers, and the listener app, find each other. To do that, they receive the IP addresses and network identities of the servers and browsers that connect to them, the name records that Station servers publish (an artist's name, their server's network identity and a validity date), the network addresses at which Station servers can be reached, and the names that are looked up. They may record these in operational logs. They receive no music.

### 3.5 When you contact us

If you email us, we receive your email address and whatever you write. Our email is provided by Proton.

## 4. What artists' servers hold

Each Station server is run by an independent artist or operator, not by us. A server can hold, for example:

- the artist's dashboard login (email and a scrambled form of the password);
- the wallet addresses of people who have bought, rented or made Fan Club contributions, with amounts and times, copied from the blockchain;
- records of which wallets have been given access, including access that was later withdrawn;
- session records for wallets that have signed in to stream gated music; and
- web server logs with visitors' IP addresses, browser details and what they requested.

If you have a question about information an artist's server holds, contact that artist. We can't see, change or delete it.

## 5. What is public on the blockchain

Fan Club contributions, Station Shop purchases and rentals, FanPin transfers and contract creation all happen on a **public blockchain**. Anyone can see the wallet addresses involved, the amounts, the times, the contract, what was bought (for example, a track's identifier), which FanPins a wallet holds, and anything an artist writes to the blockchain, such as a FanPin generation's description and image identifier. This information is **permanent and outside anyone's control, including ours**. If you don't want this information to be public, don't make on-chain transactions.

## 6. What we don't receive

- No accounts, passwords or central database of users.
- No copies of artists' music, artwork or catalogs.
- No listening history. Which tracks you play is seen only by the artist's server you play them from.
- No access to your wallet, private keys or funds.

## 7. How we use what we receive

We use it to run, secure, fix and improve the Services, to answer you when you contact us, and to comply with the law. We don't sell personal information, use it for advertising, or build profiles of you. We don't share personal information with third parties for their own marketing.

## 8. Who we share it with

- **Service providers** that run parts of the Services for us, such as Vercel, Proton and the company that hosts our boot nodes.
- **Law enforcement and others** when the law requires it, or when we believe in good faith that disclosure is needed to protect someone's safety or rights or to investigate abuse of the Services.
- **A successor**, if Colour Labs or the Services are sold, merged or transferred.

## 9. How long we keep it

We keep information only as long as we need it for the purposes in § 7. Logs on our boot nodes are kept for operational purposes and then deleted or overwritten. Vercel keeps request logs under its own terms. We keep emails as long as we need them to deal with what you wrote and for our records.

## 10. Security

We take reasonable steps to protect the information we receive, but no system is perfectly secure.

## 11. Children

The Services are not for children under 13, and we don't knowingly collect personal information from them. If you believe a child under 13 has sent us personal information, contact us and we will delete it.

## 12. Your choices and rights

- Wherever you live, you can ask us what personal information we hold about you, and ask us to correct or delete it, by emailing colourlabs@proton.me. We'll respond within 45 days. We may need to confirm who you are first. We won't treat you differently for asking.
- Depending on where you live, you may have further rights under local law, such as the right to object to how we use your information or to complain to a data protection authority.
- We can't act on information held by an artist's server (§ 4), by third-party services (§ 3) or on the blockchain (§ 5).
- Our websites don't respond to "Do Not Track" signals, because we don't track you across other sites.

## 13. If you are outside the United States

Colour Labs is based in the United States, and the information we receive is processed there and wherever our service providers operate. Where a law, such as the GDPR, requires a legal basis for using personal information, we rely on our legitimate interest in running and securing the Services, on complying with the law, and, when you contact us, on answering you.

## 14. Changes to this policy

We may update this policy. Each version has a version label (its date) and an effective date, shown at the top, and the current version is published at docs.qnch.network/legal/privacy. If a change materially affects how we handle your information, we will publish it at least 30 days before it takes effect.

## 15. Contact

- **Colour Labs LLC**, 2108 N St, Ste N, Sacramento, CA 95816, USA
- **Email:** colourlabs@proton.me
