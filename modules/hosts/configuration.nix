{ inputs, self, ... }: {
  flake.modules.nixos.host-microvm =
    { config, ... }:
    {
      imports = with self.modules.nixos; [
        # ╭──────────────────────────────────────────╮
        # │ CORE + BASE                              │
        # ╰──────────────────────────────────────────╯
        hmModule
        microvm

        env
        audio
        power
        user
        theme
        nix
        locale
        direnv
        networking
        sudo-security

        # ╭──────────────────────────────────────────╮
        # │ DESKTOP                                  │
        # ╰──────────────────────────────────────────╯
        # lxqt-desktop
        xfce-desktop
        # qtile-desktop

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
      ];

      # ╭──────────────────────────────────────────╮
      # │ HOME-MANAGER CONFIGURATION               │
      # ╰──────────────────────────────────────────╯
      home-manager.users.${config.myConfig.userName} = {
        imports = with self.modules.homeManager; [
          xdg
          librewolf
          vscodium
          dev
          cli
          shell
          kitty
        ];
      };
    };

  # ╭──────────────────────────────────────────╮
  # │ NIXOS CONFIGURATION                      │
  # ╰──────────────────────────────────────────╯
  flake.nixosConfigurations.microvm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [ host-microvm ];
  };
}
