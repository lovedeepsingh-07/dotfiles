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
        bookmarks = lib.importJSON ../bookmarks/google.json ++ lib.importJSON ../bookmarks/common.json ++ [
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
  settings = {
    "browser.shell.checkDefaultBrowser" = false; # show warning about making firefox the default browser
    "browser.aboutConfig.showWarning" = false; # show warning when accessing "about:config"
    "browser.startup.homepage" = "about:home"; # where should the home page point to
    "browser.newtabpage.enabled" = true; # enable home page
    "browser.newtabpage.activity-stream.showSearch" = true; # enable search bar on the home page
    "browser.newtabpage.activity-stream.feeds.topsites" = false; # disable the topsites on home page
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false; # disable the top recommended stories on home page
    "browser.tabs.groups.smart.userEnabled" = false; # disable "Use AI to suggest tabs and a name for tab groups"
    "browser.download.useDownloadDir" = false; # always ask where to download before downloading
    "browser.preferences.defaultPerformanceSettings.enabled" = false; # "Use recommended performance settings"
    "layers.acceleration.disabled" = true; # disable hardware acceleration
    "widget.gtk.overlay-scrollbars.enabled" = false; # always show scrollbars
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false; # "Recommend extensions as you browse"
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false; # "Recommend features as you browse"
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
    "browser.urlbar.suggest.engine" = false; # disable search engines in search bar while searching
    "browser.urlbar.suggest.quickactions" = false; # disable quick actions in search bar while searching
    "browser.urlbar.suggest.trending" = false; # disable trending search suggestions in search bar while searching
    "signon.rememberSignons" = false; # "Ask to save passwords"
    "extensions.formautofill.creditCards.enabled" = false; # "Save and fill payment methods"
    "datareporting.healthreport.uploadEnabled" = false; # "Send technical and interaction data to Mozilla"
    "datareporting.usage.uploadEnabled" = false; # "Send daily usage ping to Mozilla"
    "layout.css.prefers-color-scheme.content-override" = 0; # enable dark theme
    "browser.uiCustomization.state" = lib.importJSON ../toolbar-config.json; # UI layout theme setup
    "extensions.autoDisableScopes" = 0; # auto enable installed extensions
  };
}
