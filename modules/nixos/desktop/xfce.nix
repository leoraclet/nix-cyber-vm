{ self, ... }: {
  flake.modules.nixos.xfce-desktop = { ... }: {
    imports = [
      self.modules.nixos.desktop
    ];

    services.xserver = {
      enable = true;
      desktopManager = {
        xfce.enable = true;
      };
    };
  };
}
