{
  flake.modules.nixos.nix = { config, ... }: {
    nix.enable = true;
    nix.settings = {
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "wheel"

        config.myConfig.userName
      ];
    };

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = config.myConfig.stateVersion;

    nixpkgs.config = {
      allowUnfree = true;
    };
  };
}
