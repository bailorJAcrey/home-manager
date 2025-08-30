{ config, pkgs, ... }:

{
  home.username = "bailor";
  home.homeDirectory = "/home/bailor";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs.git = {
    userName = "sudonym_";
    userEmail = "bailorjacrey@gmail.com";
    extraConfig.init.defaultBranch = "main";
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "WinSur-dark-cursors";
    size = 24;
    package = pkgs.runCommand "moveUp" {} ''
      mkdir -p $out/share/icons
      ln -s ${pkgs.fetchgit {
        url = "https://github.com/yeyushengfan258/WinSur-dark-cursors.git";
        leaveDotGit = false;
        sparseCheckout = [ "dist/" ];
        hash = "sha256-bCpcvtZYng0bIEN2IiJuP0QoCDEN8XO9y+haAYoRMhc=";
      }}/dist $out/share/icons/WinSur-dark-cursors
    '';
  };

  home.packages = with pkgs; [
    rofi-wayland
    ripgrep
    fzf
    fastfetch
    lazygit
    gum
    ags
    neovide
    zathura
    mpv
    gcc
    firefox
    bat
    todoist
    swww
    jq
    obsidian
    nix-search-cli
    brightnessctl
    grim
    slurp
    wf-recorder
    dunst
    libnotify
    luajit
    lua-language-server
    feh
    nautilus
    blender

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
