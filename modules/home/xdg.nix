{
  flake.modules.homeManager.xdg =
    { ... }:
    {
      # https://github.com/search?q=repo%3Anix-community%2Fhome-manager%20%20preferXdgDirectories&type=code
      home.preferXdgDirectories = true;

      xdg = {
        enable = true;

        userDirs = {
          enable = true;
          createDirectories = true;
        };

        autostart = {
          enable = true;
          entries = [ ];
        };
      };
    };
}
