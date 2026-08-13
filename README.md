# Nix VM for Cybersecurity

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

A simple and ready-to-use flake template to create a cybersecurity-oriented virtual
machine.
This was inspired by [this post](https://jeancharles.quillet.org/posts/2023-01-16-Basic-nix-vm-for-just-anything.html)

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

- Usernames: `test`, `root`
- Passwords: `test`, `root`

You can clean the VM using:

```bash
just clean
```

## Libraries

Powered by:

- [nixpkgs](https://github.com/NixOS/nixpkgs/)
- [flake-parts](https://github.com/hercules-ci/flake-parts)
- [microvm.nix](https://github.com/microvm-nix/microvm.nix)
- [home-manager](https://github.com/nix-community/home-manager)

## Resources

For lightweight hacking environments without a VM, check out my
[Nix Cyber Templates repository](https://github.com/leoraclet/nix-cyber-templates).
