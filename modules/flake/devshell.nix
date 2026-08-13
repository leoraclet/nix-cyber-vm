{
  perSystem =
    { pkgs, ... }:
    {
      # ╭──────────────────────────────────────╮
      # │ NIX                                  │
      # ╰──────────────────────────────────────╯
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          git
          just
          nixfmt
        ];
        commands = [
          {
            name = "nix-tree-with-gcroots";
            category = "nix tools";
            command = ''
              nix-store --gc --print-roots | rg -v '/proc/' | rg -Po '(?<= -> ).*' | xargs -o nix-tree
            '';
          }
        ];
      };
    };
}
