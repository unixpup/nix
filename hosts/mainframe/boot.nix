{pkgs, ...}: {
  hardware = {
    amdgpu = {
      initrd = {
        enable = true;
      };
      opencl.enable = true;
    };
    graphics = {
      enable = true;
    };
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos;
    initrd = {
      systemd = {
        enable = true;
        dbus = {
          enable = true;
        };
        tpm2 = {
          enable = true;
        };
      };
    };
    runSize = "100%";
    devSize = "100%";
    devShmSize = "100%";
    tmp = {
      useTmpfs = true;
      tmpfsSize = "100%";
      cleanOnBoot = true;
    };
  };
}
