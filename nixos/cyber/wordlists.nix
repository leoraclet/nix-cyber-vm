{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    wordlists.enable = lib.mkEnableOption "Enable cryptanalysis tools";
  };

  config = lib.mkIf config.wordlists.enable {
    environment.systemPackages = with pkgs; [
      payloadsallthethings
      seclists
    ];
  };
}
