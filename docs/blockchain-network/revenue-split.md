---
sidebar_position: 4
---

# Revenue Split

Station takes a share of what you earn. In the beginning, that share is **0% | 100%** — nothing to Station, everything to you.

This page covers why taking as little as possible is the goal, the mechanism that makes it real, and what we can and can't tell you about where it goes from here.

## Minimally extractive

The goal is to be **minimally extractive**: to take the smallest share that lets Station keep existing and improving, and no more.

It's unclear how much revenue Station will need to keep growing without outside investment. What we can commit to is the direction, and the fact that whatever we work out, it won't be applied retroactively to you. The rest of this page is how that's enforced.

## The payment splitter

Every [Fan Club](../features/fan-club.md) and [Storefront](../features/storefront.md) contract you deploy has a **payment splitter** built into it. When a fan mints a FanPin or buys a track, their payment lands in your contract and is divided on the spot: your share, and Station's share, according to the split written into that specific contract. Your share accumulates there until you withdraw it.

There's no invoice, no billing cycle, and no moment where Station holds your money and passes some of it back. The division happens at payment time, inside a contract you own, on a public ledger anyone can read. This is how Station earns a portion of the value the network creates. Staion implements the [OpenZeppelin PaymentSplitter](https://docs.openzeppelin.com/contracts/4.x/api/finance#PaymentSplitter)

## Your rate is locked when you deploy

The split is written into your contract at deploy time.

Station can change the rate it offers **new** contracts. It cannot reach into a contract you've already deployed and take a larger share. Whatever split your Fan Club or Storefront launched with is the split it keeps.

That's a small sentence with a lot behind it, and it's easiest to see next to how the rest of the industry works.

A **DSP** — a digital streaming platform — sets the terms in an agreement, and reserves the right to change that agreement. The rate an artist starts at is a rate the platform can revisit whenever its business needs it to. There's no recourse, because there's nothing to enforce: the terms live on the platform's side of the relationship, and so does the ability to rewrite them.

**Station isn't a DSP.** There's no agreement between us to revise, because your split was never an agreement in the first place. It's a deployed artifact — a number sitting in a contract you control. Station's future intentions, funding pressures, and changes of heart are all irrelevant to it. **The protection isn't that we promise not to raise your rate. It's that we can't.**

:::note This is why the guarantee is worth something
"We'll always treat artists fairly" is a cheap thing to say, and it's never been worth much, because the party saying it is the same party that gets to decide later what it meant.

We'd rather not ask you to trust us. The point of putting the split in your contract is that you don't have to.

It's also why the whole ecosystem runs on blockchain payment rails rather than a conventional processor. Legacy payment providers can move money, but they can't hold a rule. There's nowhere in a bank or a card processor to write *this share can never be raised* and have it bind anyone — you'd be back to a promise and a company's word for it. Programmable rails aren't an aesthetic choice here. They're the only reason the guarantee can exist at all.
:::

## In the beginning: 0% | 100%

The first artists on Station keep **100% of their revenue**. Station's share is nothing.

This isn't a promotional rate or a free trial that converts later. There's no introductory period and no expiry date. A contract deployed at 0% | 100% stays at 0% | 100% for as long as it exists. If you deploy in this round and Station's split is 5% | 95% in three years, yours is still 0% | 100%.

## What changes will look like

There is **no schedule** for rate changes. We're not going to pretend we have one.

What we can tell you is the shape of it. The first increase will be **1% | 99%** — 99% of revenue to artists. Increases after that will follow the same pattern: small, incremental, and applied only to contracts deployed after the change.

Every increase does the same thing — it raises the rate for new deployments and leaves every existing contract untouched.

## Early adopters keep the better rate

This falls out of the design rather than being bolted on, and it's the fairest version of early access we could come up with.

Deploying on Station today means betting on young software, a small network, and a project still working out its own economics. That's a real risk, and it's not one later artists will take — by the time they arrive, the thing will be proven, the network will be bigger, and the ground will be more solid. They'll pay a slightly higher rate for that certainty.

The rule is the same for everyone: whatever the split is on the day you deploy is the split you keep, permanently. Artists joining at 1% | 99% hold 1% | 99% even after the rate has moved past them, exactly as you hold 0% | 100%. Nobody's rate follows the network up.

So you're taking the risk, and you keep the better rate. Not as a reward we hand out, but as a consequence of when your contract was deployed and what was written into it that day.

## A note on upgradeability

*For readers who go looking at the contracts. If "beacon proxy" means nothing to you, skip it — nothing here affects your split.*

Your contracts are deployed as **beacon proxies**: your proxy holds your state, and its logic comes from an implementation contract named by a beacon.

During launch, Station owns that beacon, so implementation bugs found early can be patched for contracts that are already deployed rather than leaving artists stranded on broken code. It's a short transitional window, not a permanent feature of the protocol.

Once the contracts have proven themselves, beacon ownership will be transferred to the zero address. At that point no one owns it and no one can upgrade any of these contracts again — not Station, not anyone who might come after Station.

Renouncing the beacon is a public transaction, so you don't have to take our word for when it lands. You can check the beacon's owner yourself on [Blockscout](https://blockscout-testnet.polkadot.io).

## Still have questions?

Plenty of this is unsettled, and these docs won't cover everything.

**[Join the Station Telegram group](https://t.me/+EwzB7vuSRZozYTEx)** to ask about anything here, argue with the economics, or just say hi. The people building Station are in there.
