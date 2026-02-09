{
  pkgs,
  flake_inputs,
  username,
  system,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  news.display = "silent";

  imports = [flake_inputs.nixvim.homeModules.nixvim ./programs ./configs ];

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
	entr
	pandoc
	unoconv
	typst
	zathura
    flake_inputs.alex.packages."${system}".default
    flake_inputs.witr.packages."${system}".default
  ];

  home.sessionVariables = {NIX_PATH = "$HOME/.nix-defexpr/channels";};
  home.stateVersion = "25.05";
}
