{ inputs, self, ... }: {
  flake.modules.nixos.host-microvm = { config, ... }: {
    imports = with self.modules.nixos; [
      # ╭──────────────────────────────────────────╮
      # │ CORE + BASE                              │
      # ╰──────────────────────────────────────────╯
      hmModule
      microvm
      user-config

      env
      audio
      power
      theme
      nix
      zsh
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
    home-manager.users.${config.myConfig.userName}.imports = with self.modules.homeManager; [
      # Environment
      xdg

      # Browser
      librewolf
      brave
      qutebrowser
      vscodium

      # Shell
      dev
      cli
      shell

      # Terminal
      kitty
      alacritty
    ];
  };

  # ╭──────────────────────────────────────────╮
  # │ NIXOS CONFIGURATION                      │
  # ╰──────────────────────────────────────────╯
  flake.nixosConfigurations.microvm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [ host-microvm ];
  };
}
