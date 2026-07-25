{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    osint.enable = lib.mkEnableOption "Enable OSINT tools";
  };

  config = lib.mkIf config.osint.enable {
    environment.systemPackages = with pkgs; [
      python313Packages.shodan
      social-engineer-toolkit
      theharvester
      sherlock
      socialscan
      maltego
      octosuite
      ghdorker
      qgis
      checkpwn
      metabigor
    ];
  };
}
