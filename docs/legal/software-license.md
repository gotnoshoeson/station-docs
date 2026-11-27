---
sidebar_position: 5
---

# Station Software License

**Version:** `2026-11-27` · **Effective:** 27 November 2026

This license is part of the [Terms of Service](/legal/terms) between you and Colour Labs LLC ("Colour Labs", "we", "us"). It sets out how you may install and run the Station software. Words defined in the Terms mean the same here.

## In short

You can install Station on servers you control, run it, change its settings and keep it updated, to run an artist's server on the QNCH Network, and to sell and share music from it. We don't charge for the license.

Station isn't open source, so you can't resell it, hand out copies, remove its notices, or take it apart to rebuild it. Those limits stop where the open-source parts inside it begin: their licenses travel with them, and nothing here takes away what those licenses allow.

You can stop whenever you like. If the license ends, your music, your data, your wallet and your contracts are still yours, on your server and on the blockchain.

This summary is here to help. The sections below are the license.

## 1. What the "Station Software" is

In this license, "Station Software" means the software we publish for operators to install and run on their own servers:

- the `station` server program, including the artist dashboard built into it;
- the install script published at qnch.network and the installer program (`station-installer`) that it downloads;
- the container images we publish for the server program and for the blockchain indexer (`eth-rpc`) that runs beside it;
- any standalone builds of these that we publish; and
- the updates to any of them that we publish (§ 6).

It does not include:

- third-party components, which § 4 covers;
- software made by others that the installer places on your server, such as the reverse proxy that provides HTTPS and the updater;
- the listener app, which we host as a website and which listeners use under the Terms; or
- the FanSociety smart contracts, which are published under the license stated in their own source code.

## 2. Your license

**The grant.** Subject to the Terms, Colour Labs grants you a limited, non-exclusive, non-transferable, revocable license to install, run, configure and update the Station Software on servers you control, to operate a Station server for yourself or for an artist you are authorized to act for (§ 5.7 of the Terms), on the QNCH Network or a test network. A server you rent from a hosting provider counts as a server you control, as long as you, and not someone else, decide what runs on it. You may run as many Station servers as you need.

**No fee.** We don't charge a fee for this license. That doesn't affect Colour Labs' share of payments through the contracts (§ 9.2 of the Terms). Using the license to publish, stream and sell music, and to run a Fan Club or Station Shop, is what it is for; it is not limited to non-commercial use.

**Your configuration and the install script.** The installer writes configuration files on your server, such as the Docker Compose file and the settings in it. You may read, change and keep those files as you need to run your server. The install script is delivered as readable source code; you may read it and adapt it to install the Station Software on your own servers, but you may not distribute an adapted version.

**Our names.** You may say, accurately, that your server runs Station and is part of the QNCH Network. Any other use of our names or logos needs our written permission.

**Transfer.** You may not transfer this license. If someone else takes over your server or your artist project, they must accept the Terms themselves.

## 3. What the license doesn't allow

Each limit in this section is **subject to § 4**. None of them applies to a third-party component to the extent it would limit a right you have under that component's license, and none applies to the extent the law gives you a right that can't be excluded by agreement.

Subject to that, you will not:

1. sell, rent, lease, lend, sublicense or distribute the Station Software, or any copy of it, to anyone else;
2. offer the Station Software to others as a commercial hosting or managed service, for example by running Station servers for artists for a fee, without our written permission;
3. remove, hide or change any copyright, license or other notice in or shipped with the Station Software, including the third-party notices described in § 5;
4. modify, adapt or create derivative works of the Station Software, other than the configuration and install-script changes § 2 allows; or
5. reverse engineer, decompile or disassemble the Station Software, or otherwise try to derive its source code, except as § 4 permits or as the law permits despite this limit.

The rules on what you may publish with the Station Software are in the [Acceptable Use Policy](/legal/acceptable-use) and § 5 of the Terms, not here.

## 4. Open-source components

The Station Software includes components written by others and made available under open-source licenses. Those licenses come with the components and govern your use of them.

**Nothing in the Terms limits any right you have under the license of a component included in the Station Software, and nothing in the Terms adds to the obligations those licenses place on you.** Where the Terms and a component's license differ on what you may do with that component, the component's license applies to it. In particular:

- Some components are licensed under the **GNU Lesser General Public License, version 3** (LGPL-3.0), including the go-ethereum library built into the `station` server program. For those components, nothing in the Terms stops you from modifying them, or from reverse engineering the Station Software to debug such modifications, as that license allows.
- Some components are licensed under the **Mozilla Public License 2.0** (MPL-2.0), including the `hashicorp/golang-lru` and `libp2p/go-yamux` libraries built into the `station` server program and Mozilla's list of trusted certificate authorities in the server's container image. Those components remain under that license, and the notices say where their source code is published.
- The `station` container image is built on Alpine Linux and includes unmodified Alpine packages under their own licenses, some under the **GNU General Public License, version 2** (GPL-2.0), such as BusyBox and apk-tools. The notices link the exact source of each package.
- The `eth-rpc` container image includes the `eth-rpc` program published by Parity Technologies, licensed under the Apache License 2.0 and built together with components licensed under the **GNU General Public License, version 3 or later, with the Classpath exception**. The image is built on Parity's published image, which contains Ubuntu Linux packages under their own licenses, including the **GNU General Public License** and the **GNU Lesser General Public License**. The notices give the exact source location for each.

## 5. Where to find the notices

The full list of components, and the full text of each license, is published for each release on the [Open-Source Licenses](/licenses) page, at `https://docs.qnch.network/licenses/<version>/`, where `<version>` is the release you run, with one file for each part. The same notices ship with the Station Software:

- **Server program** (published as `station.txt`): on your server, run this from the directory where you ran the installer:
  `docker compose -f docker-compose.yml exec station station licenses`
- **Server container image** (published as `station.txt` and `node-image-alpine-packages.txt`): in the image, at `/usr/share/doc/station/THIRD_PARTY_NOTICES.txt` and `/usr/share/doc/station/ALPINE_PACKAGES.txt`.
- **`eth-rpc` container image** (published as `ethrpc-supervisor.txt`, `eth-rpc.txt` and `eth-rpc-ubuntu-packages.txt`): in the image, at `/usr/share/doc/station/THIRD_PARTY_NOTICES.txt`, `/usr/share/doc/station/THIRD_PARTY_NOTICES-eth-rpc.txt` and `/usr/share/doc/station/UBUNTU_PACKAGES.txt`.
- **Installer program** (published as `station-installer.txt`): the install script deletes its copy of the installer when it finishes, so after an install, read the published file. If you download the installer yourself, `station-installer --licenses` prints the notices.

The published notices, `station licenses`, `station-installer --licenses` and the files under `/usr/share/doc/station/` exist from release 0.1.0-rc.33, and the Alpine package list from release 0.1.0-rc.34. Earlier releases don't include them.

## 6. Updates

This license covers each update we publish, unless the update comes with different terms. Whether updates are installed automatically depends on the update setting in your dashboard (§§ 3.1 and 5.6 of the Terms); this license doesn't require you to install any update. A release you don't update stays covered by this license.

We don't promise to publish updates, and we may stop (§ 15 of the Terms). Older releases may stop working with the network or with the services we run as those change.

## 7. How long the license lasts

The license lasts until it ends in one of these ways:

1. **You end it** at any time, by stopping the Station Software and deleting it from your servers.
2. **It ends automatically** if you materially breach this license, the [Acceptable Use Policy](/legal/acceptable-use) or the Terms.
3. **We end it** by notice to you (§ 18 of the Terms) if we reasonably believe you are using the Station Software unlawfully or in breach of the Acceptable Use Policy.

**Stopping a service is not ending the license.** If we stop providing the software, its updates, the listener app or our boot nodes (§ 15 of the Terms), that does not by itself end your license to run the copies of the Station Software you already have.

**When the license ends,** you will stop running the Station Software and delete your copies of it, except that for 30 days afterwards you may keep running it solely to move or export your Content and data and to manage your contracts. The end of the license does not change anything in § 8, does not affect contracts already created or transactions already made, and does not end your rights under the license of any component described in § 4.

The Station Software contains no license key and no switch by which we can turn it off, and we have no access to your server (§ 3.3 of the Terms). Ending the license doesn't change that. If your update setting is automatic, though, a new release we publish will be installed on your server (§ 3.4 of the Terms).

## 8. What stays yours

Whether you stop using Station or the license ends:

- **Your Content** stays yours (§ 5.1 of the Terms). We hold no copy of it, and this license gives us no right to it.
- **Your server's data**, including the files, catalog, database and records your server keeps, such as the ledger described in § 7.4 of the Terms, stays on your server. We have no access to it and can't delete, copy or withhold it.
- **Your keys and contracts.** We never held your wallet or keys (§ 9.1 of the Terms). Contracts you created stay on the blockchain, owned by your wallet, with the payee and split written into them when they were created (§§ 9.1 and 9.2 of the Terms), subject to the upgrade authority described in § 9.3 of the Terms.

This license gives you no right in a name on the network, and a name your server stops renewing lapses as § 5.5 of the Terms describes.

## 9. Other terms for the same software

This license is non-exclusive. We may make the Station Software, or any part of it, available to anyone, including you, on other terms, including under an open-source license. If we make a release or part of the Station Software available to you under an open-source license, that license governs that release or part, and nothing in this license limits what it grants.

## 10. The rest of the Terms apply

The rest of the Terms applies to the Station Software, including the disclaimer of warranties (§ 11), the limitation of liability (§ 12), the indemnity (§ 13), disputes (§ 16) and changes (§ 17). §§ 4, 5, 7 (what happens when the license ends), 8 and 9 continue to apply after the license ends.

## 11. Contact

- **Colour Labs LLC**, 2108 N St, Ste N, Sacramento, CA 95816, USA
- **Email:** colourlabs@proton.me
