{
  flake.modules.homeManager.alias = { lib, pkgs, ... }: {
    home.packages = with pkgs; [
      bat
      eza
    ];

    home.shellAliases = {
      # [ ls ]
      cls = "clear";
      ls = "${lib.getExe pkgs.eza} --icons";
      li = "ls -l";
      ll = "ls -la";
      la = "ls -a";
      lt = "ls --tree";
      lm = "ls -l -a --reverse --sort=modified";

      tree = "eza --tree --icons=always --color=always -h --hyperlink";
      cat = "${lib.getExe pkgs.bat} -p";
      open = "xdg-open"; # `Invoke-Item` powershell style
      zed = "zeditor .";
      code = "codium &";
      cd = "z";
      nsh = "nix-shell --command 'fish' --packages";
      nix-shell = "nix-shell --run '$SHELL'";

    };
  };
}
