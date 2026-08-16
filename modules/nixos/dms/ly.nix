{
  flake.modules.nixos.ly-dms = { ... }: {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "matrix";
        brightness_down_key = "null";
        brightness_up_key = "null";
        bigclock = true;
        session_log = null;
        clear_password = true;
        hide_version_string = true;
      };
    };
  };
}
