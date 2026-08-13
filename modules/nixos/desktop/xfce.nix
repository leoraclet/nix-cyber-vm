{
  flake.modules.nixos.xfce-desktop = { ... }: {
    hardware.graphics.enable = true;
    services.xserver = {
      enable = true;
      desktopManager = {
        xfce.enable = true;
      };
    };
  };
}
