{ ... }:
{
  imports = [
    ./system
    ./cyber
  ];

  # Enable desktop
  desktop.enable = false;

  system.stateVersion = "22.11";
}
