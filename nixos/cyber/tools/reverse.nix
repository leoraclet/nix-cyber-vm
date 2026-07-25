{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    reverse.enable = lib.mkEnableOption "Enable reverse engineering tools";
  };

  config = lib.mkIf config.reverse.enable {
    environment.systemPackages = with pkgs; [
      python313Packages.frida-python
      python313Packages.pwntools
      python313Packages.angrop
      python313Packages.distorm3

      checksec
      binwalk
      hopper
      binaryninja-free
      ghidra-bin
      ida-free
      cutter
      imhex
      jadx
      apk-tools
      frida-tools
      pe-bear
      pwntools
      radare2
      rizin
      dex2jar
      quark-engine
    ];
  };
}
