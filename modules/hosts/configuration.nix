{ inputs, self, ... }: {
  # ╭──────────────────────────────────────────╮
  # │ NIXOS CONFIGURATION                      │
  # ╰──────────────────────────────────────────╯
  flake.nixosConfigurations.microvm = inputs.nixpkgs.lib.nixosSystem {
    modules =
      with self.modules.nixos;
      [
        host-microvm
        hmModule
        microvm

        # ╭──────────────────────────────────────────╮
        # │ CORE                                     │
        # ╰──────────────────────────────────────────╯
        env
        nix
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
      ++ (with inputs.self.modules.generic; [
        userConfig
      ]);
  };

  flake.modules.nixos.host-microvm =
    { pkgs, config, ... }:
    {
      # ╭──────────────────────────────────────────╮
      # │ HOME-MANAGER CONFIGURATION               │
      # ╰──────────────────────────────────────────╯
      home-manager.users.${config.myConfig.userName} = {
        imports =
          with self.modules.homeManager;
          [
            xdg
            librewolf
            vscodium
            kitty
          ]
          ++ (with inputs.self.modules.generic; [
            userConfig
          ]);
      };

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
        openssh.authorizedKeys.keys = [
          "ssh-rsa REDACTED"
        ];
      };

      # ╭──────────────────────────────────────────╮
      # │ DESKTOP CONFIGURATION                    │
      # ╰──────────────────────────────────────────╯
      services.displayManager.autoLogin.user = config.myConfig.userName;
      services.getty.autologinUser = config.myConfig.userName;
    };
}
