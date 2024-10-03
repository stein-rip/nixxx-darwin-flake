{
  description = "nix-darwin flake boilerplate";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  # Necessary for using flakes on this system.
   #nix.settings.experimental-features = "nix-command flakes";
   #nix.extra-experimental-features = "nix-command";
 
  outputs = inputs@{ self, nixpkgs, darwin, home-manager, nur, ... }: {
    darwinConfigurations = {
      # m2 
      "m2" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = inputs;
        modules = [ ./hosts/m2 ];
      };
    };
  };

 
}
