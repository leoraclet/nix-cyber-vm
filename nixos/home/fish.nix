{ pkgs, ... }: {
  home.packages = with pkgs; [
    fastfetch
    zoxide
    atuin
    skim
  ];

  dconf = {
    enable = true;
    settings."org/gnome/Console" = {
      shell = [ "fish" ];
    };
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting

      zoxide init fish | source
      starship init fish --print-full-init | source
    '';
  };
}
