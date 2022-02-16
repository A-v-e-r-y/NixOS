{ config, pkgs, ... }:

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
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.dwm
    pkgs.alacritty
  ];

  programs.alacritty = {
    enable = true;
    #settings = {
    #  font = {

    #    normal = {
    #      family = "Hurmit Nerd Font Mono";
    #      style = "medium";
    #    };

    #    bold = {
    #      family = "Hurmit Nerf Font Mono";
    #      style = "bold";
    #    };

    #      size = "10";
    #  };
    #};
  };

  nixpkgs.overlays =  [
    (self: super: {
      # dwm overlay for config.h
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
      patches = [
        #/home/jgd/.config/dwm/dwm-autoresize-20160718-56a31dc.diff
        #/home/jgd/.config/dwm/dwm-activetagindicatorbar-6.2.diff
	  ];
        configFile = super.writeText "config.h" (builtins.readFile /home/jgd/.config/dwm/config.h);
	postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config.h...'\n cp ${configFile} config.def.h";
      });
    })
  ];

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set nocompatible
      set number
      set tabstop=4
      colorscheme nord
      nnoremap <S-Tab> :tabn<CR>
      let g:airline_powerline_fonts = 1
    '';
	plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
	  nord-vim
	];
  };
}
