{
  flake.modules.nixos.audio = { pkgs, config, ... }: {
    users.users.${config.myConfig.userName} = {
      extraGroups = [ "audio" ];
    };

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
  };
}
