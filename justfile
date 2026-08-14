alias run := vm

default:
    @just --choose --unsorted

build:
    nixos-rebuild build-vm --flake .#microvm
    # nix build .#nixosConfigurations.microvm.config.system.build.vm

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
