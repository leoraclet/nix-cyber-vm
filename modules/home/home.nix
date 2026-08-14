{ inputs, ... }:
{
  flake.modules.nixos.hmModule = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.self.modules.generic.userConfig
    ];

    home-manager = {
      verbose = true;
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm_bak~";
      overwriteBackup = true;
      sharedModules = [
        inputs.self.modules.generic.userConfig
        (
          { nixosConfig, config, ... }:
          {
            programs.home-manager.enable = true;
            home = {
              username = config.myConfig.userName;
              preferXdgDirectories = true;
              homeDirectory = "/home/${config.myConfig.userName}";
              stateVersion = nixosConfig.system.stateVersion;
            };
          }
        )
      ];
    };
  };
}
