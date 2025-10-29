{
  description = "home-manager configuration";
  inputs = {
    nixpkgs.url =
      "github:nixos/nixpkgs/d2ed99647a4b195f0bcc440f76edfa10aeb3b743";
    flake-utils.url =
      "github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b";
    home-manager = {
      url =
        "github:nix-community/home-manager/7aae0ee71a17b19708b93b3ed448a1a0952bf111";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url =
        "github:nix-community/nixvim/e114d442b14f3a299307ca9b0f0eab20e821f419";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minimal-tmux = {
      url =
        "github:niksingh710/minimal-tmux-status/d7188c1aeb1c7dd03230982445b7360f5e230131";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake/6b28ae462971c812ee1acdfba9cc01736053c2ca";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      formatter.${system} = pkgs.nixfmt-classic;
      homeConfigurations = {
        ${username} = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home ];
          extraSpecialArgs = {
            flake_inputs = inputs;
            inherit username system;
          };
        };
      };
    };
}
