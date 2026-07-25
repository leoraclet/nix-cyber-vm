{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313Packages.opencv4Full
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
}
