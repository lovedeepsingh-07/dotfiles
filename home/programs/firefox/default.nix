{
  pkgs,
  lib,
  ...
}: let
  extensions = {
    privacy_badger = pkgs.nur.repos.rycee.firefox-addons.buildFirefoxXpiAddon {
      pname = "privacy_badger";
      version = "0.1.0";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/4638816/privacy_badger17-2025.12.9.xpi";
      sha256 = "sha256-9DKr3NztcmyZK/76mtAN62+otqfkOZlgldUHYnQ5zqE=";
      meta.homepage = "";
    };
    dark_reader = pkgs.nur.repos.rycee.firefox-addons.buildFirefoxXpiAddon {
      pname = "dark_reader";
      version = "0.1.0";
      addonId = "addon@darkreader.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/4665768/darkreader-4.9.119.xpi";
      sha256 = "sha256-JhpCLy/Pg+4yCseigJ2Sa4Y3+63s6KV1i4Jb0GApRL4=";
      meta.homepage = "";
    };
    matte_black_theme = pkgs.nur.repos.rycee.firefox-addons.buildFirefoxXpiAddon {
      pname = "matte_black_theme";
      version = "0.1.0";
      addonId = "{f2b832a9-f0f5-4532-934c-74b25eb23fb9}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4226379/matte_black_v1-2024.1.24.xpi";
      sha256 = "sha256-ajwfWSuxsevEEVgLJqsl+4Jqpn4jEjcg5Br9t6JxA5o=";
      meta.homepage = "";
    };
  };
in {
  programs.firefox = {
    enable = true;
    policies = {};
    profiles = {
      personal = import ./profiles/google_personal.nix {inherit lib extensions;};
      privacy = import ./profiles/proton_personal.nix {inherit lib extensions;};
    };
  };
}
