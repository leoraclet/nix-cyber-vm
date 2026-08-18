{
  flake.modules.nixos.desktop = { pkgs, config, ... }: {
    hardware.graphics.enable = true;

    services = {
      displayManager.autoLogin.user = config.myConfig.userName;
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
