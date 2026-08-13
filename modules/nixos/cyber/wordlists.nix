{
  flake.modules.nixos.wordlists = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      payloadsallthethings
      seclists
    ];
  };
}
