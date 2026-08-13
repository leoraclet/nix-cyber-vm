{
  flake.modules.nixos.sudo-security = { ... }: {
    security.sudo.wheelNeedsPassword = false;
    security.sudo-rs.wheelNeedsPassword = false;
  };
}
