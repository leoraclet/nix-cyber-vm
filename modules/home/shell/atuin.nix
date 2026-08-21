{
  flake.modules.homeManager.atuin = { ... }: {
    programs.atuin = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
