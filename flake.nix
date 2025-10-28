{
  description = "nixos configuration";
  inputs = {
    nixpkgs.url =
      "github:nixos/nixpkgs/fd487183437963a59ba763c0cc4f27e3447dd6dd";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = { url = "github:xremap/nix-flake"; };
  };
  outputs = { ... }@inputs:
    let
      username = "axew";
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ ];
      };
    in {
      nixosConfigurations.axew = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit system;
          flake_inputs = inputs;
        };
        modules = [
          ./nixos
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.axew = import ./home;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                flake_inputs = inputs;
                inherit username system;
              };
            };
          }
        ];
      };
      formatter.${system} = pkgs.nixfmt-classic;
    };
}

