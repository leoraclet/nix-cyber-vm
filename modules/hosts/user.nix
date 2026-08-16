{
  flake.modules.nixos.user = { pkgs, config, ... }: {
    services.getty.autologinUser = config.myConfig.userName;
    programs.fish.enable = true;

    users = {
      defaultUserShell = pkgs.fish;
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
