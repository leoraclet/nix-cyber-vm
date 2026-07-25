{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313Packages.pwntools
    python313Packages.ropper
    python313Packages.angrop
    python313Packages.z3-solver
    python313Packages.frida-python
    python313Packages.unicorn-angr
    python313Packages.unicorn
    python313Packages.capstone
    python313Packages.qiling
    python313Packages.pyhidra
    python313Packages.angr
    python313Packages.miasm

    ltrace
    strace
    procdump
    lldb
    nasm
    ropgadget
    jadx
    frida-tools
    capstone
    unicorn
    unicorn-angr
    gdb
    imhex
    ida-free
    ghidra
    ghidra-bin
    binaryninja-free
    gef
    qemu
    qemu-utils
    qemu-user
  ];
}
