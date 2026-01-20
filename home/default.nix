{
  pkgs,
  flake_inputs,
  username,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  news.display = "silent";

  imports = [flake_inputs.nixvim.homeModules.nixvim ./programs];

  home.packages = with pkgs; [
    alejandra
    bash
    which
    eza
    fd
    fzf
    curl
    unzip
    ripgrep
    virtualenv
    openssh
    gcc
    btop
    nodejs
    tree-sitter
    cmatrix
    nyancat
    luajit
    pkg-config
  ];

  home.sessionVariables = {NIX_PATH = "$HOME/.nix-defexpr/channels";};

  home.stateVersion = "25.05";
}
