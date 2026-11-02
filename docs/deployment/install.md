---
sidebar_position: 1
---

# Install Station

This is the complete walkthrough: run one command, answer a few questions, and log into your dashboard. It takes about 10 minutes.

Before you start, make sure you've prepared a server and domain — see [What You Need](../getting-started/what-you-need.md). In short, you'll want:

- An Ubuntu 20.04 / 22.04 or Debian 11 / 12 server with root or `sudo` access
- Your domain's **A record** already pointing at the server's IP (or a DuckDNS account ready to go)
- Ports **80, 443, 4001, and 4002** reachable from the internet

Here's the whole thing, start to finish — one command, a few questions, and a setup PIN:

<video autoPlay loop muted playsInline style={{width: '100%', borderRadius: '8px'}}>
  <source src="/img/install/full.webm" type="video/webm" />
  Your browser doesn't support embedded video.
</video>

The rest of this page walks through each step.

## 1. Open a terminal on your server

Connect to your server. Most cloud providers offer a web-based console you can open right from their dashboard — no setup required. Or connect over [SSH](https://www.cloudflare.com/learning/access-management/what-is-ssh/) if you prefer:

```bash
ssh root@your-server-ip
```

## 2. Run the installer

```bash
curl -sSL https://qnch.network/install.sh -o install.sh && sudo bash install.sh --network testnet
```

:::tip Testnet is live
The `--network testnet` flag joins the testnet — a separate network for trying Station out. Mainnet isn't live yet; we'll update these docs the moment it launches.
:::

The installer opens with Station's title, checks your server while it plays, and then asks its questions one at a time. A list on the left shows where you are, and what it found on your server (Docker, ports 80 and 443, your server's IP, Station's bootnode). Press **Enter** to answer and **Shift+Tab** to go back and change an earlier answer.

![Running the install command: the Station title plays while the installer checks the server, then the first question appears](/img/install/splash.gif)

Here's every question, in order. Some only appear when they apply to your server.

### Reconfigure an existing install?

Only when Station is already installed here. Choose **Reconfigure** to change your answers; your music and settings stay. **Leave it** exits without changing anything.

### Install Docker?

Only when Docker isn't on the server yet. Station runs as a set of Docker containers, so this is required; the installer can add Docker for you (**default: yes**). Automatic installation works on Ubuntu and Debian.

### Ports in use

Only when something is already using ports 80 or 443. Station needs both for HTTPS. If it's an earlier Station install, it's safe to continue.

### How will listeners reach your server?

- **Your own domain** — enter it (e.g. `music.yourdomain.com`). The installer checks that its A record points to this server. If it doesn't resolve yet, it tells you the exact record to add; add it and press Enter to check again. If it points somewhere else, you can go back and fix it, or continue anyway (not recommended).
- **DuckDNS** — free, if you don't have a domain. Confirm you've created your DuckDNS account and subdomain, then enter the subdomain and your token (the token is hidden as you type).

![Choosing DuckDNS, then entering a subdomain and a token, which stays hidden](/img/install/duckdns.gif)

### Email for HTTPS notices

Optional. Let's Encrypt writes here only if your certificate's automatic renewal fails.

### Joining the network

Your node joins the network through a **bootnode**, a node it can reach first. The installer checks that Station's bootnode is reachable. Usually it is, and nothing is asked.

If the bootnode can't be reached, you can still join. Any other Station node will do. Ask an artist who runs one to open their dashboard, go to **Settings**, and copy their **Node address** (see [Settings](../features/settings.md#node-information)). It looks like this:

```text
/dns4/artist.example.com/tcp/443/wss/p2p/12D3KooW...
```

Paste it at the **Node address** question. The installer checks it as you go, and if it doesn't look right (a missing character, a stray space) it shows the example again so you can try once more. Your node then joins through that address.

![Station's bootnode can't be reached: a mistyped node address is refused, then the corrected one is accepted](/img/install/entry-node.gif)

You can also leave it empty to continue without one. Your node still starts, but it isn't on the network yet. It joins on its own when the bootnode is back, or you can add a node address later by running the installer again.

**Running the installer again?** If you saved a node address before, the installer shows it and asks **Keep this entry node?** (default: yes). Answer no to paste a different one, or leave it empty to use Station's built-in bootnode instead.

### Review

Last, the installer shows your answers. Choose **Yes** to install, or **Go back** (or Shift+Tab) to change one.

## 3. Let it finish

After the review, the installer does the rest on its own — no more input needed. A checklist on the left follows each stage, and the work itself scrolls by on the right:

- Checks the server and your domain
- Writes your configuration and starts the containers (your Station node, a Traefik reverse proxy for HTTPS, Watchtower for updates, and [ETH-RPC](../features/settings.md#eth-rpc), which stays idle until you pick a chain that uses it)
- Gets a free HTTPS certificate from Let's Encrypt (this can take 30–90 seconds)
- Waits for your node to come online

When it's done, you'll see **Your Station is live** with your dashboard's address and a **setup PIN** in the form `123-456`. Keep it handy for the next step. Everything the installer printed is also saved to `station-install.log` in the directory you ran it from.

![The installer's review, then the install checklist and log, ending with your dashboard address and setup PIN](/img/install/finish.gif)

:::note Prefer the classic installer?
Add `--classic` to the install command for the original step-by-step prompts. The installer also switches to it by itself if the new one can't run on your server.
:::

## 4. Create your dashboard login

Open your domain with `/setup` on the end:

```text
https://music.yourdomain.com/setup
```

Enter the **PIN** from the installer to create your login. This is your artist **dashboard** — where you upload music, build your storefront, and manage everything.

Ran the installer again on a server that already has a login? There's no PIN then: the installer shows your dashboard's `/login` address instead, and you sign in with your email and password.

:::note PIN expired?
The setup PIN is short-lived. If it stops working before you log in, generate a fresh one on the server, then re-enter it at `/setup`:

```bash
docker compose -f docker-compose.yml restart station
docker compose -f docker-compose.yml logs station | grep -oE '[0-9]{3}-[0-9]{3}' | tail -1
```

Run these from the directory where you ran the installer.
:::

## You're live

Your Station server is running and your music is ready to share. Next:

- **Explore your dashboard** → [Features](../features/dashboard.md)
- **Upload your first release** → [New Release](../features/new-release.md)
- **Manage and update your server** → [Managing Your Server](./managing-your-server.md)

Share your **namespace** so fans can find you on the [listener app](https://beta.qnch.network).

## Troubleshooting

**Certificate didn't provision, or the site won't load over HTTPS**

- Confirm your domain's A record points to the server and DNS has propagated.
- Make sure ports **80 and 443** are open to the internet — port 80 is required for certificate validation.
- Check the reverse proxy logs: `docker compose -f docker-compose.yml logs traefik`

**Can't reach `/setup`**

- Give the installer a minute to finish and the certificate to issue.
- Confirm the containers are running: `docker compose -f docker-compose.yml ps`

**The installer says Station's bootnode cannot be reached**

- You can still finish the install. Paste a **Node address** from another artist's dashboard (Settings) when the installer asks, or leave it empty and add one later by running the installer again. See [Joining the network](#joining-the-network).
- If the address you paste is refused, copy it again in full: it starts with `/dns4/` and ends with a long ID beginning `12D3KooW`.

**The installer says a port is already in use**

- Something else is using port 80 or 443. Stop it and re-run the installer. If it's an earlier Station install, answer **Stop them** and the installer carries on.

**Still stuck?** Open an issue on [GitHub](https://github.com/station/station/issues).
