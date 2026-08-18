{
  flake.modules.homeManager.atuin = { ... }: {
    programs.atuin = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
