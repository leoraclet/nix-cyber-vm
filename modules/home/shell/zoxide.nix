{
  flake.modules.homeManager.zoxide = { ... }: {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      options = [ ];
    };
  };
}
