{ self, ... }:
let
  fm = self.modules;
in
{
  # ╭──────────────────────────────────────────╮
  # │ NIXOS CONFIGURATION                      │
  # ╰──────────────────────────────────────────╯
  flake.modules.nixos.wm = { pkgs, ... }: {
    imports = with fm.nixos; [
      lightdm-dms
      dms
    ];
    home-manager.sharedModules = [ fm.homeManager.wm ];

    security = {
      soteria.enable = true; # Polkit agent
      pam.services.hyprlock = { };
    };

    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  # ╭──────────────────────────────────────────╮
  # │ HOME-MANAGER CONFIGURATION               │
  # ╰──────────────────────────────────────────╯
  flake.modules.homeManager.wm = { pkgs, ... }: {
    home.packages = with pkgs; [
      libnotify # notify-send
      uwsm
      xwayland-satellite
      wev # wayland event view
      avizo
    ];

    services = {
      cliphist = {
        enable = true;
        allowImages = true;
      };
    };
  };

  # ╭──────────────────────────────────────────╮
  # │ SWAY                                     │
  # ╰──────────────────────────────────────────╯
  flake.modules.nixos.sway =
    { pkgs, ... }:
    {
      imports = with fm.nixos; [
        wm
        desktop
      ];
      programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        extraPackages = [
          pkgs.autotiling-rs
        ];
      };
    };

  # ╭──────────────────────────────────────────╮
  # │ HYPRLAND                                 │
  # ╰──────────────────────────────────────────╯
  flake.modules.nixos.hyprland = {
    imports = with fm.nixos; [
      wm
      desktop
    ];
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };

  # ╭──────────────────────────────────────────╮
  # │ NIRI                                     │
  # ╰──────────────────────────────────────────╯
  flake.modules.nixos.niri = {
    imports = with fm.nixos; [
      wm
      desktop
    ];
    programs.niri.enable = true;
    services.displayManager.dms-greeter.compositor.name = "niri";
  };

  # ╭──────────────────────────────────────────╮
  # │ DMS                                      │
  # ╰──────────────────────────────────────────╯
  flake.modules.nixos.dms = {
    programs.dms-shell = {
      enable = true;
    };
  };
}
