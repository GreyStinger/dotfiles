{
  description = "Home Manager configuration of dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    goplaying = {
      url = "github:justinmdickey/goplaying";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nur, nix-colors, goplaying, ... }:
    let
      system = "x86_64-linux";
      username = "jayden";
      pkgs = nixpkgs.legacyPackages.${system};
      nurPkgs = import nur { inherit pkgs; };
    in {
      homeConfigurations."jayden" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];

        extraSpecialArgs = {
          inherit nurPkgs inputs nix-colors username;
        };
      };
    };
}
