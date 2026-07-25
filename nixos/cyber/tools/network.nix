{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313Packages.impacket
    python313Packages.bloodhound-py
    python313Packages.scapy
    python313Packages.ldapdomaindump

    bloodhound
    bloodhound-py
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
}
