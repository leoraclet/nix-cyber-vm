{
  flake.modules.nixos.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    fonts.fontconfig.defaultFonts = {
      monospace = [
        "JetBrainsMono Nerd Font"
      ];
    };
  };
}
