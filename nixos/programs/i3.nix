{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      desktopManager = { xterm.enable = true; };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3blocks
          i3-gaps
          # (polybar.override { i3Support = true; })
          feh
          picom
          rofi
          redshift
          alsa-utils
        ];
      };
    };
    displayManager.defaultSession = "none+i3";
  };
}
