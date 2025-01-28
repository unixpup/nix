{pkgs, ...}: {
  services.btrfs.autoScrub = {
    fileSystems = ["/"]; # Assuming root is formatted with Btrfs.
    interval = "daily";
    enable = true;
  };

  hardware = {
    cpu.amd = {
      sev.enable = true;
      updateMicrocode = true;
      ryzen-smu.enable = true;
    };
    cpu.x86.msr.enable = true;
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
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    plymouth = {
      enable = true;
      theme = "tribar";
    };

    kernelParams = [
      "default_hugepagesz=1G"
      "hugepagesz=1G"
      "slab_nomerge"
      "init_on_alloc=1"
      "randomize_kstack_offset=on"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "pti=on"
      "vsyscall=none"
      "oops=panic"
      "module.sig_enforce=1"
      "mce=0"
      "quiet"
      "splash"
      "loglevel=0"
    ];
    kernelPackages = pkgs.linuxPackages_cachyos;
    initrd = {
      kernelModules = ["amdgpu" "sha256" "sha512" "crypto"];
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
