{ ... }: {
  imports = [
    ./fish.nix
    ./kitty.nix
    ./vscodium.nix
    ./starship.nix
    ./tmux.nix

    ./librewolf
  ];

  home.stateVersion = "26.05";
}
