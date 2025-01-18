{ ... }:

{
  programs.newsboat = {
    enable = true;
    browser = "qutebrowser";
    autoReload = true;
    reloadThreads = 8;
    extraConfig = ''
      color background         default   default
      color listnormal         color8    default
      color listnormal_unread  default   default
      color listfocus          yellow    default bold
      color listfocus_unread   yellow    default bold
      color info               green     default bold
      color article            default   default
      highlight article "^Feed:.*"                        cyan  default
      highlight article "^Title:.*"                       yellow default bold
      highlight article "^Author:.*"                      magenta default
      highlight article "^Link:.*"                        blue  default
      highlight article "^Links:.*"                       blue  default
      highlight article "\\[[0-9]\\]:.*"                  yellow   default bold
      highlight article "^Podcast Download URL:.*"        blue  default
      highlight article "^\\[image.*"                     cyan  default
      highlight article "\\ \\[image*\\]\\ "              cyan  default
      highlight article "^https://.*"                     blue  default
      highlight article "^http://.*"                      blue  default
      highlight article "^Date:.*"                        green  default
      highlight article "\\*\ "                           magenta  default bold
      highlight article "\\[0-9]\\.\ "                    magenta  default bold
      highlight article "\\[[0-9][0-9]\\]:.*"             yellow   default bold
      highlight article "\\[[0-9]\\+\\]"                  yellow   default bold
      highlight article "\\[[^0-9].*[0-9]\\+\\]"          magenta  default bold

      show-read-articles yes
      show-read-feeds yes

      articlelist-format " %D | %?T? %-17T | ?%t"
      feedlist-format    " %11u | %t"

      macro v set browser "setsid -f mpv --really-quiet --no-terminal" ; open-in-browser ; set browser firefox
      player "mpv"

      bind-key RIGHT open
      bind-key LEFT quit

      macro s set show-read-articles yes; set show-read-feeds yes; reload
      macro h set show-read-articles no; set show-read-feeds no; reload

      bind-key r toggle-article-read

      bind-key l open
      bind-key j down
      bind-key k up
      bind-key h quit
    '';
    urls = [
      { url = ''"query:Youtube:tags # \"Youtube\""''; }
      { url = ''"query:Odysee:tags # \"Odysee\""''; }
      { url = ''"query:Blog:tags # \"Blog\""''; }
      { url = ''"query:News:tags # \"News\""''; }
      # { url = "http://localhost:8000/feed"; } # Personal feed check for later

      { url = "https://distrowatch.com/news/dw.xml"; title = "Distro Watch"; }
      { url = "http://fitgirl-repacks.site/feed/"; title = "Fitgirl Repacks"; }

      #Videos
      ##Youtube
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ";
        tags = [ "Youtube" ];
        title = "Veronica Explains";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR-DXc1voovS8nhAvccRZhg";
        tags = [ "Youtube" ];
        title = "Jeff Geerling";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";
        tags = [
          "Youtube"
          "Programming"
        ];
        title = "No Boilerplate";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqJ-Xo29CKyLTjn6z2XwYAw";
        tags = [ "Youtube" ];
        title = "Game Maker's Toolkit";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCbfg3_hFrOxuEtYMRGsp1ig";
        tags = [ "Youtube" ];
      }

      # Odysee
      {
        url = "https://odysee.com/$/rss/@SomeOrdinaryGamers:a";
        tags = [ "Odysee" ];
        title = "Mutahar";
      }
      {
        url = "https://odysee.com/$/rss/@fireship:6";
        tags = [ "Odysee" ];
        title = "Fireship";
      }

      # News

      # Blog
      {
        url = "https://www.krooxworld.com/rss";
        tags = [ "Blog" ];
      }
      {
        url = "https://moskas.github.io/feed";
        tags = [ "Blog" ];
      }
      {
        url = "https://myme.no/atom-feed.xml";
        tags = [
          "Linux"
          "Tech"
          "Blog"
        ];
      }
      {
        url = "https://irreal.org/blog/?feed=rss2";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://taonaw.com/feed.xml";
        tags = [
          "Tech"
          "Privacy"
          "Blog"
        ];
      }
      {
        url = "https://anniemueller.com/posts_feed";
        tags = [
          "Blog"
        ];
      }
      {
        url = "https://patrickrhone.micro.blog/feed.xml";
        tags = [
          "Blog"
        ];
      }
      {
        url = "https://mbork.pl/?action=rss;days=30;all=0;showedit=0;full=1";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://morss.it/https://planet.emacslife.com/atom.xml";
        tags = [
          "Tech"
          "Emacs"
          "Blog"
        ];
      }
      {
        url = "https://planet.clojure.in/atom.xml";
        tags = [
          "Tech"
          "Programming"
          "Blog"
        ];
      }
      {
        url = "https://xeiaso.net/blog.rss";
        tags = [
          "Tech"
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://0xda.de/blog/index.xml";
        tags = [
          "Nix"
          "Tech"
          "Blog"
        ];
      }
      {
        url = "https://xn--gckvb8fzb.com/index.xml";
        tags = [
          "Tech"
          "Linux"
          "Privacy"
          "Blog"
        ];
      }
      {
        url = "https://journal.miso.town/atom?url=https://wiki.xxiivv.com/site/now.html";
        tags = [ "Blog" ];
        title = "xxiivv";
      }
      {
        url = "https://100r.co/links/rss.xml";
        tags = [ "Blog" ];
      }
      {
        url = "https://grimgrains.com/links/rss.xml";
        tags = [ "Cooking" ];
      }
      {
        url = "https://determinate.systems/rss.xml";
        tags = [
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://thewagner.net/feeds/all.atom.xml";
        tags = [
          "Nix"
          "Programming"
          "Homelab"
          "Blog"
        ];
      }
      {
        url = "https://morss.it/https://jnsgr.uk/posts/index.xml";
        tags = [
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://morss.it/https://nixcademy.com/feed";
        tags = [
          "Nix"
          "Blog"
        ];
      }
      {
        url = "https://itsfoss.com/rss/";
        tags = [
          "Blog"
          "Linux"
        ];
      }
      {
        url = "https://morss.it/https://ziglang.org/news/index.xml";
        tags = [
          "Blog"
          "Programming"
        ];
      }
      {
        url = "https://blog.rust-lang.org/feed.xml";
        tags = [
          "Blog"
          "Programming"
        ];
      }
      {
        url = "https://thelinuxexp.com/feed.xml";
        tags = [
          "Blog"
          "Linux"
        ];
      }
      {
        url = "https://thelinuxcast.org/feed/feed.xml";
        tags = [
          "Blog"
          "Linux"
        ];
      }
      {
        url = "https://michal.sapka.me/index.xml";
        title = "Michal Sapka";
        tags = [
          "Blog"
          "BSD"
        ];
      }
      {
        url = "https://morss.it/https://izder456.tumblr.com/rss";
        tags = [
          "BSD"
          "Blog"
        ];
      }
      {
        url = "https://morss.it/https://fabiensanglard.net/rss.xml";
        tags = [
          "Blog"
          "Linux"
          "Tech"
        ];
      }
      {
        url = "https://zettelkasten.de/feed.atom";
        tags = [
          "Blog"
          "Notes"
        ];
      }
      {
        url = "https://blog.phundrak.com/index.xml";
        tags = [
          "Blog"
          "Tech"
          "Emacs"
        ];
      }
      {
        url = "https://vermaden.wordpress.com/feed";
        tags = [
          "Blog"
          "Tech"
          "BSD"
        ];
        title = "vermaden";
      }
      {
        url = "https://morss.it/https://fasterthanli.me/index.xml";
        tags = [
          "Blog"
          "Tech"
          "Programming"
        ];
      }
      {
        url = "https://jcs.org/rss";
        title = "jcs";
        tags = [
          "Blog"
          "BSD"
          "Retro"
          "Programming"
        ];
      }
      {
        url = "https://programmershideaway.xyz/atom.xml";
        tags = [
          "Blog"
          "Programming"
        ];
      }
      {
        url = "https://morss.it/https://www.jeffgeerling.com/blog.xml";
        tags = [
          "Blog"
          "Tech"
        ];
      }
      {
        url = "https://ploum.net/atom_en.xml";
        tags = [ "Blog" ];
      }
      {
        url = "https://haseebmajid.dev/posts/index.xml";
        tags = [
          "Blog"
          "Nix"
        ];
      }
      {
        url = "https://heywoodlh.io/feed.xml";
        tags = [
          "Blog"
          "Nix"
        ];
      }
      {
        url = "http://dorotac.eu/atom.xml";
        tags = [
          "Blog"
          "Tech"
        ];
      }
      {
        url = "https://morss.it/https://signal.org/blog/rss.xml";
        tags = [
          "Blog"
          "Privacy"
        ];
      }

      # Updates
      {
        url = "https://github.com/NixOS/nixpkgs/commits/master.atom";
        tags = [ "Updates" ];
        title = "nixpkgs";
      }

      #News
      {
        url = "https://morss.it/https://www.theregister.com/headlines.atom";
        tags = [ "News" "Tech" ];
      }
      {
        url = "https://rachelbythebay.com/w/atom.xml";
        tags = [ "Blog" ];
      }
    ];
  };
}
