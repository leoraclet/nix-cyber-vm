{
  flake.modules.homeManager.zellij = {
    programs.zellij = {
      enable = true;
      settings = {
        theme = "nord";
        default_shell = "fish";
        simplified_ui = true;
        pane_frames = false;
        keybinds = {
          unbind = "Ctrl q";
        };
      };
    };
  };
}
