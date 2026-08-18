{
  flake.modules.nixos.nix = { config, ... }: {
    documentation.enable = false;
    nix = {
      enable = true;
      settings = {
        extra-experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [
          "wheel"
          config.myConfig.userName
        ];
      };
    };

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = config.myConfig.stateVersion;

    nixpkgs.config = {
      allowUnfree = true;
    };
  };
}
