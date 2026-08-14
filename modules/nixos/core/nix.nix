{
  flake.modules.nixos.nix = { config, ... }: {
    nix.enable = true;
    nix.nixPath = [ "nixpkgs=${builtins.storePath <nixpkgs>}" ];
    nix.settings = {
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ config.myConfig.userName ];
    };
  };
}
