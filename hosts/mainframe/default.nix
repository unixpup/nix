# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./boot.nix
    ./system.nix
    ./fonts.nix
    ./networking.nix
    ./sound.nix
    ./energy.nix
    ./ssh.nix
    ./security.nix
    ./shell.nix
    ./docs.nix
  ];

  networking.hostName = "mainframe";

  nix.gc = {
    automatic = true;
    options = "-d";
  };

  nix.optimise.automatic = true;

  nix.settings = {
    experimental-features = "cgroups dynamic-derivations flakes nix-command recursive-nix";
    auto-optimise-store = true;
    http-connections = 0;
    download-buffer-size = 671088640;
    max-jobs = "auto";
    sync-before-registering = true;
    use-cgroups = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Montevideo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.dbus = {
    implementation = "broker";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
    updateDbusEnvironment = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.unix = {
    isNormalUser = true;
    extraGroups = ["users" "wheel" "video" "audio" "input"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      spotify
      vesktop
      fastfetch
      btop-rocm
      flatpak
      gnome-software
    ];
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alejandra
    pre-commit
    fzf
    ffmpeg-full
    neovim
    git
    wget2
    cmake
    gnumake
    ninja
    meson
    python313
    obs-studio
    libtool
    gnome-keyring
    seahorse
    pavucontrol
    luarocks
    pulseaudio
    man-pages
    man-pages-posix
    llvmPackages_19.libcxxClang
    llvmPackages_19.clangUseLLVM
    llvmPackages_19.clang-tools
    llvmPackages_19.clang-manpages
    llvmPackages_19.openmp
    nodePackages_latest.nodejs
    nodePackages_latest.pnpm
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
