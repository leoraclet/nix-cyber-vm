{
  flake.modules.nixos.osint-tools = { pkgs, ... }: {
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
