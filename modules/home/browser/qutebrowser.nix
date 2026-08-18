{
  flake.modules.homeManager.qutebrowser = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Keyboard-focused web browser
      (qutebrowser.override {
        enableWideVine = true;
      })
    ];

    # https://github.com/nix-community/home-manager/blob/master/modules/programs/qutebrowser.nix
    # programs.qutebrowser = {
    #   enable = true;
    # };
  };
}
