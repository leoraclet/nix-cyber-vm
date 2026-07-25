{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    exiftool
    safecopy
    pngcheck
    file
    networkminer
    firefox_decrypt
    bulk_extractor
    dive
    foremost
    scalpel
    volatility3
    volatility2-bin
    autopsy
    sleuthkit
    testdisk
    testdisk-qt
    wireshark
    tshark
  ];
}
