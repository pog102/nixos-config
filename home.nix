{ config, pkgs,  ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "chad";
  home.homeDirectory = "/home/chad";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  neovim
  firefox-wayland
  rofi-wayland
  wlsunset
  pamixer
  bash
  chafa
  neofetch
  btop
  pywal
  brillo
  pipewire
  unzip
  bat-extras.batman
  waybar
  git
# hyprland
  starship
  wl-clipboard
  foot
  dunst
  zsh
  swww
killall
mpv
papirus-icon-theme
  lsd
pfetch

      noto-fonts
      nerdfonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

#  fonts = {
#     fonts = with pkgs; [
#       noto-fonts
#       nerdfonts
#       noto-fonts-cjk
#       noto-fonts-emoji
#       font-awesome
#       source-han-sans
#       source-han-sans-japanese
#       source-han-serif-japanese
#     ];
#     fontconfig = {
#       enable = true;
#       defaultFonts = {
#               monospace = [ "Meslo LG M Regular Nerd Font Complete Mono" ];
#               serif = [ "Noto Serif" "Source Han Serif" ];
#               sansSerif = [ "Noto Sans" "Source Han Sans" ];
#       };
#     };
#   };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage

    fonts.fontconfig = {
      enable = true;
      # defaultFonts = {
      #         monospace = [ "Meslo LG M Regular Nerd Font Complete Mono" ];
      #         serif = [ "Noto Serif" "Source Han Serif" ];
      #         sansSerif = [ "Noto Sans" "Source Han Sans" ];
      # };
    };
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # settings = mergeAllAttrSets [
    #   enabledModules
    #   disabledModules
    #   {
    #     format = promptFormat;
    #     directory = {
    #       format  = "\\[[  $path](bold fg:39)\\]";
    #       truncation_length = 4;
    #       truncation_symbol = "…/";
    #     };
    #     git_branch = {
    #       format = "\\[[$symbol$branch](bold fg:40)\\]";
    #       truncation_length = 30;
    #     };
    #   }
    # ];
  };
  #  wayland.windowManager.hyprland = {
  #   # Whether to enable Hyprland wayland compositor
  #   enable = true;
  #   # The hyprland package to use
  #   package = pkgs.hyprland;
  #   # Whether to enable XWayland
  #   xwayland.enable = true;
  #
  #   # Optional
  #   # Whether to enable hyprland-session.target on hyprland startup
  #   systemd.enable = false;
  #   # Whether to enable patching wlroots for better Nvidia support
  #   enableNvidiaPatches = true;
  # };
  # ...
  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/chad/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
     EDITOR = "nvim";
    BROWSER = "firefox";
    CM_LAUNCHER = "rofi"; # Clipmenu
  };
 programs.git = {
    enable = true;
    userName  = "Ernestas Damanskis";
    userEmail = "ernestasdamanskis@gmail.com.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      n = "nvim";
      ls = "lsd";
      up = "nix-channel --update && home-manager switch";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    profileExtra = ''
    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then  Hyprland; fi
    '';
     syntaxHighlighting.enable = true;
      initExtra  = ''
      export PATH=$HOME/.bin:$PATH
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)		# Include hidden files.
      
      cat ~/.cache/wal/sequences
      autoload -U colors && colors
     '';
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
