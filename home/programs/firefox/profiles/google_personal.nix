{
  lib,
  extensions,
  ...
}: {
  id = 0;
  isDefault = true;
  name = "google_personal";
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
              name = "reddit";
              url = "https://www.reddit.com";
            }
            {
              name = "vibe_coding";
              bookmarks = [
                {
                  name = "chatgpt";
                  url = "https://chatgpt.com/";
                }
                {
                  name = "claude";
                  url = "https://claude.ai/";
                }
              ];
            }
            {
              name = "social_shit";
              bookmarks = [
                {
                  name = "instagram";
                  url = "https://www.instagram.com/";
                }
                {
                  name = "snapchat";
                  url = "https://www.snapchat.com/web/";
                }
              ];
            }
            {
              name = "spotify";
              url = "https://spotify.com/";
            }
            {
              name = "amazon";
              url = "https://amazon.com.au";
            }
            {
              name = "steam";
              url = "https://store.steampowered.com/";
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
