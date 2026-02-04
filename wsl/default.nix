{pkgs, username, ...}: {
  time.timeZone = "Asia/Kolkata";
  programs.zsh.enable = true;
  wsl.defaultUser = username;
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "networkManager"];
    packages = [];
  };
  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [vim git just];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.05";
  wsl.enable = true;
}
