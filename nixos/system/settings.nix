{ ... }: {
  nix = {
    settings = {
      allowed-users = [ "@wheel" ]; # locks down access to nix-daemon
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Apps
  services.flatpak.enable = true;
}
