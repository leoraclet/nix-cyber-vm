{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313Packages.sigrok

    pulseview
    sigrok-cli
    libsigrok
    libsigrokdecode
    smuview
    binwalk
    sigdigger
    urh
    qemu
    gnuradio
    inspectrum
    urh
    qemu-utils
    qemu-user
    gdb
    imhex
    saleae-logic
    saleae-logic-2
  ];
}
