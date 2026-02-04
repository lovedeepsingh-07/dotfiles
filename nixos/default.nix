{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-config.nix
    ./programs
    ./audio.nix
    ./services.nix
    ./font.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Australia/Melbourne";
  networking = {
    hostName = "Trash-Box";
    networkmanager.enable = true;
  };

  hardware.graphics = {enable = true;};
  hardware.enableAllFirmware = true;

  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "networkManager" "input"];
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [vim git just];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.05";
}
