{ lib, config, ... }: {

  options = {
    desktop.enable = lib.mkEnableOption "Enabled Desktop Manager";
  };
  config = lib.mkIf config.desktop.enable {
    services = {
      xserver.enable = true;
      xserver.desktopManager.lxqt.enable = true;
      displayManager.autoLogin.user = "guest";
      xserver.videoDrivers = [ "qxl" ];
    };
  };
}
