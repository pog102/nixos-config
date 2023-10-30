# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# { config, pkgs, lib, outputs, ... }:
{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./modules/zsh.nix
      inputs.home-manager.nixosModules.home-manager
      # ./modules/pywal.nix
      # ./modules/udev.nix
    ];
  
  programs.zsh.enable = true;
networking.wireless.iwd.enable = true;
  # networking.networkmanager.enable = true;
  services.getty.autologinUser = "chad";
  
  users.users.chad = {
    isNormalUser = true;
    description = "USRER chad";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video" "iwd" ];
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
     users.chad = import ./home.nix;
  };
  # Bootloader.

# power management
services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;
      };
};


specialisation = { 
   nvidia.configuration = { 
     # Nvidia Configuration 
  
     # Optionally, you may need to select the appropriate driver version for your specific GPU. 
     hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; 
  
     # nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway 
  
     hardware.nvidia.prime = { 
       sync.enable = true; 
  

		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
     };
  };
};


 boot = {
       loader.systemd-boot.enable = true;
       loader.systemd-boot.configurationLimit = 3;
       loader.efi.canTouchEfiVariables = true;
   };
#
#  boot.loader = {
#  efi = {
#    canTouchEfiVariables = true;
#    efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
#  };
#  grub = {
#    enable = true;
#    useOSProber = true;
#    # version = 2;
#    # efiInstallAsRemovable = true;
#     efiSupport = true;
#     #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
#     device = "nodev";
#   # configurationLimit = 3;
#  };
#};
#networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
networking.hostName = "EpicOs"; # Define your hostname.
#
#   # Configure network proxy if necessary
#   # networking.proxy.default = "http://user:password@proxy:port/";
#   # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
#
#   # Enable networking
#
#   # Set your time zone.
  time.timeZone = "Europe/Vilnius";
#
#   # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
#
#   # Configure keymap in X11
  services.xserver = {
    layout = "us";
    videoDrivers = ["nvidia"];
    xkbVariant = "";
  };
#
#   # Define a user account. Don't forget to set a password with ‘passwd’.
#   users.users.chad = {
#     isNormalUser = true;
#     description = "chad";
#     extraGroups = [ "networkmanager" "wheel" "video" ];
#     packages = with pkgs; [];
#   };
#   # Enable automatic login for the user.
#
#   # Allow unfree packages
nixpkgs.config.allowUnfree = true;
#
#   # List packages installed in system profile. To search, run:
#   # $ nix search wget
# # waybar
  environment.systemPackages = with pkgs; [
#   #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#   #  wget
#   neovim
   home-manager
#   btop
hyprland
steam
# plymouth
#   pamixer
#   zsh
#   neofetch
#   foot
#   git
#   rofi-wayland
#   lsd
#   starship
#   libnotify
#   wlsunset
#   dunst
#   pywal
#   firefox-wayland
#   swww
#   chafa
#        wl-clipboard
#   brillo
#   unzip
# pipewire
# bat-extras.batman
# killall
#
# (waybar.overrideAttrs (oldAttrs: {
#   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
#   })
# )
   ];
#
#
#
 # nixpkgs.config.allowUnfreePredicate = pkg:
 #    builtins.elem (lib.getName pkg) [
 #      "nvidia-x11"
 #      # "steam"
 #      # "steam-original"
 #      # "steam-run"
 #    ];

programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};

hardware = {
  nvidia = {

  modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  open = true;
    nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

  };

  opengl = {
    enable = true;
      driSupport = true;

    driSupport32Bit = true;

  };
    brillo.enable = true;
};
#
#
#
# xdg.portal = {
# enable = true;
# extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
# };
#
sound.enable = true;
security.rtkit.enable = true;
#
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;
};
#
#   # Some programs need SUID wrappers, can be configured further or are
#   # started in user sessions.
#   # programs.mtr.enable = true;
#   # programs.gnupg.agent = {
#   #   enable = true;
#   #   enableSSHSupport = true;
#   # };
#
#   # List services that you want to enable:
#
#   # Enable the OpenSSH daemon.
#   # services.openssh.enable = true;
#
#   # Open ports in the firewall.
#   # networking.firewall.allowedTCPPorts = [ ... ];
#   # networking.firewall.allowedUDPPorts = [ ... ];
#   # Or disable the firewall altogether.
#   # networking.firewall.enable = false;
#
#   # This value determines the NixOS release from which the default
#   # settings for stateful data, like file locations and database versions
#   # on your system were taken. It‘s perfectly fine and recommended to leave
#   # this value at the release version of the first install of this system.
#   # Before changing this value read the documentation for this option
#   # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
#   #

  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 2d";
  };
#
#   environment.variables = {
#     # Preferred applications
#     EDITOR = "nvim";
#     BROWSER = "firefox";
#     CM_LAUNCHER = "rofi"; # Clipmenu
#   };
#       # upower.enable = true;
#   # System Upgrades
  # system.autoUpgrade.enable = true;
#  system.autoUpgrade.allowReboot = true;
#
  system.stateVersion = "23.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
#
# # raw config files
# # home.file.".config".source = ./configs;
#

}
