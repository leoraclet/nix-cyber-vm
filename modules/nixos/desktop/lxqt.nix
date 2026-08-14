{ self, ... }: {
  flake.modules.nixos.lxqt-desktop = { ... }: {
    imports = [
      self.modules.nixos.desktop
    ];

    services.xserver = {
      enable = true;
      desktopManager = {
        lxqt.enable = true;
      };
    };
  };
}
