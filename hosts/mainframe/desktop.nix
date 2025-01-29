{pkgs, ...}: {
  programs = {
    dconf = {
      enable = true;
    };
  };
  # Enable the GNOME Desktop Environment.
  services = {
    libinput = {
      enable = true;
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
      };
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      updateDbusEnvironment = true;
    };
    gnome = {
      gnome-settings-daemon = {
        enable = true;
      };
      gnome-keyring = {
        enable = true;
      };
      glib-networking = {
        enable = true;
      };
      core-utilities = {
        enable = true;
      };
      core-shell = {
        enable = true;
      };
      core-os-services = {
        enable = true;
      };
    };
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };
}
