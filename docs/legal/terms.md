---
sidebar_position: 1
---

# Terms of Service

**Version:** `2026-11-27` · **Effective:** 27 November 2026

These Terms of Service ("Terms") are an agreement between you and **Colour Labs LLC**, a California limited liability company ("Colour Labs", "we", "us", "our"). Please read them. They include a limit on our liability (§ 12), a promise from you to cover claims that arise from what you do (§ 13), and an agreement to resolve most disputes by individual arbitration instead of in court or as a class action (§ 16).

## 1. The agreement

### 1.1 What these Terms cover

These Terms cover the services listed in § 3.1: the Station software, the listener app, our boot nodes, the FanSociety contracts we deploy, and our websites (together, the "Services").

**Names used here.** The **QNCH Network** is the network that Station servers form together. **Station** is the software. **FanSociety** is the set of smart contracts Station uses for Fan Clubs, Station Shops and Treasuries.

### 1.2 How you accept

- **Artists and operators.** You accept these Terms when you tick "I agree" while setting up your Station server, or, if it happens first, when you install, run or use the Station software.
- **Listeners.** You accept these Terms when you use the listener app.
- **On behalf of someone else.** If you accept for a band, a label, a company or an artist you work for, you confirm that you have the authority to bind them, and "you" includes them.

If you don't agree, don't use the Services.

When you accept at setup, your Station server stores the version you accepted, the time, and your dashboard login email. That record stays on your server. We don't receive a copy of it.

### 1.3 Other documents that are part of these Terms

The [Acceptable Use Policy](/legal/acceptable-use), the [Copyright Policy](/legal/copyright) and the [Station Software License](/legal/software-license) are part of these Terms. The [Privacy Policy](/legal/privacy) explains what information we handle and how.

## 2. Definitions

- **Artist**: a person or group whose music, artwork or other material is published from a Station server.
- **Operator**: anyone who installs or runs the Station software, including someone who does it for an artist. An artist who runs their own server is both.
- **Listener**: anyone who uses the listener app.
- **Supporter**: a listener who makes a contribution to an artist's Fan Club.
- **Buyer**: a listener who buys or rents from an artist's Station Shop (shown as "Storefront" in the dashboard).
- **Content**: music, artwork, lyrics, text, metadata and anything else an operator makes available from a Station server.
- **Name record**: the signed record a Station server publishes to the network. It contains the artist's name on the network (their "namespace"), the network identity of the server or servers allowed to serve it, and the date until which it is valid.
- **Contracts**: the FanSociety smart contracts, including each Fan Club, Station Shop and Treasury contract created from them, and the transactions made through them.
- **Test network**: a blockchain network meant for testing, such as Polkadot Hub TestNet (also called Paseo). Its tokens have no monetary value.

## 3. What we run, and what we don't

Station is software that artists run on their own servers. The rest of these Terms depends on what we operate and what we don't, so this section sets it out plainly.

### 3.1 What we provide

- **The Station software.** The Station server program with its built-in artist dashboard, the container images we publish for it and for the blockchain indexer that runs beside it, and the install script and installer. It runs on a server you choose and control. The [Station Software License](/legal/software-license) covers it.
- **The listener app** at beta.qnch.network, and at any other address where we publish it. We host it on Vercel, and it runs in the listener's browser. When a listener opens an artist, the browser fetches the catalog, artwork and audio **directly from that artist's server**. They do not pass through our servers.
- **Boot nodes.** We run one or more boot nodes: Station servers that act as entry points to the network. They help Station servers find each other, keep copies of name records as other Station servers do, and answer name lookups from the listener app. The listener app connects to our boot node first, and it can connect through any artist's server instead. Our boot nodes carry no music, artwork or catalogs. If our boot nodes are down, Station servers keep running and can join the network through each other, and the listener app can still look artists up through an artist's server whose address the listener has saved or entered.
- **Update information.** Your Station server checks a version file on qnch.network when it starts and every six hours, to learn whether a newer release exists. What happens next depends on the update setting in your dashboard. **Notify only** (the default) shows you that an update is available and how to apply it. **Automatic** has your server download the new release we publish and restart onto it, using a third-party updater that the installer places beside it. **Disabled** stops the check.
- **Default blockchain endpoints.** The software comes with a list of third-party services that it reads blockchain data from. You can reorder, turn off, add and remove them in the dashboard. Unless you turn it off, the installer also sets up a blockchain indexer that runs on your own server and reads from third-party endpoints.
- **The FanSociety contracts.** We deploy the shared contracts that your Fan Club, Station Shop and Treasury are created from: a factory, the contract code, the beacons that point to that code, a list of accepted payment tokens, and the treasury contract that receives our share. § 9 sets out the authority we hold over them.
- **Our websites**, qnch.network and docs.qnch.network, including the install script, installer and release notices published there.

### 3.2 How the network finds artists

Each Station server announces its artist's name record to the other servers in a distributed hash table that is private to the QNCH Network and kept by the servers taking part in it. There is no recommendation engine, directory or browse page, and we don't rank or curate artists. Names are claimed first come, first served (§ 5.5).

### 3.3 What we don't do

- **We don't host your music.** Operators store and serve their own Content from servers they run. We hold no copy of it.
- **We don't run accounts.** Your dashboard login is created and stored on your own server. We can't see it, reset it or recover it. Listeners have no account with us; what a listener follows or saves is kept in their own browser.
- **We don't review, moderate or curate.** The Services have no feature that lets us review, edit, remove, block or de-list Content or a name, and we don't operate one. We are not the publisher of any operator's Content.
- **We can't reach your server.** We have no access to your server, files, credentials or data.
- **We don't take custody of payments.** Payments go from the payer's wallet to contracts the artist deploys and owns. We don't hold anyone's wallet, keys or recovery phrase. § 9 describes the share of payments that the contracts route to us and the authority we hold over the contract code. Read it together with this sentence.

### 3.4 What we do control

We control only what we operate ourselves: the listener app, our boot nodes, our websites, the software, images and installer we publish, the version file, and the contract authority described in § 9. If you set updates to automatic, a new release we publish will be installed on your server without further action from you.

## 4. Who can use the Services

- To accept these Terms as an artist or operator, or to make any payment through the Services, you must be at least 18 years old, or the age of majority where you live if that is higher.
- Listeners aged 13 to 17 may use the listener app only with the permission of a parent or guardian, who accepts these Terms for them. The Services are not for children under 13.
- You may not use the Services if you are located in, or ordinarily resident in, a country or region subject to comprehensive U.S. sanctions, or if you are on a U.S. government list of prohibited or restricted parties.
- You are responsible for everything done with your server, your dashboard login and your wallet, and for keeping them secure. We don't hold your login or your wallet's recovery phrase and can't restore either.

## 5. Artists and operators

If you publish Content, run a Station server, or both, you agree to the following.

### 5.1 Your rights in your Content

You own, or have all the rights, licenses and permissions needed for, everything you publish, and for listeners to stream, download, buy and rent it in the ways you offer it. That includes compositions, recordings, samples, artwork, lyrics and anything that came from someone else.

### 5.2 Your responsibilities

You alone are responsible for:

- your Content;
- your server, domain and hosting provider, and their security, backups and uptime;
- your wallet, keys and contracts;
- the laws that apply to you, your Content and your sales, wherever you and your listeners are, including consumer, tax and privacy law; and
- your dealings with your listeners, supporters and buyers.

No one else holds a copy of your Content. When your server is offline, your music, your shop and anything a buyer or supporter has access to are unavailable.

### 5.3 Data on your server

Your server holds data about the people who use it. For example: wallet addresses; purchase, rental and FanPin records; the ledger of access it has given and withdrawn (§ 7.4); and web server logs that record visitors' IP addresses and what they requested. You are responsible for that data and for any privacy notice the law requires you to give your listeners. We have no access to it.

### 5.4 The license you give us

You give Colour Labs a non-exclusive, worldwide, royalty-free license to store, copy and transmit your name records as needed to run our boot nodes and answer lookups, and to let the listener app show your Content **as the listener's browser fetches it from your server**. This is not a license to host, copy or store your Content, and we hold no copy of it. Your name records also spread to other Station servers through the network; that is how a peer-to-peer network works. The license ends when your name record is no longer valid on the network, except for copies already made in the normal running of the network.

### 5.5 Names

Names are claimed first come, first served, and are held by the server that registered them. A name lapses if your server stops renewing it: currently about five weeks after your server last renewed it. After that, another server can register the same name. We don't assign, reserve or guarantee names, and there is no process by which we assign, reassign or remove one. A name gives you no rights in that name outside the network. You will not register a name to impersonate another person or artist, or to mislead listeners about who you are. Disputes over a name are between the people involved.

### 5.6 Updates

The update setting in your dashboard starts at "notify only", under which the software on your server changes only when you apply an update yourself. If you set it to automatic, the software on your server will change when we publish a new release, without further action from you.

### 5.7 Running Station for someone else

If you set up or run a Station server for an artist, you accept these Terms both for yourself and on the artist's behalf, and you confirm that the artist has authorized you to do so. You and the artist are each responsible under these Terms.

### 5.8 Access decisions are made by your server

§ 7 applies to anything you offer through a Fan Club or Station Shop. It is your server, not Colour Labs, that gives, holds back and withdraws access to your Content (§ 7.4), and your server keeps the record of those decisions.

## 6. Listeners

- **How you may use Content.** You may stream, download and keep Content only as the artist allows and for your own personal, non-commercial use. You will not copy, redistribute or resell Content, or get around any access control, except as the artist expressly allows.
- **Content comes from the artist.** Content is served by the artist's server, not by us. Whether it stays available, including Content you have bought, rented or been given access to, depends on the artist keeping their server running. We can't restore Content an artist removes or stops serving.
- **What you can do with Content depends on how you have access to it**, and the artist's server enforces it:
  - Content an artist makes **free to stream**, to everyone or to holders of a FanPin, can be streamed. It can't be downloaded unless you've bought the track or its album from that artist's Station Shop.
  - A **rental** lets you stream the rented album for the rental period. It doesn't include downloads.
  - A **purchase** of a track or album lets you stream it and download it. The download becomes available once the network has made the purchase final (§ 7.4).
  - Content can't be streamed or downloaded before the release time the artist has set for your audience, whether or not you've bought it.
- **Access can come before a payment is final, and can be withdrawn** if the payment doesn't survive on the blockchain. § 7.4 explains when.
- **Your wallet is yours.** You choose and control the wallet you use. We don't hold it, can't see your keys, and can't undo a transaction you sign.
- **Your browser keeps your library.** Who you follow, what you save and the servers you connect through are stored in your browser. If you clear your browser's data, they're gone, and we can't restore them.

## 7. Fan Club contributions and Station Shop sales

Station lets an artist deploy two different kinds of contract. They are different things, and these Terms treat them differently.

### 7.1 Fan Club contributions (FanPins)

A Fan Club lets a supporter make a **voluntary contribution to support an artist**. The supporter receives a FanPin, a token that records the contribution.

- **A contribution is support, not a purchase.** It is not payment for the FanPin or for any Content or access.
- **Access is the artist's to give.** An artist may choose to give holders of a particular FanPin generation access to particular releases. That access is given by the artist, from the artist's server. The artist may change or end it, and it lasts only as long as the artist's server provides it.
- **Streaming only.** Access an artist attaches to a FanPin is access to stream. Downloading needs a separate purchase of the track or its album from the artist's Station Shop (§ 7.2).
- **FanPins can be transferred.** Access an artist attaches to a FanPin follows the wallet that holds it.
- **Not an investment.** FanPins give no ownership interest, no share of revenue and no expectation of profit or financial return. They are not offered or sold by Colour Labs.
- **Not a charitable donation.** Colour Labs does not describe contributions as charitable donations or as tax-deductible, and artists must not either.
- **Where the money goes.** A contribution is paid into the artist's Fan Club contract and divided as § 9.2 describes. Apart from that share, it is not paid to Colour Labs.
- **Provisional access.** The artist's server recognizes a FanPin as soon as it sees the contribution, or a transfer of the FanPin, in a block, and can withdraw the access attached to it if that block doesn't survive (§ 7.4).

### 7.2 Station Shop sales

A Station Shop lets an artist sell albums and tracks and, if the artist turns it on, rent albums for a limited time (streaming only). These are ordinary sales **between the artist and the buyer**.

- **The artist is the seller.** The artist sets the prices and terms, delivers what is bought from their own server, and is responsible for refunds, consumer-law obligations, and sales or other transaction taxes. Colour Labs is not the seller, not the merchant of record, and not a party to the sale.
- **What a purchase includes.** A buyer of a track or album can stream it and download it from the artist's server. Downloads are only for buyers, and only once the purchase is final (§ 7.4).
- **What a rental includes.** A rental lets the buyer stream the rented album until the rental period ends. It doesn't include downloading the album or any track on it. The artist's server calculates and enforces the rental period.
- **Paying more than the price.** If a payment sends more than the price, the contract keeps the whole amount and divides it like any other payment. It doesn't return the difference.
- **No refunds through the contracts.** The contracts have no refund function. Any refund is a matter between the artist and the buyer. Withdrawal of access under § 7.4 is not a refund: it happens when the artist's server finds that the payment didn't take place on the blockchain.

### 7.3 Taxes and records

Each artist is responsible for reporting and paying any tax on amounts they receive, including Fan Club contributions, and each supporter and buyer for their own. The dashboard can export a record of the transactions your server has indexed. That export is a convenience: it may be incomplete or delayed (§ 9.7), and it is not a tax document or tax advice. In the current software, a payment your server has marked as reversed (§ 7.4) is **still included** in the dashboard's income figures, its transaction list and the export.

### 7.4 Provisional access, held downloads and withdrawn access

This section describes what an artist's server does when it learns of a purchase, a rental, a Fan Club contribution or a FanPin transfer. Colour Labs takes no part in these decisions and can't make or undo them.

- **Access comes before the payment is final.** A blockchain adds transactions in blocks. For a short time after a block is produced, the network can still replace it; after that, the network makes the block final. The artist's server gives access as soon as it sees the transaction in a block, without waiting for the block to become final, so that streaming can start straight away.
- **Downloads wait until the purchase is final.** A delivered file can't be taken back, so the server doesn't release a download until the block containing the purchase is final. This usually takes minutes, but no time is promised: it depends on the network and on the endpoints the server reads from (§ 9.7), and if they don't report the block as final, the download stays held.
- **Access can be withdrawn.** If the network replaces the block, and the server then finds either that the transaction failed in the block that replaced it, or that the transaction hasn't reappeared in any surviving block after a short wait (currently about two minutes), the server withdraws the access it gave for that transaction. If the transaction is instead found in another surviving block, access continues and waits for that block to become final. If a transaction the server treated as gone later appears on the blockchain, the server gives the access again.
- **What withdrawal means for the money.** The server withdraws access only where it finds that the payment is not on the blockchain as it now stands. In that case the amount of the purchase, rental or contribution was not transferred from the payer's wallet. A network fee may still have been spent.
- **The record.** The artist's server keeps a ledger entry for each such transaction, marked provisional, final or reversed. A reversed entry is kept, not deleted. The server shows the holder of a wallet the status of that wallet's recent entries through the listener app.
- **Limits.** All of this depends on what the artist's server is told by the endpoints it reads from (§ 9.7). If they are wrong, late or unavailable, the server's decisions can be too.

## 8. Our intellectual property and the software license

- **What we own.** The Station software, the QNCH Network and Station names and logos, and our other original materials are owned by Colour Labs or its licensors.
- **The software license.** The [Station Software License](/legal/software-license) is part of these Terms and sets out how you may install and run the Station software. Open-source components included in the software are governed by their own licenses, and nothing in these Terms limits the rights those licenses give you.
- **Names and logos.** These Terms give you no right to use our names or logos, except as the Station Software License allows.
- **The contracts' source code.** The FanSociety contracts' source code is published, with each contract, on the blockchain explorer for the network it is deployed on, under the license stated in that source code.
- **Feedback.** If you send us ideas, suggestions or bug reports, we may use them for any purpose without paying you or owing you anything.
- Nothing in these Terms transfers our intellectual property to you, except the limited rights expressly granted.

## 9. Blockchain transactions

You understand and agree to the following.

### 9.1 Your contracts, your keys

A Fan Club, Station Shop or Treasury is a contract created from your own wallet, and that wallet is its owner. The address that receives your share of payments is chosen by you when the contract is created, and the current contract code has no way to change it afterwards. Colour Labs does not hold, control or have access to anyone's wallet, private keys or recovery phrase, and can't recover funds or tokens if they are lost or sent to the wrong address.

### 9.2 Colour Labs' share

- Each Fan Club and Station Shop contract divides every payment it receives between the artist's payee address and an address we designate. The proportions are **written into the contract when it is created**, and the contract has no function that lets us change them for that contract afterwards.
- We set the proportions for contracts created **in the future**, and may change them for future contracts at any time. A change never applies to a contract that already exists.
- **On the Effective Date**, the factory on every network where Station's contracts are deployed writes in **1% to Colour Labs and 99% to the artist's payee address**, for both Fan Club and Station Shop contracts. Anyone can read the proportions that apply to new contracts from the factory, and the proportions in any existing contract from that contract, on a block explorer.
- Our share builds up in the artist's contract until it is released. Anyone can trigger the release, and it can go only to our designated address.
- The factory can also charge a fee to create a contract. Any such fee is shown in the transaction you sign. On the Effective Date the factory charges no such fee; you still pay the network's transaction fee.

### 9.3 Upgrade authority

Your contracts are upgradeable. Each Fan Club, Station Shop and Treasury takes its code from a shared implementation, named by a beacon contract. Whoever holds the beacon's upgrade authority can replace that code **for every contract of that kind at once**, including the code that governs the funds and FanPins held in those contracts.

On the Effective Date, a single key held by Colour Labs holds the upgrade authority for every beacon, and also owns the factory, the accepted-token list and our treasury contract. We may later move that authority to an account that needs several signatures, add a time delay before upgrades take effect, or give the authority up. We have not committed to doing any of these by a particular date. The current holder of each authority is recorded on the blockchain, and anyone can check it.

While the upgrade authority exists, it is real power over the contracts, and §§ 9.1, 9.2 and 9.4 describe the current contract code only.

### 9.4 No pause by Colour Labs

The current contract code gives Colour Labs no role that can pause, freeze or cancel an artist's contract or a transaction. An artist can pause their own Fan Club or Station Shop.

### 9.5 Accepted payment tokens

Colour Labs maintains the default list of payment tokens, such as stablecoins, that contracts accept in addition to the network's native token. If we remove a token from that list, contracts that use it stop accepting payment in that token. An artist can point their own contract at a different list. On the Effective Date the default list is empty on every network where Station's contracts are deployed, so contracts accept the native token only.

### 9.6 Transactions are final

Once the network has made a transaction's block final, the transaction can't be undone by anyone, including Colour Labs. There are no chargebacks, and Colour Labs gives no refunds. Before that point the network itself can replace the block, and a transaction in a replaced block may be included again, may fail or may not appear at all; § 7.4 describes what an artist's server does then.

### 9.7 Data from third parties

An artist's server learns about payments by reading the blockchain through third-party endpoints, or through an indexer on the artist's own server that itself reads from third-party endpoints, and builds its own local records. It also learns from them whether a block has become final or been replaced. Those records can be late, incomplete or wrong if the endpoints are. Access to gated, bought or rented Content, the release of downloads, the withdrawal of access under § 7.4, and the income figures in the dashboard all depend on them.

### 9.8 Test networks

On a test network, tokens have no value, and contracts, balances and records may be reset or discarded without notice.

### 9.9 Risks you take on

Using blockchains and smart contracts carries risks that we can't control, including: bugs or weaknesses in the contracts or the blockchain; network outages, congestion and fees; changes in the value of tokens; loss or theft of keys; phishing and fake sites or apps; mistakes in addresses or amounts; and changes in law or regulation. You use blockchain features at your own risk.

### 9.10 No advice

Nothing in the Services is investment, financial, tax or legal advice.

## 10. Third-party services

The Services rely on services run by other companies, including: wallets; Reown's AppKit and WalletConnect, which the listener app uses to connect wallets; Vercel, which hosts our websites and the listener app; blockchain endpoint providers; the blockchains themselves; GitHub, which hosts our container images; Docker; the reverse proxy and updater the installer sets up; DuckDNS, if you choose it; and Let's Encrypt, from which the installer obtains your HTTPS certificate using the email you enter. Those services are outside our control, their own terms apply to your use of them, and we are not responsible for them. If you use the installer's HTTPS setup, you agree to the [Let's Encrypt Subscriber Agreement](https://letsencrypt.org/repository/).

## 11. Disclaimer of warranties

THE SERVICES ARE PROVIDED **"AS IS" AND "AS AVAILABLE"**, WITHOUT WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING ANY WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE OR NON-INFRINGEMENT. WE DO NOT PROMISE THAT THE SERVICES, INCLUDING THE STATION SOFTWARE, THE LISTENER APP, OUR BOOT NODES, NAME LOOKUPS, THE CONTRACTS, OR ANY RECORD OF BLOCKCHAIN ACTIVITY, WILL BE UNINTERRUPTED, SECURE, ACCURATE OR FREE OF ERRORS, OR THAT ANY CONTENT IS LAWFUL OR ACCURATE. YOU USE THE SERVICES AT YOUR OWN RISK. **COLOUR LABS DOES NOT ENDORSE AND IS NOT RESPONSIBLE FOR ANY ARTIST'S OR OPERATOR'S CONTENT.**

## 12. Limitation of liability

TO THE FULLEST EXTENT THE LAW ALLOWS:

- **COLOUR LABS WILL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, EXEMPLARY OR PUNITIVE DAMAGES**, OR FOR ANY LOSS OF PROFITS, REVENUE, DATA, GOODWILL, FUNDS, TOKENS OR OTHER DIGITAL ASSETS, ARISING FROM OR RELATED TO THE SERVICES OR THESE TERMS, EVEN IF WE HAVE BEEN TOLD SUCH DAMAGES ARE POSSIBLE.
- **COLOUR LABS' TOTAL LIABILITY** FOR ALL CLAIMS ARISING FROM OR RELATED TO THE SERVICES OR THESE TERMS **WILL NOT EXCEED THE GREATER OF** (A) THE AMOUNTS YOU PAID TO COLOUR LABS IN THE 12 MONTHS BEFORE THE EVENT GIVING RISE TO THE CLAIM, INCLUDING COLOUR LABS' SHARE (§ 9.2) OF ANY PAYMENT YOU MADE THROUGH A FAN CLUB OR STATION SHOP CONTRACT, AND (B) **US$100**.

These limits apply whatever the legal theory of the claim, and even if a remedy fails of its essential purpose. Some places don't allow some of these limits; where that is so, they apply to the extent that place allows.

## 13. Indemnity

Whether you are an artist, an operator or a listener, you agree to **defend, indemnify and hold harmless** Colour Labs and its members, managers, employees and agents from and against any claim, demand, loss, damage, liability, cost or expense (including reasonable attorneys' fees) arising from or related to:

1. your Content;
2. your Station server, and anything offered, sold or made available from it;
3. your wallet and keys, and the transactions you make or receive;
4. your use of the Services;
5. your breach of these Terms or of any law, including tax, consumer and privacy law; or
6. your infringement of anyone else's rights.

We may take control of the defense of any such claim at your cost, and you will cooperate with us. You will not settle a claim that affects us without our written consent.

## 14. Copyright

Our [Copyright Policy](/legal/copyright) explains how to raise a copyright concern. Because Colour Labs doesn't host Content and the Services have no feature for removing it from an artist's server, that policy directs rights holders to the artist running the server and to that server's hosting provider.

## 15. Ending use, and ending our services

- **You can stop at any time.** An operator stops by shutting down their Station server. A listener stops by no longer using the listener app.
- **We can stop what we run.** We may stop providing, or decline to provide to anyone, any of the services we operate: the software and its updates, the listener app, our boot nodes and lookups through them, and our websites. We may do this at any time and for any reason, including a breach of these Terms. The [Station Software License](/legal/software-license) says what this means for copies of the software you already have.
- **What we can't do.** We can't remove your Content from your server or stop your server from running.
- **What stays.** Contracts already created, and transactions already made, remain on the blockchain.
- **What survives.** §§ 5.4 (for copies already made), 7.3, 8, 9, 11, 12, 13, 15, 16 and 18 continue to apply after you stop using the Services or these Terms end.

## 16. Disputes and governing law

### 16.1 Governing law

These Terms are governed by the laws of the State of California, without regard to its conflict-of-laws rules. The Federal Arbitration Act governs § 16.3.

### 16.2 Talk to us first

Before starting an arbitration or a court case, send us a written notice at colourlabs@proton.me describing the dispute and what you want. We'll do the same for you, using any contact details you have given us. If we can't resolve it within 60 days of the notice, either of us may start an arbitration.

### 16.3 Arbitration

Except as § 16.4 allows, any dispute, claim or controversy between you and Colour Labs arising from or related to these Terms or the Services will be resolved by **final and binding arbitration** between you and Colour Labs individually. The arbitration will be administered by the American Arbitration Association (AAA) under its rules in effect when the arbitration starts, including its Consumer Arbitration Rules where they apply. It will be held in Sacramento County, California, or by video, unless the AAA's rules require otherwise. Fees are paid as those rules provide. The arbitrator may award the same individual relief a court could, but only in favor of the individual party seeking it and only to the extent needed for that party's individual claim.

### 16.4 Exceptions

Either of us may bring an individual claim in small claims court if it qualifies. Either of us may ask a court for an injunction to stop actual or threatened infringement or misuse of intellectual property.

### 16.5 No class actions

**You and Colour Labs each agree to bring claims only in an individual capacity, and not as a plaintiff or class member in any class, collective, consolidated or representative proceeding.** The arbitrator may not combine more than one person's claims. If this § 16.5 is found unenforceable for a particular claim, that claim will be decided in court, not in arbitration. Where a claim for public injunctive relief can't be waived by law, that claim will be decided in court after any individual claims have been arbitrated.

### 16.6 Opting out of arbitration

You may opt out of §§ 16.3 and 16.5 by emailing colourlabs@proton.me within 30 days after you first accept these Terms. Include your name, and your Station server's domain or your wallet address, and say that you are opting out of arbitration. Opting out doesn't affect any other part of these Terms.

### 16.7 Courts

Any dispute that is not arbitrated will be decided only in the state courts located in Sacramento County, California, or in the U.S. District Court for the Eastern District of California, and you and Colour Labs agree to the jurisdiction of those courts.

### 16.8 Time limit

To the extent the law allows, any claim arising from or related to these Terms or the Services must be started within one year after it arises, or it is permanently barred.

## 17. Changes to these Terms

- **Versions.** Each version of these Terms has a version label (its date) and an effective date, shown at the top. The current version is published at docs.qnch.network/legal/terms. Earlier versions are available on request from colourlabs@proton.me.
- **Small changes.** Changes that don't affect anyone's rights or obligations, such as clearer wording or new contact details, take effect when published.
- **Material changes.** For any other change, we will publish the new version at least 30 days before it takes effect. Where we can, we will also show it in the dashboard in a new release of the Station software and ask you to accept it. A material change applies to you from the earlier of (a) when you accept it, and (b) its effective date, if you continue to use any of the Services after that date, including by keeping the Station software running.
- **If you don't agree** to a new version, stop using the Services before it takes effect. For an operator, that means shutting down your Station server.
- **Disputes already known.** A change to § 16 does not apply to a dispute that either of us had already notified to the other before the change was published.
- **Your contracts.** A change to these Terms does not change the proportions written into a contract that already exists (§ 9.2).

## 18. General

- **Entire agreement.** These Terms, including the documents listed in § 1.3, are the whole agreement between you and Colour Labs about the Services.
- **Severability.** If any part of these Terms can't be enforced, the rest still applies, and the part that can't be enforced is applied to the fullest extent the law allows.
- **No waiver.** If we don't enforce a part of these Terms, we haven't given up the right to enforce it later.
- **Assignment.** You may not transfer these Terms to anyone else without our written consent. We may transfer them to an affiliate or to a successor to our business.
- **Relationship.** Nothing in these Terms makes you and Colour Labs partners, employer and employee, or agents of each other.
- **Things outside our control.** We are not responsible for any delay or failure caused by events outside our reasonable control, including outages of third-party services or blockchains.
- **Export.** The Station software includes encryption. You will comply with U.S. and other export-control and sanctions laws that apply to your use of it.
- **Outside the United States.** We operate from the United States and make no claim that the Services are appropriate or lawful elsewhere. If you use them from elsewhere, you are responsible for following the laws where you are.
- **Notices to you.** We give notices by publishing them at docs.qnch.network/legal, by showing them in the dashboard or listener app, or by email if you have given us an address.
- **Notices to us.** Send notices to colourlabs@proton.me, or by mail to the address in § 19.
- **California users.** Under California Civil Code § 1789.3, California users are entitled to the following consumer rights notice: the Complaint Assistance Unit of the Division of Consumer Services of the California Department of Consumer Affairs may be contacted in writing at 1625 North Market Blvd., Suite N 112, Sacramento, CA 95834, or by telephone at (800) 952-5210.
- **Language and headings.** These Terms are written in English. Headings are for convenience only.

## 19. Contact

- **Colour Labs LLC**, 2108 N St, Ste N, Sacramento, CA 95816, USA
- **Email:** colourlabs@proton.me
