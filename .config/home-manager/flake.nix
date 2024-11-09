{
  description = "Home Manager configuration of dev";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
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
      url = "path:/home/jayden/oss/goplaying";
    };
  };

  outputs = { nixpkgs, home-manager, nur, nix-colors, goplaying, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "jayden";
      pkgs = nixpkgs.legacyPackages.${system};
      nurPkgs = import nur { inherit pkgs; };
    in {
      homeConfigurations."jayden" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit nurPkgs inputs nix-colors username;
        };
      };
    };
}
