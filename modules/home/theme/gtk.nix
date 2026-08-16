{
  flake.modules.homeManager.gtk-theme =
    { pkgs, ... }:
    let
      gtkTheme = "Sweet-Dark-v40";
    in
    {
      home.sessionVariables.GTK_THEME = gtkTheme;

      gtk = {
        enable = true;
        gtk3.extraConfig.gtk-decoration-layout = "menu:";
        theme = {
          name = gtkTheme;
          package = pkgs.sweet.override {
            colorVariants = [ gtkTheme ];
          };
        };

        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };

        cursorTheme = {
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
        };
      };
    };
}
