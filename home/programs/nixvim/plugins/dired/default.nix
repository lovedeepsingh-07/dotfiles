{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "dired";
        src = ./.;
        doCheck = false;
      })
    ];
    extraConfigLua = ''
      require("dired").setup{
	  show_icons = true,
	  }
    '';
  };
}
