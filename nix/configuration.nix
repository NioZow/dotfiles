# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.grub = {
	enable = true;
	useOSProber = true;
	# device = "/dev/nvme0n1";
	devices = [ "nodev" ];
	efiSupport = true;
  };

  boot.loader.efi = {
	canTouchEfiVariables = true;	
	# efiSysMountPoint = "/boot/efi";
  };


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # NOPASSWD on sudo for me
  security.sudo.wheelNeedsPassword = false;

  # virtualbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;
  users.extraGroups.vboxusers.members = [ "noah" ];

  # fonts
  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "FiraCode" "IosevkaTerm" "JetBrainsMono" "Terminus" "CascadiaCode" ]; })
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with 'password'.
  users.users.noah = {
    isNormalUser = true;
    description = "noah";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [

      # utilities
      firefox
      keepassxc
      discord

      # programming
      jetbrains.pycharm-professional
      jetbrains.webstorm
      jetbrains.clion
      jetbrains.goland
      vscode

      # gnome
      pkgs.gnome3.gnome-tweaks
      gnome-browser-connector
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    docker-compose
    git

    # terminal utilities
    vim
    terminator
    neovim
    tmux
    fish
    neofetch
    unzip

    # misc
    gcc
    glibc
    go
    nodejs_21
    cmake
    nasm
    st
    bear
    python311Packages.pip
    bat
    eza
    powershell
    rocmPackages.llvm.clang
    sqlite
    mariadb
    inetutils
    openvpn
    xclip
    sshpass
  ];

  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
   	# x86_64-w64-mingw32
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
