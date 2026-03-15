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
    # nix-ld = {
    #   enable = true;
    #   libraries = [
    #     pkgs.gtk3
    #     pkgs.gtk4
    #   ];
    # };
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
    pkgs.gnome-network-displays
    pkgs.qbittorrent
    pkgs.lunacy
  ];
}
