{
  flake.modules.generic.userConfig = { lib, ... }: {
    options.myConfig = {
      userName = lib.mkOption {
        type = lib.types.str;
        default = lib.mkDefault "root";
      };
      stateVersion = lib.mkOption {
        type = lib.types.str;
        default = lib.mkDefault "26.05";
      };
      sharedDirectory = lib.mkOption {
        type = lib.types.str;
        default = lib.mkDefault "/home";
      };
      hostUID = lib.mkOption {
        type = lib.types.int;
        default = lib.mkDefault 1000;
      };
    };

    config = {
      myConfig = {
        userName = lib.mkDefault "test"; # User
        stateVersion = lib.mkDefault "26.05"; # NixOS version
        sharedDirectory = lib.mkDefault "/home/leonne"; # Host directory to share
        hostUID = lib.mkDefault 1001; # Host user ID
      };
    };
  };
}
