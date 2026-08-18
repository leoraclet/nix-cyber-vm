{ self, ... }: {
  flake.modules.nixos.zsh = { pkgs, ... }: {
    home-manager.sharedModules = with self.modules.homeManager; [
      zsh
    ];

    programs.zsh.enable = true;
    environment.systemPackages = with pkgs; [
      nix-zsh-completions
      zsh-autosuggestions
      zsh-syntax-highlighting
    ];
  };

  flake.modules.homeManager.zsh = { config, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        path = "${config.home.homeDirectory}/.zsh_history";
        extended = true; # timestamp
        expireDuplicatesFirst = true;
      };
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "zsh-users/zsh-history-substring-search"; }
          { name = "zsh-users/zsh-syntax-highlighting"; }
          # { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Uncomment to use powerlevel10k plugin
        ];
      };
      shellAliases = {
        history = "history 0"; # show whole history
      };
    };
  };
}
