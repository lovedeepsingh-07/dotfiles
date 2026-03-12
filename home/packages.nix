{
  pkgs,
  flake_inputs,
  system,
  ...
}: {
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
}

