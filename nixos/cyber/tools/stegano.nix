{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    stegano.enable = lib.mkEnableOption "Enable steganalysis tools";
  };

  config = lib.mkIf config.stegano.enable {
    environment.systemPackages = with pkgs; [
      binwalk
      audacity
      sonic-visualiser
      mediainfo
      exiftool
      imhex
      steghide
      stegseek
      stegsolve
      zsteg
      outguess
      pngcheck
      recoverjpeg
      snow
    ];
  };
}
