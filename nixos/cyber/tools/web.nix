{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    zap
    caido
    burpsuite
    httpx
    ffuf
    webanalyze
    assetfinder
    subfinder
    sqlmap
    whatweb
    gobuster
    dirb
    wpscan
    jwt-hack
  ];
}
