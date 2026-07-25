{ pkgs, ... }: {
  # Sound settings
  security.rtkit.enable = true;
  environment.systemPackages = with pkgs; [ pulseaudio ];
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };

  hardware = {
    graphics = {
      enable = true;
    };
  };
}
