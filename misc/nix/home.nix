{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.noah = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.05";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */

    dconf = {
    	enable = true;
	settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
	settings."org/gnome/desktop/interface".monospace-font-name = "JetBrainsMonoNL Nerd Font Propo Regular";
	settings."org/gnome/desktop/interface".legacy-window-title = "JetBrainsMonoNL Nerd Font Propo Regular";
	settings."org/gnome/desktop/interface".document-font-name = "JetBrainsMonoNL Nerd Font Propo Regular";
	settings."org/gnome/desktop/interface".interface-font-name = "JetBrainsMonoNL Nerd Font Propo Regular";
    };
  };

  users.users.noah = {
  	packages = with pkgs; [

		# extensions
		gnomeExtensions.privacy-settings-menu
		gnomeExtensions.desktop-icons-ng-ding
		gnomeExtensions.caffeine
		gnomeExtensions.dash-to-dock
		
		# icons and stuff
		tela-circle-icon-theme
	];
  };

  programs.dconf.profiles = {
  	user.databases = [{
		settings = with lib.gvariant; {
			"org/gnome/shell".enabled-extensions = [
				# gnome-extensions list
				"PrivacyMenu@stuarthayhurst"
				"caffeine@patapon.info"
				"dash-to-dock@micxgx.gmail.com"
				"ding@rastersoft.com"
			];

			"org/gnome/shell".favorite-apps = [
				"firefox.desktop"
				"terminator.desktop"
				"code.desktop"
				"clion.desktop"
				"goland.desktop"
				"pycharm.desktop"
				"webstorm.desktop"
				"virtualbox.desktop"
			];

			"org/gnome/desktop/interface".show-battery-percentage = true;
		};
	}];
  };
}
