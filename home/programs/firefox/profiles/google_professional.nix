{
  lib,
  extensions,
  ...
}: {
  id = 1;
  name = "google_professional";
  bookmarks = {
    force = true;
    settings = [
      {
        name = "bookmarks";
        toolbar = true;
        bookmarks =
          lib.importJSON ../bookmarks/google.json
          ++ lib.importJSON ../bookmarks/common.json
          ++ [
            {
              name = "codeberg";
              url = "https://codeberg.org";
            }
            {
              name = "commbank";
              url = "https://www.my.commbank.com.au/";
            }
            {
              name = "cloudflare";
              url = "https://dash.cloudflare.com";
            }
            {
              name = "leetcode";
              url = "https://leetcode.com";
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
