{ pkgs, ... }: {
	programs.nixvim = {
		extraPlugins = [
		  (pkgs.vimUtils.buildVimPlugin {
			name = "comfy-line-numbers";
			src = pkgs.fetchFromGitHub {
			  owner = "mluders";
			  repo = "comfy-line-numbers.nvim";
			  rev = "3c51fa4104b97ddaccb66a6b34552e3eafd5b645";
			  hash = "sha256-frc2V4QVFL4P5+VnclFFhxQRV8q9UqT3XRxQG6ZwpAg=";
			};
			doCheck = false;
		  })
		];
		extraConfigLua = ''
		require("comfy-line-numbers").setup()
		'';
	};
}
