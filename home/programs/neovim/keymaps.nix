{...}: {
  programs.nixvim.keymaps = [
    # (vanilla) basic neovim open close keybinds
    {
      key = "<C-a>";
      mode = ["n"];
      action = ":vsplit . <CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Open file in V-SPLIT";
      };
    }
    {
      key = "<S-a>";
      mode = ["n"];
      action = ":split . <CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Open file in SPLIT";
      };
    }
    {
      key = "<S-t>";
      mode = ["n"];
      action = ":tabedit . <CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Open file in TAB";
      };
    }
    {
      key = "<Tab>";
      mode = ["n"];
      action = ":tabnext <CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Next tab";
      };
    }
    {
      key = "<S-Tab>";
      mode = ["n"];
      action = ":tabprevious <CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Previous tab";
      };
    }
    # (vanilla) misc
    {
      key = ";m";
      mode = ["n"];
      action = ":noh <CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Remove search highlight";
      };
    }
    {
      key = "H";
      mode = ["n" "v"];
      action = "^";
      options = {
        silent = true;
        noremap = true;
        desc = "Go to start of line";
      };
    }
    {
      key = "L";
      mode = ["n" "v"];
      action = "$";
      options = {
        silent = true;
        noremap = true;
        desc = "Go to end of line";
      };
    }
    {
      key = "J";
      mode = ["n"];
      action = "mzJ`z";
      options = {
        silent = true;
        noremap = true;
        desc = "Join lines without losing cursor";
      };
    }
    {
      key = "<C-u>";
      mode = ["n"];
      action = "<C-u>zz";
      options = {
        silent = true;
        noremap = true;
        desc = "Scroll up with cursor in center";
      };
    }
    {
      key = "<C-d>";
      mode = ["n"];
      action = "<C-d>zz";
      options = {
        silent = true;
        noremap = true;
        desc = "Scroll down with cursor in center";
      };
    }
    {
      key = "n";
      mode = ["n"];
      action = "nzzzv";
      options = {
        silent = true;
        noremap = true;
        desc = "Search next with cursor centered";
      };
    }
    {
      key = "N";
      mode = ["n"];
      action = "Nzzzv";
      options = {
        silent = true;
        noremap = true;
        desc = "Search previous with cursor centered";
      };
    }
    {
      key = "<C-]>";
      mode = ["n"];
      action = "";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable <C-]> keymap, it took you to the location of definition file of the thing on which your cursor was, it was annoying";
      };
    }

    # (gitsigns)
    {
      key = "<leader>gs";
      action = "<cmd>Gitsigns toggle_signs<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gp";
      action = "<cmd>Gitsigns prev_hunk <CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>gn";
      action = "<cmd>Gitsigns next_hunk <CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>tp";
      action = "<cmd>Gitsigns preview_hunk <CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    # (lazygit)
    {
      key = "<leader>;g";
      action = ":lua Snacks.lazygit()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    # (nvim-tree)
    {
      key = "<leader>sf";
      mode = "n";
      action = ":NvimTreeFindFileToggle<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    # (dired)
    {
      key = "<leader>sd";
      mode = "n";
      action = ":Dired<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    # (kulala)
    {
      key = "<leader>kr";
      mode = ["n"];
      action = ''<cmd>lua require("kulala").run()<CR>'';
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>ko";
      mode = ["n"];
      action = ''<cmd>lua require("kulala").scratchpad()<CR>'';
      options = {
        silent = true;
        noremap = true;
      };
    }
    # fuzzy-finder
    {
      key = "<leader>;f";
      action = ":lua Snacks.picker.files()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>;l";
      action = ":lua Snacks.picker.grep()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<leader>;h";
      action = ":lua Snacks.picker.help()<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}
