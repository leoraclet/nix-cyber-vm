{
  flake.modules.homeManager.fish = { pkgs, ... }: {
    programs.fish = {
      enable = true;
      plugins = [
        {
          name = "done";
          src = pkgs.fishPlugins.done.src;
        }
        {
          name = "fzf-fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "bang-bang";
          src = pkgs.fishPlugins.bang-bang.src;
        }
        {
          name = "fifc";
          src = pkgs.fishPlugins.fifc.src;
        }
      ];
    };
  };
}
