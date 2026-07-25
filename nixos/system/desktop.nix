{ ... }: {
  services = {
    xserver.desktopManager.lxqt.enable = true;
    displayManager.autoLogin.user = "guest";
    xserver.videoDrivers = [ "qxl" ];
  };
}
