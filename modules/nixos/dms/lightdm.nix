{
  flake.modules.nixos.lightdm-dms = { ... }: {
    services.xserver.displayManager.lightdm = {
      enable = true;
      greeters.slick.enable = true;
    };
  };
}
