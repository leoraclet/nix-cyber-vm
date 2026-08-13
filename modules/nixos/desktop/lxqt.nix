{
  flake.modules.nixos.lxqt-desktop = { ... }: {
    hardware.graphics.enable = true;
    services.xserver = {
      enable = true;
      desktopManager = {
        lxqt.enable = true;
      };
    };
  };
}
