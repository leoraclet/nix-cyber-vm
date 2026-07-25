{ pkgs, ... }: {
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
}
