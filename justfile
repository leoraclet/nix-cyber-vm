default:
    @just --list

build:
    nix build ./#nixosConfigurations.vm.config.system.build.vm

run:
    @just build
    QEMU_NET_OPTS="hostfwd=tcp::2222-:22" ./result/bin/run-nixos-vm

# To run VM directly in term
term:
    @just build
    QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic; reset

clean:
    rm -rf ./nixos.qcow2
    rm -rf ./result/
