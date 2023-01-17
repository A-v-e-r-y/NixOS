{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jgd";
  home.homeDirectory = "/home/jgd";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # remove all but five most recent generations
  home.activation = {
    removeOldGens = lib.hm.dag.entryAfter ["writeBoundary"] ''
      nix-env -p /nix/var/nix/profiles/per-user/jgd/home-manager --delete-generations +5
      nix-collect-garbage
    '';
  };

  home.packages = [
    pkgs.git
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "Inconsolata Nerd Font Mono";
      colors = {
	primary = {
  	  background = "#2e3440";
  	  foreground = "#d8dee9";
  	  dim_foreground = "#a5abb6";
  	};
  	cursor = {
  	  text = "#2e3440";
  	  cursor = "#d8dee9";
  	};
  	vi_mode_cursor = {
  	  text = "#2e3440";
  	  cursor = "#d8dee9";
  	};
  	selection = {
  	  text = "CellForeground";
  	  background = "#4c566a";
  	};
  	search = {
  	  matches = {
  	    foreground = "CellBackground";
  	    background = "#88c0d0";
  	  };
  	  footer_bar = {
  	    background = "#434c5e";
  	    foreground = "#d8dee9";
  	  };
  	};
  	normal = {
  	  black = "#3b4252";
  	  red = "#bf616a";
  	  green = "#a3be8c";
  	  yellow = "#ebcb8b";
  	  blue = "#81a1c1";
  	  magenta = "#b48ead";
  	  cyan = "#88c0d0";
  	  white = "#e5e9f0";
  	};
  	bright = {
  	  black = "#4c566a";
  	  red = "#bf616a";
  	  green = "#a3be8c";
  	  yellow = "#ebcb8b";
  	  blue = "#81a1c1";
  	  magenta = "#b48ead";
  	  cyan = "#8fbcbb";
  	  white = "#eceff4";
  	};
  	dim = {
  	  black = "#373e4d";
  	  red = "#94545d";
  	  green = "#809575";
  	  yellow = "#b29e75";
  	  blue = "#68809a";
  	  magenta = "#8c738c";
  	  cyan = "#6d96a5";
  	  white = "#aeb3bb";
  	};
      };
    };
  };
}
