{ pkgs, flake_inputs, system, username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  news.display = "silent";

  imports = [ flake_inputs.nixvim.homeManagerModules.nixvim ./programs ];

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
    # fontforge
    # clang
    # gdb
    # cmake
    # nodejs
    # go
    # bun
    # deno
    # live-server
    # jdk
    # cargo-binstall
    sccache
    # bacon
    # cargo-update
    # cargo-info
    python312
    python312Packages.pylatexenc
    # nerd-font-patcher
    tree-sitter
    cmatrix
    nyancat
    # cargo-generate
    # delve
    # (import ./programs/lua.nix { inherit system pkgs; }).pkg
    luajit
    pkg-config
    # vscode-extensions.vadimcn.vscode-lldb
  ];

  home.sessionVariables = { NIX_PATH = "$HOME/.nix-defexpr/channels"; };

  home.stateVersion = "25.05";
}
