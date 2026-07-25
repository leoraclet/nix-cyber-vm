{ pkgs, lib, ... }:
{
  imports = [
    ./tools/crypto.nix
    ./tools/forensic.nix
    ./tools/hardware.nix
    ./tools/network.nix
    ./tools/stegano.nix
    ./tools/pwn.nix
    ./tools/reverse.nix
    ./tools/web.nix
    ./tools/osint.nix
    ./wordlists.nix
  ];

  crypto.enable = lib.mkDefault false;
  forensic.enable = lib.mkDefault false;
  hardware.enable = lib.mkDefault false;
  network.enable = lib.mkDefault false;
  stegano.enable = lib.mkDefault false;
  pwn.enable = lib.mkDefault false;
  reverse.enable = lib.mkDefault false;
  web.enable = lib.mkDefault false;
  osint.enable = lib.mkDefault false;

  wordlists.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    git
    curl
    openvpn
    wireguard-tools
    net-tools
  ];
}
