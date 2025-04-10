{
  description = "Home Manager configuration of dev";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprcursor-phinger.url = "github:Jappie3/hyprcursor-phinger";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = { url = "github:kaylorben/nixcord"; };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    goplaying = {
      url = "github:GreyStinger/goplaying/patch-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, catppuccin, nur, nix-colors, ... }:
    let
      system = "x86_64-linux";
      username = "jayden";

      pkgs = nixpkgs.legacyPackages.${system};
      nurPkgs = import nur { inherit pkgs; };
    in {
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix catppuccin.homeModules.catppuccin ];

        extraSpecialArgs = {
          inherit nurPkgs inputs system nix-colors username;
        };
      };
    };
}
