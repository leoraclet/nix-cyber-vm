# https://codeberg.org/dnkl/foot/src/branch/master/foot.ini
{
  flake.modules.homeManager.foot =
    { pkgs, ... }:
    {
      programs.foot = {
        enable = true;
        server.enable = true; # default: false
        package = pkgs.foot;
      };
    };

}
