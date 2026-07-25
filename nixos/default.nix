{ ... }:
{
  imports = [
    ./system
    ./cyber
  ];

  # Enable ssh
  services.sshd.enable = true;

  system.stateVersion = "22.11";
}
