{...}: {
  programs.firefox = {
    enable = true;
    policies = {};
    profiles = {
      privacy = import ./profiles/privacy.nix;
      personal = import ./profiles/personal.nix;
    };
  };
}
