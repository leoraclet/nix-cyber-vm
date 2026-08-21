{ self, ... }: {
  # https://wiki.nixos.org/wiki/Xfce
  flake.modules.nixos.xfce-desktop = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      desktop
      theme
    ];
    home-manager.sharedModules = with self.modules.homeManager; [
      xfce-desktop
    ];

    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          enableScreensaver = false;
        };
      };
    };

    programs.xfconf.enable = true;
    environment = {
      pathsToLink = [ "/share/backgrounds" ]; # TODO: https://github.com/NixOS/nixpkgs/issues/47173
      xfce.excludePackages = with pkgs; [
        mousepad
        parole
        ristretto
        xfce4-screenshooter
        xfce4-session
        # xfce4-panel
        xfce4-taskmanager
        xfce4-terminal
        # xfce4-appfinder
        xfce4-notifyd
        # xfce4-settings
      ];
    };
  };

  flake.modules.homeManager.xfce-desktop = { pkgs, ... }: {
    home.file.".config/xfce4/helpers.rc".text = ''
      WebBrowser=librewolf
      FileManager=Thunar
      TerminalEmulator=kitty
    '';
    home.packages = with pkgs; [
      xfce4-appfinder # Appfinder for the Xfce4 Desktop Environment
      xfdesktop # Xfce's desktop manager
      xfwm4 # Window manager for Xfce
    ];

    # Set LibreWolf as the default browser
    xdg.configFile."mimeapps.list".text = ''
      [Default Applications]
      x-scheme-handler/http=librewolf.desktop
      x-scheme-handler/https=librewolf.desktop
      text/html=librewolf.desktop
    '';

    xfconf = {
      enable = true;
      settings = {
        xfce4-panel = { };
        xfce4-keyboard-shortcuts = {
          "commands/custom/override" = true;
          "commands/custom/<ALT>r" = "xfce4-appfinder";
          "commands/custom/<ALT>t" = "exo-open --launch TerminalEmulator";
        };
        xfce4-session = {
          "general/SaveOnExit" = true;
        };
        keyboards = {
          "Default/Numlock" = true;
        };
        thunar = {
          "misc-show-delete-action" = true;
        };
        xsettings = {
          "Net/ThemeName" = "Sweet-Dark-v40";
          "Net/IconThemeName" = "Papirus-Dark";
          "Net/CursorBlink" = true;
          "Net/CursorBlinkTime" = 500;
          "Net/DndDragThreshold" = 8;
          "Net/DoubleClickDistance" = 5;
          "Net/DoubleClickTime" = 400;
          "Gtk/CursorThemeSize" = 20;
          "Gtk/CursorThemeName" = "Bibata-Modern-Ice";
          "Gtk/TitlebarMiddleClick" = "lower";
          "Gtk/ToolbarIconSize" = 3;
          "Gtk/ToolbarStyle" = "icons";
          "Gtk/ButtonImages" = true;
          "Gtk/DecorationLayout" = "menu:minimize,maximize,close";
          "Gtk/DialogsUseHeader" = false;
        };
      };
    };
  };
}
