{
  flake.modules.homeManager.xdg = { ... }: {
    xdg = {
      enable = true;

      userDirs = {
        enable = true;
        setSessionVariables = true;
        createDirectories = true;
      };

      autostart = {
        enable = true;
        entries = [ ];
      };
    };
  };
}
