{ pkgs, ... }:
{
  imports = [
    # ./tools/crypto.nix
    # ./tools/forensic.nix
    # ./tools/hardware.nix
    # ./tools/network.nix
    # ./tools/stegano.nix
    # ./tools/pwn.nix
    # ./tools/reverse.nix
    # ./tools/web.nix
    # ./tools/osint.nix
  ];

  environment.systemPackages = with pkgs; [
    payloadsallthethings
    seclists
    git
    curl
    openvpn
    wireguard-tools
    net-tools
  ];
}
