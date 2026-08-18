{
  flake.modules.homeManager.fish = { pkgs, ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -U fish_greeting ""

        set -x PAYLOADS "/run/current-system/sw/share/wordlists"
        set -x SECLISTS "$PAYLOADS/seclists"
        set -x PAYLOADSALLTHETHINGS "$PAYLOADS/PayloadsAllTheThings"
        set -x FUZZDB "$PAYLOADS/FuzzDB"
        set -x AUTOWORDLISTS "$PAYLOADS/Auto_Wordlists"
        set -x SECURITYWORDLIST "$PAYLOADS/Security-Wordlist"

        set -x ROCKYOU "$SECLISTS/Passwords/Leaked-Databases/rockyou.txt"
        set -x DIRSMALL "$SECLISTS/Discovery/Web-Content/directory-list-2.3-small.txt"
        set -x DIRMEDIUM "$SECLISTS/Discovery/Web-Content/directory-list-2.3-medium.txt"
        set -x DIRBIG "$SECLISTS/Discovery/Web-Content/directory-list-2.3-big.txt"
        set -x WEBAPI_COMMON "$SECLISTS/Discovery/Web-Content/api/api-endpoints.txt"
        set -x WEBAPI_MAZEN "$SECLISTS/Discovery/Web-Content/common-api-endpoints-mazen160.txt"
        set -x WEBCOMMON "$SECLISTS/Discovery/Web-Content/common.txt"
        set -x WEBPARAM "$SECLISTS/Discovery/Web-Content/burp-parameter-names.txt"
      '';
      plugins = [
        {
          name = "done";
          src = pkgs.fishPlugins.done.src;
        }
        {
          name = "fzf-fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "bang-bang";
          src = pkgs.fishPlugins.bang-bang.src;
        }
        {
          name = "fifc";
          src = pkgs.fishPlugins.fifc.src;
        }
      ];
    };
  };
}
