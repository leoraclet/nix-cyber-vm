{
  flake.modules.homeManager.cli = { pkgs, ... }: {
    home.packages = with pkgs; [
      superfile
      fd
      jq
      sd
      fzf
      pay-respects
      zip
      ouch
      hexyl
      skim
      ripgrep
      mpv
      wget
      btop
      ivm
      openssl
    ];
  };
}
