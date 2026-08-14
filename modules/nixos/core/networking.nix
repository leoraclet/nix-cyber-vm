{ ... }: {
  flake.modules.nixos.networking = { config, ... }: {
    networking = {
      hostName = config.myConfig.userName;
      networkmanager.enable = true;
      enableIPv6 = false;
      nameservers = [
        "1.1.1.1"
        "8.8.8.8"
      ];
      firewall.enable = false;
    };

    # Enable ssh
    services.sshd.enable = true;
    services.openssh.enable = true;
  };
}
