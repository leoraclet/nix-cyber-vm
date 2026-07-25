{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    hashcat
    hashcat-utils
    hash_extender
    fcrackzip
    john
    johnny
    sage
    veracrypt
    truecrack
    pdfrip
    xortool
    magma
    msolve
    flatter
    fplll
    pari
    bkcrack

    python313Packages.numpy
    python313Packages.galois
    python313Packages.gmpy2
    python313Packages.pwntools
    python313Packages.sympy
    python313Packages.pycryptodome
    python313Packages.z3-solver
    python313Packages.cryptography
    python313Packages.py-ecc
    python313Packages.cypari
    python313Packages.mpmath
    python313Packages.fpylll
  ];
}
