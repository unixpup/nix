# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./boot.nix
    ./system.nix
    ./fonts.nix
    ./networking.nix
    ./sound.nix
    ./desktop.nix
    ./energy.nix
    ./ssh.nix
    ./security.nix
    ./shell.nix
    ./docs.nix
    ./flatpak.nix
    ./sysctl.nix
    ./users.nix
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

  # Set your time zone.
  time.timeZone = "America/Montevideo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
    earlySetup = true;
  };

  services.dbus = {
    implementation = "broker";
  };

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ripgrep
    fd
    unzip
    alejandra
    pre-commit
    fzf
    ffmpeg-full
    neovim
    git
    wget2
    wget
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
    llvmPackages.libcxxClang
    llvmPackages.compiler-rt
    llvmPackages.bintools
    llvmPackages.clangUseLLVM
    llvmPackages.clang-tools
    llvmPackages.clang-manpages
    llvmPackages.openmp
    llvmPackages.mlir
    llvmPackages.lldb-manpages
    llvmPackages.libunwind
    llvmPackages.stdenv
    llvmPackages.libcxxStdenv
    lldb
    nodePackages_latest.nodejs
    nodePackages_latest.pnpm
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
