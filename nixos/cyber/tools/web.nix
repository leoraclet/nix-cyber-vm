{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    web.enable = lib.mkEnableOption "Enable web tools";
  };

  config = lib.mkIf config.web.enable {
    environment.systemPackages = with pkgs; [
      zap
      caido
      burpsuite
      httpx
      ffuf
      webanalyze
      assetfinder
      subfinder
      sqlmap
      whatweb
      gobuster
      wpscan
      jwt-hack
    ];
  };
}
