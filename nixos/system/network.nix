{ ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  services.vnstat.enable = true;
}
