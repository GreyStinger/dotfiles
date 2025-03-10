{ config, pkgs, nurPkgs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  addons = nurPkgs.repos.rycee.firefox-addons;
in {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    profiles.${config.home.username} = {
      userChrome = ''
        /* hides the native tabs */
        #TabsToolbar {
          visibility: collapse !important;
        }
        /* hides the title bar */
        /* #titlebar {
          visibility: collapse;
        } */
        /* hides the sidebar */
        /* #sidebar-header {
          visibility: collapse !important;
        } */
        /* leaves space for the window buttons */
        /* #nav-bar {
          margin-top: -8px;
          margin-right: 74px;
          margin-bottom: -4px;
        } */
        /* Hide tab bar in FF Quantum
        @-moz-document url(chrome://browser/content/browser.xul), url(chrome://browser/content/browser.xhtml) {
          #TabsToolbar {
            visibility: collapse !important;
            margin-bottom: 21px !important;
          }

          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
            visibility: collapse !important;
          }
        }
        */
      '';
      extensions.packages = [
        addons.ublock-origin
        addons.sponsorblock
        addons.privacy-badger
        addons.darkreader
        addons.stylus
        addons.firefox-color
        addons.bionic-reader
        addons.w2g
        addons.tree-style-tab
      ];
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab"; # "always", "never" or "newtab"
      DisplayMenuBar =
        "default-off"; # "always", "never", "default-off" or "default-on"
      SearchBar = "separate"; # "separate" or "unified"

      Preferences = {
        "browser.contentblocking.category" = {
          Value = "strict";
          Status = "locked";
        };
        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshots.disabled" = lock-true;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.formfill.enable" = lock-false;
        "browser.search.suggest.enabled" = lock-false;
        "browser.search.suggest.enabled.private" = lock-false;
        "browser.urlbar.suggest.searches" = lock-false;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" =
          lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" =
          lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" =
          lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" =
          lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" =
          lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "privacy.resistFingerprinting" = lock-true;
        "privacy.trackingProtection.enabled" = lock-true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = lock-true;
        "network.cookie.cookieBehavior" = 1; # Block third-party cookies
        "network.http.referer.XOriginPolicy" = 2;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "browser.send_pings" = lock-false;
        "browser.urlbar.speculativeConnect.enabled" = lock-false;
        "network.dns.disablePrefetch" = lock-true;
        "network.prefetch-next" = lock-false;
        "media.peerconnection.enabled" = lock-false; # Disable WebRTC
        "network.trr.mode" = 2; # Enable DNS over HTTPS
        "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
      };
    };
  };
}

