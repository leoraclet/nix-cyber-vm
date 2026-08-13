# Nix VM for Cybersecurity

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

A simple and ready-to-use flake template to create a cybersecurity-oriented virtual
machine.

This was inspired by [this post](https://jeancharles.quillet.org/posts/2023-01-16-Basic-nix-vm-for-just-anything.html)
and my needs for quick cyber VM during CTF.

## Usage

First, clone the repository:

```bash
git clone https://github.com/leoraclet/nix-cyber-vm
```

Or use the flake template with:

```bash
nix flake init -t github:leoraclet/nix-cyber-vm
```

To start the VM, use:

```bash
nix run .#microvm
# OR
just run
```

- USERNAME: `test`
- PASSWORD: Same as USERNAME

You can clean the VM using:

```bash
just clean
```

## Customization

You can fully customize this VM's configuration by adding modules and updating the
[`configuration.nix`](./modules/hosts/configuration.nix) file.

You can also set user and other global options in the [`options.nix`](./modules/nixos/options.nix)
file.

## Libraries

Powered by:

- [nixpkgs](https://github.com/NixOS/nixpkgs/)
- [flake-parts](https://github.com/hercules-ci/flake-parts)
- [microvm.nix](https://github.com/microvm-nix/microvm.nix)
- [home-manager](https://github.com/nix-community/home-manager)

## Resources

For lightweight hacking environments without a VM, check out my
[Nix Cyber Templates repository](https://github.com/leoraclet/nix-cyber-templates).
