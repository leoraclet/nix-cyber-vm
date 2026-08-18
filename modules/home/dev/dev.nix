{ self, ... }: {
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      imports = with self.modules.homeManager; [
        micro
        fresh-editor
        helix
        vscodium
        zed
      ];

      home.packages = with pkgs; [
        # Editor
        neovim

        # Tools
        gcc
        gnumake

        # [ python ]
        python3
        uv
        ruff
      ];
    };

  flake.modules.homeManager.micro = {
    programs.micro = {
      enable = true;
      settings = {
        autosu = true;
        softwrap = true;
        hlsearch = true;
        saveundo = true;
        scrollbar = true;
        mkparents = true;
        diffgutter = true;
      };
    };
  };

  flake.modules.homeManager.fresh-editor = {
    programs.fresh-editor = {
      enable = true;
      # settings = { };
    };
  };
}
