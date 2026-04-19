{...}: {
  imports = [
    ./postgresql.nix
    ./xremap.nix
    ./xserver.nix
  ];

  services.libinput.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = false;
    jack.enable = true;
    wireplumber.enable = true;
  };
}
