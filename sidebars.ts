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
        'getting-started/what-you-need',
      ],
    },
    {
      type: 'category',
      label: 'Deployment',
      items: [
        'deployment/install',
        'deployment/managing-your-server',
      ],
    },
    {
      type: 'category',
      label: 'Blockchain Network',
      items: [
        'blockchain-network/overview',
        'blockchain-network/wallet',
        'blockchain-network/test-tokens',
        'blockchain-network/revenue-split',
      ],
    },
    {
      type: 'category',
      label: 'Features',
      items: [
        'features/dashboard',
        'features/catalog',
        'features/new-release',
        'features/storefront',
        'features/fan-club',
        'features/treasury',
        'features/settings',
      ],
    },
  ],
};

export default sidebars;
