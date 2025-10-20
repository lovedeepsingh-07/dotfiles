{
  description = "nixos configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zig-overlay.url = "github:mitchellh/zig-overlay";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mellow-nvim = {
      url = "github:mellow-theme/mellow.nvim";
      flake = false;
    };
    helpview-nvim = {
      url = "github:OXY2DEV/helpview.nvim";
      flake = false;
    };
    nvim-gomove = {
      url = "github:booperlv/nvim-gomove";
      flake = false;
    };
    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake";
    };
  };
  outputs = { nixpkgs, ... }@inputs:
    let
      username = "axew";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import inputs.rust-overlay) ];
      };
      zig-pkg = inputs.zig-overlay.packages.${system}."0.12.1";
      rust-pkg = pkgs.rust-bin.stable.latest.default;
    in
    {
      nixosConfigurations.axew = nixpkgs.lib.nixosSystem {
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
                inherit username system zig-pkg rust-pkg;
              };
            };
          }
        ];
      };
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}

