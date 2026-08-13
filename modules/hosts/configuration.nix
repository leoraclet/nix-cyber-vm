{
  inputs,
  self,
  ...
}:
let
  fm = inputs.self.modules;
in
{
  flake.homeConfigurations.microvm = inputs.home-manager.lib.homeManagerConfiguration {
    modules = with fm.homeManager; [
      host-microvm
    ];
  };

  # nixos-rebuild build-vm --flake .#microvm
  # nix build .#nixosConfigurations.microvm.config.system.build.vm
  flake.nixosConfigurations.microvm = inputs.nixpkgs.lib.nixosSystem {
    modules =
      with fm.nixos;
      [
        host-microvm
        hmModule

        # ╭──────────────────────────────────────────╮
        # │ CORE                                     │
        # ╰──────────────────────────────────────────╯
        env
        locale
        networking
        sudo-security

        # ╭──────────────────────────────────────────╮
        # │ DESKTOP                                  │
        # ╰──────────────────────────────────────────╯
        lxqt-desktop
        # xfce-desktop

        # ╭──────────────────────────────────────────╮
        # │ DEV                                      │
        # ╰──────────────────────────────────────────╯
        direnv

        # ╭──────────────────────────────────────────╮
        # │ CYBER                                    │
        # ╰──────────────────────────────────────────╯
        # crypto-tools
        # forensic-tools
        # hardware-tools
        # network-tools
        # osint-tools
        # pwn-tools
        # reverse-tools
        # stegano-tools
        # web-tools
        wordlists
      ]
      ++ (with inputs.self.modules.generic; [ userConfig ]);
  };

  flake.modules.homeManager.host-microvm = { ... }: {
    imports = with fm.homeManager; [
      xdg
      librewolf
      vscodium
      kitty
    ];
  };

  flake.modules.nixos.host-microvm =
    { pkgs, config, ... }:
    {
      imports = [
        inputs.microvm.nixosModules.microvm
      ];

      home-manager.users.${config.myConfig.userName} = {
        imports =
          with fm.homeManager;
          [ host-microvm ] ++ (with inputs.self.modules.generic; [ userConfig ]);
      };

      nixpkgs.hostPlatform = "x86_64-linux";
      system.stateVersion = config.myConfig.stateVersion;

      # ╭──────────────────────────────────────────╮
      # │ USER CONFIGURATION                       │
      # ╰──────────────────────────────────────────╯
      programs.fish.enable = true;
      users.users.${config.myConfig.userName} = {
        shell = pkgs.fish;
        useDefaultShell = true;
        isNormalUser = if config.myConfig.userName != "root" then true else false;
        isSystemUser = if config.myConfig.userName != "root" then false else true;
        createHome = true;
        initialPassword = config.myConfig.userName;
        extraGroups = [
          "wheel"
        ];
      };

      services.displayManager.autoLogin.user = config.myConfig.userName;
      services.getty.autologinUser = config.myConfig.userName;

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
        interfaces = [ ];
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
            source = "/home/";
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
