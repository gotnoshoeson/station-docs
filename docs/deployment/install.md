---
sidebar_position: 1
---

# Install Station

This is the complete walkthrough: run one command, answer a few questions, and log into your dashboard. It takes about 10 minutes.

Before you start, make sure you've prepared a server and domain — see [What You Need](../getting-started/what-you-need.md). In short, you'll want:

- An Ubuntu 20.04 / 22.04 or Debian 11 / 12 server with root or `sudo` access
- Your domain's **A record** already pointing at the server's IP (or a DuckDNS account ready to go)
- Ports **80, 443, 4001, and 4002** reachable from the internet

Here's the whole thing, start to finish — one command, a few prompts, and a setup PIN:

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

The installer runs as an interactive wizard. Here's every question it asks, in order.

![Running the install command; the wizard shows its welcome banner and the prerequisites](/img/install/run.gif)

### Install Docker?

If Docker isn't already on the server, the wizard offers to install it for you (**default: yes**). Station runs as a set of Docker containers, so this step is required. Automatic installation works on Ubuntu and Debian.

![The wizard offering to install Docker automatically](/img/install/docker.gif)

### Configure your domain

Choose how listeners will reach your server:

- **Own domain** — enter your subdomain (e.g. `music.yourdomain.com`). The wizard detects your server's public IP and checks that your domain points to it. If DNS isn't ready yet, it shows you the exact A record to create and lets you retry.
- **DuckDNS** — enter your DuckDNS subdomain and token, and the wizard configures it for you.

![Selecting "Own domain" in the installer and entering your domain, which the wizard checks against your server's IP](/img/install/domain-own.gif)

*Using DuckDNS instead? You'll confirm your account, then enter your subdomain and token:*

![Choosing DuckDNS and entering a subdomain and token in the installer](/img/install/domain-duckdns.gif)

### Email for HTTPS

Enter an email address (optional). Let's Encrypt uses it to send certificate-expiry reminders in case automatic renewal ever fails.

### Automatic updates

Choose whether to enable **Watchtower** (**default: yes**), which keeps your Station node up to date automatically. You can turn this off later from the dashboard.

![Entering an email for HTTPS notices, then choosing to enable automatic updates via Watchtower](/img/install/email-watchtower.gif)

## 3. Let it finish

After the last question, the wizard does the rest on its own — no more input needed:

- Generates your configuration and starts the containers (your Station node plus a Traefik reverse proxy for HTTPS)
- Provisions a free HTTPS certificate from Let's Encrypt (this can take 30–90 seconds)
- Waits for your node to come online

![The wizard generating configuration, starting the containers, and provisioning the HTTPS certificate](/img/install/provisioning.gif)

When it's done, you'll see **Setup completed successfully** along with a **setup PIN** in the form `123-456`. Keep it handy for the next step.

![The installer finishing and printing your setup PIN and next steps](/img/install/success-pin.gif)

## 4. Create your dashboard login

Open your domain with `/setup` on the end:

```text
https://your-domain.com/setup
```

Enter the **PIN** from the installer to create your login. This is your artist **dashboard** — where you upload music, build your storefront, and manage everything.

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

**The installer says a port is already in use**

- Something else is using port 80 or 443. Stop it (or let the wizard stop it when prompted) and re-run the installer.

**Still stuck?** Open an issue on [GitHub](https://github.com/station/station/issues).
