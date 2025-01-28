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
  };
}
