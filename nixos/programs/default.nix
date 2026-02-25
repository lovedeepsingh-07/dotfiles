{
  pkgs,
  username,
  ...
}: {
  imports = [./xremap.nix ./i3.nix];
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    i3lock.enable = true;
  };
  users.users.${username}.packages = [
    pkgs.brave
    pkgs.alacritty
    pkgs.wineWowPackages.stable
    pkgs.eww
    pkgs.brightnessctl
    pkgs.flameshot
    pkgs.gimp
    pkgs.nautilus
	pkgs.onboard
	pkgs.wireguard-tools
  ];
}
