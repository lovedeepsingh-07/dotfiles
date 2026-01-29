{
  description = "nix configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/d2ed99647a4b195f0bcc440f76edfa10aeb3b743";
    flake-utils.url = "github:numtide/flake-utils/11707dc2f618dd54ca8739b309ec4fc024de578b";
    home-manager = {
      url = "github:nix-community/home-manager/7aae0ee71a17b19708b93b3ed448a1a0952bf111";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/debc562c48c445f9f08778ecb9fc6b35197623ad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/e114d442b14f3a299307ca9b0f0eab20e821f419";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status/d7188c1aeb1c7dd03230982445b7360f5e230131";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake/6b28ae462971c812ee1acdfba9cc01736053c2ca";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR/cfec46978cb4b02aa137d3fd06702eb6919be380";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # (made-by-me): stuff after this is made by me
    alex.url = "github:lovedeepsingh-07/alex/a9792da45f027526d68484bd96b1c07442496c55";
  };
  outputs = {...} @ inputs: let
    username = "axew";
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [];
    };
  in {
    nixosConfigurations.wsl = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit system;
        flake_inputs = inputs;
      };
      modules = [
        inputs.nixos-wsl.nixosModules.default
        {imports = [./wsl];}
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
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit system;
        flake_inputs = inputs;
      };
      modules = [
        inputs.nur.modules.nixos.default
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
    homeConfigurations.standalone = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home];
      extraSpecialArgs = {
        flake_inputs = inputs;
        inherit username system;
      };
    };
  };
}
