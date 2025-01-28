{...}: {
  documentation = {
    enable = true;
    dev = {
      enable = true;
    };
    doc = {
      enable = true;
    };
    info = {
      enable = true;
    };
    nixos = {
      enable = true;
    };
    man = {
      enable = true;
      generateCaches = true;
      man-db = {
        enable = true;
      };
    };
  };
}
