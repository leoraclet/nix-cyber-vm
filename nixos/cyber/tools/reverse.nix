{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313Packages.frida-python
    python313Packages.pwntools
    python313Packages.angrop
    python313Packages.distorm3

    elf-info
    checksec
    binwalk
    pev
    hopper
    binaryninja-free
    ghidra-bin
    ida-free
    cutter
    cutterPlugins.rz-ghidra
    imhex
    jadx
    apk-tools
    frida-tools
    pe-bear
    pwntools
    radare2
    rizin
    rizinPlugins.rz-ghidra
    dex2jar
    quark-engine
  ];
}
