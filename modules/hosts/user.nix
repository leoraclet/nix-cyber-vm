{ lib, ... }: {
  flake.modules.nixos.user-config = { pkgs, config, ... }: {
    # ╭──────────────────────────────────────────╮
    # │ SERVICES                                 │
    # ╰──────────────────────────────────────────╯
    services.getty.autologinUser = config.myConfig.userName;

    # ╭──────────────────────────────────────────╮
    # │ USER CONFIGURATION                       │
    # ╰──────────────────────────────────────────╯
    programs.fish.enable = true;

    users = {
      defaultUserShell = pkgs.fish;
      mutableUsers = true;
      groups.${config.myConfig.userName} = { };

      users.${config.myConfig.userName} = {
        shell = pkgs.fish;
        useDefaultShell = true;
        isSystemUser = true;
        # isNormalUser = true;
        uid = lib.mkIf (config.myConfig.userName != "root") config.myConfig.hostID;
        createHome = true;
        group = config.myConfig.userName;
        home = if config.myConfig.userName != "root" then "/home/${config.myConfig.userName}" else "/root";
        initialPassword = config.myConfig.userName;
        extraGroups = [
          "wheel"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa REDACTED"
        ];
      };
    };
  };
}
