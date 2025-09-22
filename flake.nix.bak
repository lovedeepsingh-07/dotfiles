{
  description = "home-manager configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/fd487183437963a59ba763c0cc4f27e3447dd6dd";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
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
  };
  outputs = { nixpkgs, home-manager, rust-overlay, zig-overlay, flake-utils, ... }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs { inherit system overlays; };
      username = "axew";
      zig-pkg = zig-overlay.packages.${system}."0.14.0";
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home
          ];
          extraSpecialArgs = {
            flake_inputs = inputs;
            inherit username zig-pkg;
          };
        };
      };
    };
}
