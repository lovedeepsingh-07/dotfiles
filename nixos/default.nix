{ pkgs, ... }:
{
  imports =
    [
      ./hardware-config.nix
	  ./programs
	  ./audio.nix
    ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  time.timeZone = "Asia/Kolkata";
  networking = {
    hostName = "Trash-Box";
    networkmanager.enable = true;
  };

  services = {
    libinput.enable = true;
    openssh.enable = true;
  };

  hardware.graphics = {
    enable = true;
  };

  fonts = {
    fontDir.enable = true;
  };
  users.users.axew = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkManager" ];
    packages = with pkgs; [
      brave
      alacritty
    ];
  };
  environment = {
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [
		vim
		git
		just
	];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}

