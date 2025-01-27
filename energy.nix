{...}: {
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      TLP_ENABLE = 1;

      DISK_IDLE_SECS_ON_AC = 0;
      DISK_IDLE_SECS_ON_BAT = 0;

      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";

      CPU_SCALING_MIN_FREQ_ON_AC = 4384000;
      CPU_SCALING_MAX_FREQ_ON_AC = 4384000;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      NMI_WATCHDOG = 0;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "performance";

      DISK_DEVICES = "nvme0";

      DISK_APM_LEVEL_ON_AC = "255 255";
      DISK_APM_LEVEL_ON_BAT = "128 128";

      DISK_SPINDOWN_TIMEOUT_ON_AC = "0 0";
      DISK_SPINDOWN_TIMEOUT_ON_BAT = "0 0";

      DISK_IOSCHED = "kyber";

      SATA_LINKPWR_ON_AC = "max_performance";
      SATA_LINKPWR_ON_BAT = "max_performance";

      AHCI_RUNTIME_PM_ON_AC = "auto";
      AHCI_RUNTIME_PM_ON_BAT = "auto";

      RADEON_DPM_PERF_LEVEL_ON_AC = "high";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "high";

      AMDGPU_ABM_LEVEL_ON_AC = 0;
      AMDGPU_ABM_LEVEL_ON_BAT = 4;

      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "off";

      WOL_DISABLE = "Y";

      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 0;

      SOUND_POWER_SAVE_CONTROLLER = "N";

      PCIE_ASPM_ON_AC = "performance";
      PCIE_ASPM_ON_BAT = "performance";

      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      USB_AUTOSUSPEND = 1;
    };
  };
}

