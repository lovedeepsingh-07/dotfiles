{
  lib,
  extensions,
  ...
}: {
  id = 2;
  name = "proton_personal";
  bookmarks = {
    force = true;
    settings = [
      {
        name = "bookmarks";
        toolbar = true;
        bookmarks =
          lib.importJSON ../bookmarks/proton.json
          ++ lib.importJSON ../bookmarks/common.json
          ++ [
            {
              name = "ente";
              url = "https://web.ente.io/gallery";
            }
          ];
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
