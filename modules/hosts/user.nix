{
  flake.modules.nixos.user = { pkgs, config, ... }: {
    programs.fish.enable = true;
    services.getty.autologinUser = config.myConfig.userName;

    users = {
      defaultUserShell = pkgs.fish;
      # Allows to change the initial password to a more robust one after firt login.
      mutableUsers = true;
      groups.${config.myConfig.userName} = { };

      users.${config.myConfig.userName} = {
        shell = pkgs.fish;
        useDefaultShell = true;
        isSystemUser = true;
        uid = 1001;
        createHome = true;
        group = config.myConfig.userName;
        home = "/home/${config.myConfig.userName}";
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
