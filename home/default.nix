{
  flake_inputs,
  username,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  news.display = "silent";

  imports = [flake_inputs.nixvim.homeModules.nixvim ./programs ./configs ./packages.nix];

  home.sessionVariables = {NIX_PATH = "$HOME/.nix-defexpr/channels";};
  home.stateVersion = "25.05";
}
