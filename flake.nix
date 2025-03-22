{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };
  outputs = { nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations = {
      niX = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./os
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.kiria.imports = [
                ./home.nix
                inputs.self.outputs.homeManagerModules.default
              ];
            };
          }
          stylix.nixosModules.stylix
        ];
      };
    };
    homeManagerModules.default = ./hm;
  };
}
