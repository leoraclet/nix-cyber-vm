{ ... }: {
  flake.modules.nixos.desktop = { pkgs, config, ... }: {
    hardware.graphics.enable = true;
    xdg.portal.enable = true;

    services = {
      flatpak.enable = true;
      displayManager.autoLogin = {
        enable = true;
        user = config.myConfig.userName;
      };
      # https://nixos.wiki/wiki/Xorg
      xserver = {
        updateDbusEnvironment = true;
        excludePackages = with pkgs; [
          xterm
        ];
      };
    };
  };
}
