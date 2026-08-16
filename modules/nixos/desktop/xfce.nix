{ self, ... }: {
  flake.modules.nixos.xfce-desktop = { pkgs, ... }: {
    imports = [
      self.modules.nixos.desktop
    ];
    home-manager.sharedModules = with self.modules.homeManager; [
      xfce-desktop
    ];

    services.xserver = {
      enable = true;
      desktopManager = {
        xfce = {
          enable = true;
          enableScreensaver = false;
        };
      };
    };

    programs.xfconf.enable = true;
    environment = {
      pathsToLink = [ "/share/backgrounds" ]; # TODO: https://github.com/NixOS/nixpkgs/issues/47173
      systemPackages = with pkgs; [
        xfce4-cpugraph-plugin
        xfce4-docklike-plugin
        xfce4-genmon-plugin
        xfce4-pulseaudio-plugin
        xfce4-settings
        xfce4-whiskermenu-plugin
      ];
    };
  };

  flake.modules.homeManager.xfce-desktop = { pkgs, ... }: {
    home.packages = with pkgs; [
      xrandr # Command line interface to X11 Resize, Rotate, and Reflect (RandR) extension
      networkmanagerapplet # NetworkManager control applet for GNOME
      ristretto # A fast and lightweight picture-viewer for the Xfce desktop environment
      xfce4-appfinder # Appfinder for the Xfce4 Desktop Environment
      xfce4-panel # Panel for the Xfce desktop environment
      xfce4-power-manager # A power manager for the Xfce Desktop Environment
      xfce4-screenshooter # Screenshot utility for the Xfce desktop
      xfce4-session # Session manager for Xfce
      xfce4-taskmanager # Easy to use task manager for Xfce
      xfdesktop # Xfce's desktop manager
      xfwm4 # Window manager for Xfce
    ];

    xfconf.settings = {
      xsettings = {
        "Net/ThemeName" = "Sweet-Dark-v40";
        "Net/IconThemeName" = "Papirus-Dark";
        "Gtk/CursorThemeName" = "Bibata-Modern-Ice";
      };
    };
  };
}
