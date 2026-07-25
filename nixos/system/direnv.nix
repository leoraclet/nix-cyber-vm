{ ... }: {
  programs = {
    direnv = {
      enable = true;
      silent = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
    };
  };
}
