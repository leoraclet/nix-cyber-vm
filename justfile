alias run := vm

default:
    @just --choose --unsorted

show:
    nix flake show --no-write-lock-file

vm:
    nix run .#microvm

test: clean
    nix run .#microvm

clean:
    rm -f ./*.socket
    rm -f ./*.qcow2
    rm -f ./result
    rm -f ./var.img
