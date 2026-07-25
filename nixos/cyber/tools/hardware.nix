{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    hardware.enable = lib.mkEnableOption "Enable hardware tools";
  };

  config = lib.mkIf config.hardware.enable {
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
