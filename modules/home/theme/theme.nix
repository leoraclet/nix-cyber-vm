{ self, ... }: {
  flake.modules.nixos.theme = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      fonts
    ];
    home-manager.sharedModules = with self.modules.homeManager; [
      gtk-theme
    ];

    environment.systemPackages = with pkgs; [
      papirus-folders
      papirus-icon-theme
      bibata-cursors
    ];
  };
}
