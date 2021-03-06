# Injective Chain Upgrade Instructions

The following document describes the necessary steps involved that validators and full node operators
must take to upgrade the Injective Chain from 10004-rc1 to 10004-rc1 [patch version 10004-rc1-1645352045](https://github.com/InjectiveLabs/injective-chain-releases/releases/tag/v1.4.0-1645352045) created due to an incident that happened on Sunday, Feb 20 at 3:55 AM UTC-05:00, when [Network halted at block 7941974](https://explorer.injective.network/block/7941974).

- [Summary](#summary)
- [Risks](#risks)
- [Recovery](#recovery)
- [Upgrade Procedure](#upgrade-procedure)
- [Notes for Service Providers](#notes-for-DEX-relayer-providers)

# Summary

- At 3:26 AM UTC-05:00 Network halted, [block height 7941974](https://explorer.injective.network/block/7941974)
- At 5:05 AM UTC-05:00 [New release created with rolled back fix, Version 10004-rc1-1645352045](https://github.com/InjectiveLabs/injective-chain-releases/releases/tag/v1.4.0-1645352045)
- At 06:08 UTC-05:00 [Network is back up]( https://explorer.injective.network/block/7941975)


The following is a short summary of the upgrade steps:

1. Backing up configs, data, and keys used for running the Injective Chain.
3. Install the [Injective Chain 10004-rc1 release patch](https://github.com/InjectiveLabs/injective-chain-releases/releases/tag/v1.4.0-1645352045)
4. Start your node with the new injectived binary to fulfill the upgrade.

Upgrade coordination and support for validators will be available on the #mainnet-validators private channel of the [Injective Discord](https://discord.gg/injective).

## Upgrade Procedure

1. Verify you are currently running the correct (pre-upgrade) version (`94583db`) of `injectived`:
   ```bash
   $ injectived version
   Version dev (94583db)
   Compiled at 20220123-0855 using Go go1.17.6 (amd64)
   ```

2. After the chain has halted, make a backup of your `.injectived` directory
    ```bash
    cp ~/.injectived ./injectived-backup
    ```
   **NOTE**: It is recommended for validators and operators to take a full data snapshot at the export
   height before proceeding in case the upgrade does not go as planned or if not enough voting power
   comes online in a sufficient and agreed upon amount of time. In such a case, the chain will fallback
   to continue operating the existing Canonical Chain. See [Recovery](#recovery) for details on how to proceed.

3. Download and install the Injective Chain 10004-rc1 release patch
  ```bash
  wget https://github.com/InjectiveLabs/injective-chain-releases/releases/download/v1.4.0-1645352045/linux-amd64.zip
  unzip linux-amd64.zip
  sudo mv injectived /usr/bin
  ```

4. Verify you are currently running the correct new version (`94583db`) of `injectived` after downloading the 10004-rc1 release patch:
    ```bash
   $ injectived version
   Version dev (30b3dbf)
   Compiled at 20220220-1014 using Go go1.17.6 (amd64)
   ```

5. Coordinate to restart your injectived with other validators
   ```bash
   injectived start
   ```
   The binary will perform the upgrade automatically and continue the next consensus round if everything goes well.

## Notes for DEX relayer providers
Relayer upgrade will be available after the chain is successfully upgraded as it relies on several other components that work with injectived.
