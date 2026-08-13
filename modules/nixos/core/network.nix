{ ... }: {
  flake.modules.nixos.networking = { config, ... }: {
    networking = {
      hostName = config.myConfig.userName;
      networkmanager.enable = true;
      enableIPv6 = false;
    };

    # Enable ssh
    services.sshd.enable = true;
  };
}
