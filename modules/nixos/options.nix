{
  flake.modules.generic.userConfig =
    { lib, ... }:
    {
      options.myConfig = {
        userName = lib.mkOption {
          type = lib.types.str;
          default = lib.mkDefault "test";
        };
        stateVersion = lib.mkOption {
          type = lib.types.str;
          default = lib.mkDefault "26.05";
        };
        mountPoint = lib.mkOption {
          type = lib.types.str;
          default = lib.mkDefault "/home";
        };
      };

      config = {
        myConfig = {
          userName = "test";
          stateVersion = "26.05";
          mountPoint = "/home/leonne";
        };
      };
    };
}
