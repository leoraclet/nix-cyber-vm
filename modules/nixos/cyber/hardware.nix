{
  flake.modules.nixos.hardware-tools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      python313Packages.sigrok

      pulseview
      sigrok-cli
      libsigrok
      libsigrokdecode
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
      saleae-logic-2
    ];
  };
}
