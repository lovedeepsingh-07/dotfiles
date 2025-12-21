{ pkgs, ... }: {
  programs.nixvim = {
    colorscheme = "mellow";
    colorschemes = {
      kanagawa = {
        enable = false;
        settings.background.dark = "dragon";
      };
      gruvbox.enable = false;
      rose-pine.enable = false;
      bamboo.enable = false;
      catppuccin = {
        enable = false;
        settings.background.dark = "mocha";
      };
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "mellow";
        src = pkgs.fetchFromGitHub {
          owner = "mellow-theme";
          repo = "mellow.nvim";
          rev = "5cd188489bcc7eb512f0a30581ad972070f8e5cd";
          hash = "sha256-A+2yTvhrug7hZBcoqfwIuuxz41xUPKZ7zqAwujeHTkI=";
        };
        doCheck = false;
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "sonokai";
        src = pkgs.fetchFromGitHub {
          owner = "sainnhe";
          repo = "sonokai";
          rev = "ec07018013b4683cf33f80ee4bdf3eca2621da33";
          hash = "sha256-NJsBkz2Rsh+e2bTev2sqlqTzZewzohZvb/yR3/wSmo0=";
        };
        doCheck = false;
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "moonly";
        src = pkgs.fetchFromGitHub {
          owner = "bluz71";
          repo = "vim-moonfly-colors";
          rev = "1ad5a8d40176a8749f0c77b8875225d9d299a438";
          hash = "sha256-izM1EFBfnAoDWho8Zfsu8i2bUkWvV6oQzGz/9NFVgnA=";
        };
        doCheck = false;
      })
    ];
  };
}
