{ config, pkgs, ... }:

{
  home.stateVersion = "23.05";
  programs.firefox = {
    enable = true;
    # Handled by the Homebrew module
    # This populates a dummy package to satsify the requirement
    package = pkgs.runCommand "firefox-0.0.0" { } "mkdir $out";
    profiles.default = {
      search.force = true; # This is required so the build won't fail each time
      # View extensions here: https://github.com/nix-community/nur-combined/blob/master/repos/rycee/pkgs/firefox-addons/generated-firefox-addons.nix
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        darkreader
        firenvim
        gnome-shell-integration
        privacy-badger
        private-relay
        redirector
        ublock-origin
        vimium
      ]; 
      userChrome = ''
        /* * Do not remove the @namespace line -- it's required for correct functioning */
        /* set default namespace to XUL */
        @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

        /* Remove Back button when there's nothing to go Back to */
        #back-button[disabled="true"] { display: none; }

        /* Remove Forward button when there's nothing to go Forward to */
        #forward-button[disabled="true"] { display: none; }

        /* Remove Home button (never use it) */
        #home-button { display: none; }

        .titlebar-spacer {
	    display: none !important;
        }
      
        /* Remove import bookmarks button */ 
        #import-button {
          display: none;
        } 
        
        /* Remove bookmark toolbar */
        toolbarbutton.bookmark-item:not(.subviewbutton) {
          display: none;
        }

        /* Remove whitespace in toolbar */
        #nav-bar toolbarpaletteitem[id^="wrapper-customizableui-special-spring"], #nav-bar toolbarspring {
          display: none;
        }

        /* Hide dumb Firefox View button */
        #firefox-view-button {
          visibility: hidden;
        }

        /* Hide Firefox tab icon */
        .tab-icon-image {
          display: none;
        } 
      '';
      isDefault = true;
      name = "default";
      settings = {
        "app.shield.optoutstudies.enabled" = false;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.compactmode.show" = true;
        "browser.formfill.enable" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "duckduckgo";
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.search.isUS" = true;
        "browser.search.suggest.enabled" = false;
        "browser.tabs.drawInTitlebar" = true;
        "browser.urlbar.quicksuggest.scenario" = "offline";
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.topsites" = false;
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.showHome" = false;
        "extensions.webextensions.restrictedDomains" = "";
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "network.allow-experiments" = false;
        "signon.rememberSignons" = false;
        "signon.rememberSignons.visibilityToggle" = false;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
      };
    };
  }; 
  # End Firefox config
}
