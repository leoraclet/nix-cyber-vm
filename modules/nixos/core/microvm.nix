{ inputs, self, ... }: {
  flake.modules.nixos.microvm =
    { config, ... }:
    {
      imports = [
        inputs.microvm.nixosModules.microvm
      ];

      # ╭──────────────────────────────────────────╮
      # │ MICROVM CONFIGURATION                    │
      # ╰──────────────────────────────────────────╯
      # https://microvm-nix.github.io/microvm.nix/options.html
      microvm = {
        # Enable writable nix store overlay so nix-daemon works.
        # This is required for home-manager activation.
        # Uses tmpfs by default (ephemeral), which is fine since we
        # don't build anything in the VM.
        writableStoreOverlay = "/nix/.rw-store";

        graphics.enable = config.hardware.graphics.enable;
        vcpu = 4;
        mem = 4096;
        # https://microvm-nix.github.io/microvm.nix/interfaces.html
        interfaces = [
          {
            type = "user";
            id = "vm-test1";
            mac = "02:00:00:00:00:01";
          }
        ];
        forwardPorts = [
          {
            from = "host";
            host.port = 2222;
            guest.port = 22;
          }
        ];
        volumes = [
          {
            mountPoint = "/var";
            image = "var.img";
            size = 8192; # MB
          }
        ];
        # https://microvm-nix.github.io/microvm.nix/shares.html
        shares = [
          {
            proto = "9p";
            tag = "home";
            # Source path can be absolute or relative
            # to /var/lib/microvms/$hostName
            source = "${config.myConfig.mountPoint}";
            mountPoint =
              if config.myConfig.userName != "root" then
                "/home/${config.myConfig.userName}/shared"
              else
                "/root/shared";
          }
          {
            # use proto = "virtiofs" for MicroVMs that are started by systemd
            proto = "9p";
            tag = "ro-store";
            # a host's /nix/store will be picked up so that no
            # squashfs/erofs will be built for it.
            source = "/nix/store";
            mountPoint = "/nix/.ro-store";
          }
        ];
        # https://microvm-nix.github.io/microvm.nix/devices.html
        devices = [ ];

        # "qemu" has 9p built-in!
        hypervisor = "qemu";
        socket = "control.socket";
      };
    };

  # ╭──────────────────────────────────────────╮
  # │ MICROVM PACKAGE                          │
  # ╰──────────────────────────────────────────╯
  perSystem =
    { ... }:
    {
      # nix run .#microvm
      packages.microvm = self.nixosConfigurations.microvm.config.microvm.declaredRunner;
    };
}
