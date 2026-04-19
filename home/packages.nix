{
  pkgs,
  flake_inputs,
  system,
  ...
}: let
  rust_pkg = pkgs.rust-bin.stable."1.94.0".default;
in {
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
    (import ../packages/babyshark.nix {inherit pkgs rust_pkg;})
    wireshark
    kew
    zip
  ];
}
