{pkgs, ...}: {
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

    xdg = {
      portal = {
        enable = true;
        xdgOpenUsePortal = true;
      };
    };
  };
}
