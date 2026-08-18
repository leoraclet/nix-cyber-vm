{ ... }: {
  flake.modules.nixos.direnv = { ... }: {
    programs = {
      direnv = {
        enable = true;
        silent = true;
        loadInNixShell = true;
        nix-direnv.enable = true;
      };
    };
  };
}
