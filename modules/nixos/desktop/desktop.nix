{
  flake.modules.nixos.desktop = { config, ... }: {
    services.displayManager.autoLogin.user = config.myConfig.userName;
    hardware.graphics.enable = true;
  };
}
