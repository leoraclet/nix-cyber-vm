{ ... }: {
  imports = [
    ./locale.nix
    ./virtualisation.nix
    ./security.nix
    ./settings.nix
    ./user.nix
    ./env.nix
    ./desktop.nix
    ./network.nix
    ./core.nix
    ./direnv.nix
  ];
}
