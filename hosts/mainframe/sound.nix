{...}: {
  services.pipewire = {
    enable = true;
    wireplumber = {
      enable = true;
    };
    jack = {
      enable = true;
    };
    pulse = {
      enable = true;
    };
    alsa = {
      enable = true;
      support32Bit = true;
    };
    extraConfig.client.quality = {
      "context.properties" = {
        "mem.allow-mlock" = true;
        "mem.mlock-all" = true;
        "log.level" = 0;
      };
      "stream" = {
        "properties" = {
          "node.latency" = "512/48000";
          "node.autoconnect" = true;
          "resample.quality" = 14;
          "channelmix.normalize" = true;
        };
      };
    };
    extraConfig.client-rt.quality = {
      "context.properties" = {
        "mem.allow-mlock" = true;
        "mem.mlock-all" = true;
        "log.level" = 0;
      };
      "stream" = {
        "properties" = {
          "node.autoconnect" = true;
          "resample.quality" = 14;
          "channelmix.normalize" = true;
        };
      };
    };
    extraConfig.pipewire-pulse.quality = {
      "context.properties" = {
        "mem.allow-mlock" = true;
        "mem.mlock-all" = true;
        "modules" = [
          {
            "name" = "libpipewire-module-rt";
            "args" = {
              "nice.level" = -11;
              "rt.prio" = 80;
              "rt.time.soft" = -1;
              "rt.time.hard" = -1;
              "uclamp.min" = 0;
              "uclamp.max" = 2048;
            };
            "flags" = ["ifexists" "nofail"];
          }
        ];
        "stream.properties" = {
          "node.autoconnect" = true;
          "resample.quality" = 14;
          "channelmix.normalize" = true;
        };
      };
    };
    extraConfig.pipewire.quality = {
      "context.properties" = {
        "library.name.system" = "support/libspa-support";
        "context.data-loop.library.name.system" = "support/libspa-support";
        "support.dbus" = true;
        "link.max-buffers" = 64;
        "mem.allow-mlock" = true;
        "mem.mlock-all" = true;
        "clock.power-of-two-quantum" = true;
        "cpu.zero.denormals" = true;
        "loop.rt-prio" = -1;
        "loop.class" = "data.rt";
        "context.num-data-loops" = -1;
        "context.data-loops" = [
          {
            "loop.rt-prio" = -1;
            "loop.class" = ["data.rt" "audio.rt"];
            "library.name.system" = "support/libspa-support";
            "thread.name" = "data-loop.0";
          }
        ];
        "core.daemon" = true;
        "core.name" = "pipewire-0";
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [48000];
        "module.x11.bell" = true;
        "module.access" = true;
        "module.jackdbus-detect" = true;
        "modules" = [
          {
            "name" = "libpipewire-module-rt";
            "args" = {
              "nice.level" = -11;
              "rt.prio" = 80;
              "rt.time.soft" = -1;
              "rt.time.hard" = -1;
              "uclamp.min" = 0;
              "uclamp.max" = 2048;
            };
            "flags" = ["ifexists" "nofail"];
          }
          {
            "name" = "libpipewire-module-protocol-native";
            "args" = {
              "sockets" = [
                {
                  "name" = "pipewire-0";
                }
                {
                  "name" = "pipewire-0-manager";
                }
              ];
            };
          }
          {
            "name" = "libpipewire-module-portal";
            "flags" = ["ifexists" "nofail"];
          }
        ];
      };
    };
  };
}
