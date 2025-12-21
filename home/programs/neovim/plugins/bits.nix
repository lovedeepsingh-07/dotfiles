{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "bits";
        src = pkgs.fetchFromGitHub {
          owner = "lovedeepsingh-07";
          repo = "bits.nvim";
          rev = "7b618568a6cf94d37e198a9760d88da30eadd8b3";
          hash = "sha256-cMJUDGUihKRh2M5/gDrbql0tBbENpSuc+IcG1/CmEig=";
        };
        doCheck = false;
      })
    ];
    extraConfigLua = ''
        require("bits.dired").setup {
      	show_icons = true,
      	sort_order = "dirs",
      	keybinds = {
      		dired_enter = "<CR>",
      		dired_back = "_",
      		dired_up = "-",
      		dired_rename = "r",
      		dired_create = "a",
      		dired_delete = "d",
      		dired_delete_range = "d",
      		dired_duplicate = "Y",
      		dired_copy = "C",
      		dired_copy_range = "C",
      		dired_copy_marked = "MC",
      		dired_move = "X",
      		dired_move_range = "X",
      		dired_move_marked = "MX",
      		dired_paste = "P",
      		dired_mark = "M",
      		dired_mark_range = "M",
      		dired_delete_marked = "Md",
      		dired_shell_cmd = ".",
      		dired_shell_cmd_curr_path = "!",
      		dired_shell_cmd_marked = "&",
      		dired_toggle_hidden = "\\.",
      		dired_toggle_sort_order = ",",
      		dired_toggle_colors = "c",
      		dired_toggle_icons = "*",
      		dired_toggle_hide_details = "(",
      		dired_quit = "q",
      	},
        }
    '';
  };
}
