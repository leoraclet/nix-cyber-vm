{ self, ... }: {
  flake.modules.nixos.qtile-desktop = { ... }: {
    imports = [
      self.modules.nixos.desktop
    ];

    services.xserver = {
      enable = true;
      windowManager.qtile.enable = true;
    };
  };
}
