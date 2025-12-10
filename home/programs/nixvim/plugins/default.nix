{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      web-devicons = {
        enable = true;
        settings = {
          override_by_filename = {
            "justfile" = {
              icon = "";
              color = "#6D8086";
              cterm_color = "66";
              name = "Justfile";
            };
          };
        };
      };
      colorizer = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings.event = [ "BufReadPre" ];
        };
        settings = {
          filetypes = {
            lua.names = false;
            javascript.names = false;
            typescript.names = false;
            python.names = false;
            svelte.names = false;
            go.names = false;
            rust.names = false;
            c.names = false;
            cpp.names = false;
            nix.names = false;
            zig.names = false;
          };
        };
      };
      markdown-preview = {
        enable = true;
        settings = {
          echo_preview_url = 1;
          theme = "dark";
        };
      };
      # colorbuddy.enable = true;
      # plenary.enable = true;
      nui.enable = true;
      # popup.enable = true;
      dressing.enable = true;
      gitsigns = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings = {
            cmd = [ "Gitsigns" ];
            keys = [[ "gs" "<cmd>Gitsigns toggle_signs <CR>" ]];
          };
        };
        settings = { signcolumn = false; };
      };
      lazygit.enable = true;
      # render-markdown = {
      #   enable = true;
      #   settings = {
      #     pipe_table.enabled = false;
      #     latex.enabled = false;
      #   };
      # };
      comment = {
        enable = true;
        # lazyLoad = {
        #   enable = true;
        #   settings.event = [ "BufReadPre" ];
        # };
      };
      nvim-autopairs = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings.event = [ "BufReadPre" ];
        };
        settings = { disable_filetype = [ "TelescopePrompt" ]; };
      };
      # nvim-surround = {
      #   enable = true;
      #   lazyLoad = {
      #     enable = true;
      #     settings.event = [ "BufReadPre" ];
      #   };
      # };
      kulala = {
        enable = true;
        settings = { global_keymaps = false; };
      };
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "helpview";
        src = pkgs.fetchFromGitHub {
          owner = "OXY2DEV";
          repo = "helpview.nvim";
          rev = "518789535a0cb146224a428edf93a70f98b795db";
          hash = "sha256-Utcdm/9nAIfIx6oOXHgArS59/oTAOPg+wK+4/Z3TQUQ=";
        };
        doCheck = false;
      })
    ];
  };
  imports = [
    ./nvim-tree.nix
    ./bufferline.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp.nix
    ./cmp.nix
    ./conform.nix
    # ./dired.nix
    ./lz-n.nix
    ./obsidian.nix
	./comfy-line-numbers.nix
  ];
}
