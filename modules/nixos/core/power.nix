{
  flake.modules.nixos.power = { ... }: {
    powerManagement = {
      enable = true;
      cpuFreqGovernor = "performance";
    };
  };
}
