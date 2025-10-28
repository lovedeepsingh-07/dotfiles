{ pkgs, ... }: {
  programs.nixvim = {
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
        name = "helpview";
        src = pkgs.fetchFromGitHub {
          owner = "OXY2DEV";
          repo = "helpview.nvim";
          rev = "518789535a0cb146224a428edf93a70f98b795db";
          hash = "sha256-Utcdm/9nAIfIx6oOXHgArS59/oTAOPg+wK+4/Z3TQUQ=";
        };
        doCheck = false;
      })
      # (pkgs.vimUtils.buildVimPlugin {
      #   name = "dired";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "X3eRo0";
      #     repo = "dired.nvim";
      #     rev = "b56790d065bf503f7d56d05d7f9893ef249b99ed";
      #     hash = "sha256-u6jOf/D1IM6UZXet4YYjagOgfIVryB96vpz7i7WsSio=";
      #   };
      #   doCheck = false;
      # })
    ];
  };
  #    programs.nixvim.extraConfigLua = ''
  #    require("dired").setup{
  #    path_separator = "/",                
  #    show_hidden = true,                  
  #    show_icons = false,                  
  #    show_banner = false,                 
  #    hide_details = false,                
  # show_dot_dirs = true,
  # show_colors = true,
  #    sort_order = "name", 
  # keybinds = {
  # }
  #    }
  #  '';
}
