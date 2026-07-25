{ pkgs, ... }:
let
  theme-components = {
    gtk-theme = "Sweet-Dark-v40";
    icon-theme = "Sweet-Purple";
    cursor-theme = "oreo_spark_purple_cursors";
  };
  gtkTheme = "${theme-components.gtk-theme}";
  gtkIconTheme = "${theme-components.icon-theme}";
  gtkCursorTheme = "${theme-components.cursor-theme}";
in
{
  home.sessionVariables.GTK_THEME = gtkTheme;

  home.packages = with pkgs; [
    papirus-folders
    papirus-icon-theme
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = gtkTheme;
      package = pkgs.sweet.override {
        colorVariants = [ "Sweet-Dark-v40" ];
      };
    };

    iconTheme = {
      name = gtkIconTheme;
      package = pkgs.sweet-folders;
    };

    cursorTheme = {
      name = gtkCursorTheme;
      package = pkgs.oreo-cursors-plus;
    };
  };
}
