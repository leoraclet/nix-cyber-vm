{
  flake.modules.homeManager.brave = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Example: uBlock Origin
      ];
      commandLineArgs = [ "--disable-features=WebRtcAllowInputVolumeAdjustment" ];
    };
  };
}
