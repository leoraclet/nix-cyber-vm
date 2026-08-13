{ inputs, ... }:
{
  perSystem =
    {
      lib,
      pkgs,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
        ];
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
          # allowInsecure = true;
        };
      };

      # nix build .#
      # quickly access nixpkgs packages without specifying `legacyPackages.<arch>`
      # legacyPackages = pkgs;

      # flake.packages
      packages = lib.packagesFromDirectoryRecursive {
        inherit (pkgs) callPackage;
        directory = (inputs.self + /pkgs);
      };
    };
}
