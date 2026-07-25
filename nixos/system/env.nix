{ ... }: {
  environment = {
    sessionVariables = {
      EDITOR = "nano";
      BROWSER = "librewolf";
      SHELL = "fish";
      TERMINAL = "kitty";
      TERM = "xterm-256color";
      NIXPKGS_ALLOW_UNFREE = "1"; # To allow nix-shell to use unfree packages
    };
  };
}
