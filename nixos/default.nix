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

  security.sudo-rs.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = ["gtk"];
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  time.timeZone = "Australia/Melbourne";

  # services.resolved.enable = true;
  # hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true;
  networking = {
    hostName = "trash-can";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      checkReversePath = "loose";
      logRefusedConnections = true;
    };
    # nameservers = [ "10.2.0.1" "1.1.1.1" "9.9.9.9" ];
    #    wireguard = {
    #      enable = true;
    #      interfaces.wg0 = {
    #        ips = ["10.2.0.2/32"];
    #        privateKeyFile = "/etc/wireguard/proton.key";
    #        peers = [
    #          {
    #            publicKey = "c+9CyG97uDKPSgCtd/sjvFoXTnswiHsj3kd2CpdXIUc=";
    #            allowedIPs = ["0.0.0.0/0" "::/0"];
    #            endpoint = "149.102.226.239:51820";
    #            persistentKeepalive = 25;
    #          }
    #        ];
    #      };
    #    };
  };
  services.libinput.enable = true;

  hardware.graphics = {enable = true;};
  hardware.enableAllFirmware = true;

  virtualisation = {
  	virtualbox.host.enable = true;
	docker.enable = true;
	podman = {
		enable = true;
		# dockerSocket.enable = true;
		defaultNetwork.settings.dns_enabled = true;
	};
  };

  users.extraGroups.vboxusers.members = [username];
  boot.blacklistedKernelModules = ["kvm_intel" "kvm_amd"];

  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "networkManager" "input" "vboxusers" "adbusers" "kvm" "podman"];
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [vim git just];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.05";
}
