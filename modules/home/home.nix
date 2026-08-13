{ inputs, ... }:
{
  flake.modules.nixos.hmModule = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      verbose = true;
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm_bak~";
      overwriteBackup = true;
      sharedModules = [
        (
          { nixosConfig, config, ... }:
          {
            # home.enableNixpkgsReleaseCheck = false;
            programs.home-manager.enable = true;
            home = {
              username = config.myConfig.userName;
              stateVersion = nixosConfig.system.stateVersion;
              # Make programs use XDG directories whenever supported
              preferXdgDirectories = true;
              homeDirectory =
                if config.myConfig.userName != "root" then "/home/${config.myConfig.userName}" else "/root";
            };
          }
        )
      ];
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
