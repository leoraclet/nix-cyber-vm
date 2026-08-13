{
  flake.modules.nixos.reverse-tools = { pkgs, ... }: {
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
