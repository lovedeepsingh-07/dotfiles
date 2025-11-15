{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "dired";
        src = pkgs.fetchFromGitHub {
          owner = "lovedeepsingh-07";
          repo = "dired.nvim";
          rev = "d12ceaddc431eaaa5852912093c9d195cccf0fd5";
          hash = "sha256-mSiHNpcnF8+gEjxxLngOwAfG7mBqXLNa8w/C5daHL5k=";
        };
        doCheck = false;
      })
    ];
    extraConfigLua = ''
            require("dired").setup{
      	  show_icons = true,
		  sort_order = "dirs"
      	  }
    '';
  };
}
