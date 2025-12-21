{ pkgs, ... }: {
  imports = [ ./hardware-config.nix ./programs ./audio.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Kolkata";
  networking = {
    hostName = "Trash-Box";
    networkmanager.enable = true;
  };

  services = {
    libinput.enable = true;
    openssh.enable = true;
  };

  hardware.graphics = { enable = true; };
  hardware.enableAllFirmware = true;

  fonts = { fontDir.enable = true; };
  fonts.packages = [ (import ./font.nix { inherit pkgs; }) ];
  users.users.axew = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkManager" ];
    packages = with pkgs; [
      brave
      alacritty
      wineWowPackages.stable # for running windows apps on linux
      eww
      brightnessctl
    ];
  };
  environment = {
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [ vim git just ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}

