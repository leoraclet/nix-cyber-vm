{
  description = "VM";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              overwriteBackup = true;
              backupFileExtension = "bak";
              users.guest = {
                imports = [
                  ./nixos/home
                ];
              };
              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }
        ];
      };
    };
}
