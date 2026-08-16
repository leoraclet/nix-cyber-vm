{ self, ... }: {
  flake.modules.homeManager.shell = { ... }: {
    imports = with self.modules.homeManager; [
      atuin
      git
      starship
      fish
      tmux
      zoxide
      alias
      cli
    ];
  };
}
