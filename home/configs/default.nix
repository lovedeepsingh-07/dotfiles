{...}: {
  imports = [
    ./alacritty.nix
    ./hypr
    ./i3
    ./picom
    ./eww
    ./polybar
    ./rofi
    ./waybar
    ./zathura
  ];
  home.file.".config/pgcli/config".text = ''
    [main]
    keyring = False
  '';
}
