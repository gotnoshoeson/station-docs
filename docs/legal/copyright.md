---
sidebar_position: 4
---

# Copyright Policy

**Version:** `2026-11-27` · **Effective:** 27 November 2026

This Copyright Policy is part of the [Terms of Service](/legal/terms) between you and Colour Labs LLC ("Colour Labs", "we", "us"). It explains how to raise a concern about music or other material on the QNCH Network that you believe infringes your copyright. Words defined in the Terms mean the same here.

## 1. What Colour Labs does and doesn't do

We respect copyright and ask everyone who uses Station to do the same. How a complaint can be dealt with depends on how the network works:

- **We don't host the music.** Each artist runs their own Station server and serves their own music, artwork and catalog from it. We hold no copy.
- **Our boot nodes only help servers find each other.** They pass network traffic along, keep the small name records that servers publish (an artist's name, their server's network identity and a validity date), and tell other servers and browsers where a server can be reached. They carry no music.
- **The listener app fetches from artists' servers.** The listener app at beta.qnch.network, which we host on Vercel, runs in the listener's browser. The browser fetches catalogs, artwork and audio directly from each artist's server. None of it passes through our servers.
- **There is no takedown feature.** Neither the Station software, nor the listener app, nor our boot nodes has any feature for removing, blocking or de-listing an artist or their music, and we don't operate one.

For these reasons, Colour Labs has **not registered a designated agent** with the U.S. Copyright Office under the Digital Millennium Copyright Act. A notice sent to us will not result in material being removed by us, because we don't hold it and have no means to remove it.

## 2. How to raise a concern where it can be acted on

The people who can act on a complaint are **the artist running the server** and **that server's hosting provider**. The information you need to reach them is public:

1. **Find the server.** Open the artist in the listener app. The catalog, artwork and audio are fetched from the artist's own web address, which your browser's developer tools show (for example, in the Network tab). If you can't find it, email us the artist's name as it appears in the listener app, and we will tell you the server address the network gives for that name, if we can find one.
2. **Find the hosting provider.** Look up the IP address of that web address with any DNS lookup tool, then look up who the IP address belongs to with a WHOIS or RDAP lookup. That shows the hosting provider and, usually, its abuse contact. A WHOIS lookup on the domain itself shows its registrar.
3. **Send your notice to the people who can act.** Contact the artist directly, for example through the website or contact details on their profile, and send your notice to the hosting provider's abuse or copyright contact. Most hosting providers act on valid notices.

Colour Labs is not a party to that process and can't say how an artist or a hosting provider will respond.

## 3. Writing to us

You can send copyright concerns to us at:

- **Colour Labs LLC**, 2108 N St, Ste N, Sacramento, CA 95816, USA
- **Email:** colourlabs@proton.me

We will reply and, where we can, help you find the server and hosting provider involved (§ 2). We have no account or contact details for artists, so we generally can't forward your notice to an artist.

## 4. Impersonation and names

Each name record on the network is signed with the key of the Station server that registered it, and the listener app checks that signature. Names are claimed first come, first served. When different servers give different owners for the same name, the listener app shows the listener the choices and lets them pick. We don't decide who is the "real" artist behind a name, and there is no process by which we assign, reassign or remove one. If someone is using a name to impersonate you, the steps in § 2 lead to the server and hosting provider involved.

## 5. Good faith

Please use these channels in good faith. Knowingly making a false claim that material infringes, or that material was wrongly complained about, can carry legal liability.

## 6. Artists and operators

If you run a Station server, you are solely responsible for what you publish from it, and for responding to complaints about it, directly and through your hosting provider. The [Terms of Service](/legal/terms) (§ 5.1) require you to have all the rights needed for everything you publish.

## 7. Changes

We may update this policy. Each version has a version label (its date) and an effective date, shown at the top, and changes follow § 17 of the Terms. The current version is published at docs.qnch.network/legal/copyright.
