{ pkgs, flake_inputs, username,zig-pkg, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  news.display = "silent";

  imports = [
    flake_inputs.nixvim.homeManagerModules.nixvim
    ./programs
  ];

  home.packages = with pkgs; [
    which
    eza
    fd
    fzf
    curl
    unzip
    ripgrep
    virtualenv
    openssh
    fontforge
    clang
    gdb
    cmake
    nodejs
    go
    bun
    deno
    live-server
    jdk
    rust-bin.stable."1.82.0".default
	zig-pkg
    cargo-binstall
    sccache
    bacon
    cargo-update
    cargo-info
    python312
    python312Packages.pylatexenc
    nerd-font-patcher
    tree-sitter
    cmatrix
    nyancat
    cargo-generate
  ];

  home.sessionVariables = {
  NIX_PATH = "$HOME/.nix-defexpr/channels";
	};

  home.stateVersion = "24.11";
}
