{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd = {
    oomd = {
      enable = true;
      enableRootSlice = true;
      enableSystemSlice = true;
      enableUserSlices = true;
    };
  };

  system = {
    switch = {
      enable = true;
      enableNg = true;
    };
    rebuild = {
      enableNg = true;
    };
  };
  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 100;
  };
  nix = {
    enable = true;
  };
}
