{ ... }: {
  imports = [
    ./xremap.nix
    ./i3.nix
  ];
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    i3lock.enable = true;
  };
}
