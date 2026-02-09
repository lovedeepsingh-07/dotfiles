{
  lib,
  extensions,
  ...
}: {
  id = 3;
  name = "google_extra";
  bookmarks = {
    force = true;
    settings = [
      {
        name = "bookmarks";
        toolbar = true;
        bookmarks = lib.importJSON ../bookmarks/google.json ++ lib.importJSON ../bookmarks/common.json;
      }
    ];
  };
  extensions = {
    force = true;
    packages = [
      extensions.privacy_badger
      extensions.dark_reader
      extensions.matte_black_theme
    ];
  };
  settings = import ../preferences.nix {inherit lib;};
}
