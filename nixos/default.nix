{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-config.nix
    ./programs
    ./audio.nix
    ./font.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Australia/Melbourne";
  networking = {
    hostName = "trash-can";
    networkmanager.enable = true;
	firewall = {
		enable = true;
		allowPing = false;
		allowedTCPPorts = [ ];
		allowedUDPPorts = [ ];
		checkReversePath = "strict";
		logRefusedConnections = true;
	};
  };
 #  services.resolved = {
 #  	enable = true;
	# dnssec = "true";
	# domains = ["~."];
	# fallbackDns = [ "9.9.9.9" "1.1.1.1" ];
 #  };
  services.libinput.enable = true;

  hardware.graphics = {enable = true;};
  hardware.enableAllFirmware = true;

   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ username ];

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
