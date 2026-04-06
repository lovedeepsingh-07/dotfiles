{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "jupyter";
          publisher = "ms-toolsai";
          version = "2025.8.0";
          sha256 = "sha256-MZHsgFxrAbDjRn0cH+cBolVvFQXlZPiVSZDUWDU6/jA=";
        }
      ];
    };
  };
}
# pkgs.nix-vscode-extensions.open-vsx.ms-toolsai.jupyter
#  (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
# mktplcRef = {
#   name = "jupyter";
#   publisher = "ms-toolsai";
#   version = "2024.1.0"; # change this
#   sha256 = "sha256-xxxxxxxxxxxxxxxxxxxx"; # paste yours
# };
#  })

