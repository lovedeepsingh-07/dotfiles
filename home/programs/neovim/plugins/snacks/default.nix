{  pkgs, ... }: {
	programs.nixvim = {
		extraPlugins = [
		  (pkgs.vimUtils.buildVimPlugin {
			name = "snacks";
			src = pkgs.fetchFromGitHub {
			  owner = "folke";
			  repo = "snacks.nvim";
			  rev = "fe7cfe9800a182274d0f868a74b7263b";
			  hash = "sha256-vRedYg29QGPGW0hOX9qbRSIImh1d/SoDZHImDF2oqKM=";
			};
			doCheck = false;
		  })
		  (pkgs.vimUtils.buildVimPlugin {
			name = "snacks-config";
			src = ./.;
			doCheck = false;
		  })
		];
		extraConfigLua = ''
		require("snacks-config").setup()
		'';
	};
}
