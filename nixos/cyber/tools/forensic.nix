{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    forensic.enable = lib.mkEnableOption "Enable forensic tools";
  };

  config = lib.mkIf config.forensic.enable {
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
      testdisk-qt
      wireshark
      tshark
    ];
  };
}
