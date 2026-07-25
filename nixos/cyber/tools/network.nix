{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    network.enable = lib.mkEnableOption "Enable cryptanalysis tools";
  };

  config = lib.mkIf config.network.enable {
    environment.systemPackages = with pkgs; [
      python313Packages.impacket
      python313Packages.scapy

      nmap
      assetfinder
      subfinder
      wireshark
      tshark
      tor
      torsocks
      wifite2
      aircrack-ng
      airgeddon
      macchanger
      amass
      bettercap
      ettercap
      tshark
      dnsmasq
      proxychains-ng
    ];
  };
}
