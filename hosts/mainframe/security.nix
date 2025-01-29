{...}: {
  security = {
    tpm2 = {
      enable = true;
    }; # Having TPM2 is nice.
    polkit = {
      enable = true;
    };
    protectKernelImage = true;
    forcePageTableIsolation = true;
    sudo-rs = {
      enable = true;
    };
    dhparams = {
      enable = true;
      defaultBitSize = 4096;
    };
    rtkit = {
      enable = true;
    };
  };
}
