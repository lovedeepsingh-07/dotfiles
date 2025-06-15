{ pkgs, ... }: {
  imports = [
    ./alacritty
    ./hypr
    ./i3
    ./nixvim
    ./picom
    ./polybar
    ./powershell
    ./rofi
    ./starship
    ./tmux
    ./waybar
    ./xremap
    ./zsh
  ];

  programs.home-manager.enable = true;

  programs = {
    git = {
      enable = true;
      package = pkgs.emptyDirectory;
      extraConfig = {
        user = {
          name = "lovedeepsingh-07";
          email = "lovedeepsinghbrar07@gmail.com";
        };
        init.defaultBranch = "main";
        core.editor = "nvim";
        core.pager = "nvim -";
      };
    };
    fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        logo.type = "small";
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "shell"
          "wm"
          "terminal"
        ];
      };
    };
    lazygit = {
      enable = true;
      settings = {
        os = {
          edit = "nvim {{filename}}";
          editInTerminal = true;
        };
      };
    };
  };
}
