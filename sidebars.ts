import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {
  docsSidebar: [
    {
      type: 'category',
      label: 'Getting Started',
      items: [
        'getting-started/introduction',
        'getting-started/quick-start',
        'getting-started/system-requirements',
        'running-server/installation',
        'running-server/configuration',
        'running-server/first-run',
      ],
    },
    {
      type: 'category',
      label: 'Deployment',
      items: [
        'deployment/vps-setup',
        'deployment/docker',
        'deployment/systemd',
      ],
    },
    {
      type: 'category',
      label: 'Reference',
      collapsed: true,
      items: [
        'reference/cli-commands',
        'reference/configuration',
        'reference/api',
      ],
    },
  ],
};

export default sidebars;
