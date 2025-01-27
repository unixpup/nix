{...}: {
  security.rtkit.enable = true;
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
    extraConfig.client."quality" = {
      "context" = {
        "properties" = {
          "mem.allow-mlock" = true;
          "mem.mlock-all" = true;
          "log.level" = 0;
        };
        "spa-libs" = {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "support.*" = "support/libspa-support";
        };
        "modules" = [
          {"name" = "libpipewire-module-protocol-native";}
          {"name" = "libpipewire-module-client-node";}
          {"name" = "libpipewire-module-client-device";}
          {"name" = "libpipewire-module-adapter";}
          {"name" = "libpipewire-module-metadata";}
          {"name" = "libpipewire-module-session-manager";}
        ];
      };
      "filter" = {
        "properties" = {
          "node.latency" = "2048/192000";
        };
      };
      "stream" = {
        "properties" = {
          "node.latency" = "2048/192000";
          "node.autoconnect" = true;
          "resample.quality" = 14;
          "channelmix.normalize" = true;
        };
      };
    };
    extraConfig.client-rt."quality" = {
      "context" = {
        "properties" = {
          "mem.allow-mlock" = true;
          "mem.mlock-all" = true;
          "log.level" = 0;
        };
        "spa-libs" = {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "support.*" = "support/libspa-support";
        };
        "modules" = [
          {
            "name" = "libpipewire-module-rt";
            "args" = {
              "rt.prio" = 80;
              "rt.time.soft" = -1;
              "rt.time.hard" = -1;
            };
            "flags" = ["ifexists" "nofail"];
          }
          {"name" = "libpipewire-module-protocol-native";}
          {"name" = "libpipewire-module-client-node";}
          {"name" = "libpipewire-module-client-device";}
          {"name" = "libpipewire-module-adapter";}
          {"name" = "libpipewire-module-metadata";}
          {"name" = "libpipewire-module-session-manager";}
        ];
      };
      "filter" = {
        "properties" = {
          "node.latency" = "2048/192000";
        };
      };
      "stream" = {
        "properties" = {
          "node.latency" = "2048/192000";
          "node.autoconnect" = true;
          "resample.quality" = 14;
          "channelmix.normalize" = true;
        };
        "rules" = [
          {
            "matches" = [
              {
                "application.name" = "pw-cat";
                "node.name" = "~Google Chrome$";
              }
            ];
            "actions" = {
              "update-props" = {
                "node.latency" = "512/192000";
              };
            };
          }
        ];
      };
      "alsa" = {
        "properties" = {
          "alsa.volume-method" = "cubic";
        };
        "rules" = [
          {
            "matches" = [
              {
                "application.process.binary" = "resolve";
              }
            ];
            "actions" = {
              "update-props" = {
                "alsa.buffer-bytes" = 131072;
              };
            };
          }
        ];
      };
    };

    extraConfig.pipewire-pulse."quality" = {
      "context" = {
        "properties" = {
          "mem.allow-mlock" = true;
          "mem.mlock-all" = true;
        };
        "spa-libs" = {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "support.*" = "support/libspa-support";
        };
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
          }
          {
            "name" = "libpipewire-module-client-node";
          }
          {
            "name" = "libpipewire-module-adapter";
          }
          {
            "name" = "libpipewire-module-metadata";
          }
          {
            "name" = "libpipewire-module-protocol-pulse";
            "args" = {};
          }
        ];
        "exec" = [
          {
            "path" = "pactl";
            "args" = "load-module module-always-sink";
          }
        ];
        "pulse" = {
          "cmd" = [
            {
              "cmd" = "load-module";
              "args" = "module-always-sink";
              "flags" = [];
            }
            {
              "cmd" = "load-module";
              "args" = "module-device-manager";
              "flags" = [];
            }
            {
              "cmd" = "load-module";
              "args" = "module-device-restore";
              "flags" = [];
            }
            {
              "cmd" = "load-module";
              "args" = "module-stream-restore";
              "flags" = [];
            }
            {
              "cmd" = "load-module";
              "args" = "module-switch-on-connect";
            }
            {
              "cmd" = "load-module";
              "args" = "module-gsettings";
              "flags" = ["nofail"];
            }
          ];
          "properties" = {
            "server.address" = [
              "unix =native"
            ];
            "server.dbus-name" = "org.pulseaudio.Server";
            "pulse.allow-module-loading" = true;
            "pulse.default.format" = "F32";
          };
        };
        "stream.properties" = {
          "node.autoconnect" = true;
          "resample.quality" = 14;
          "channelmix.normalize" = true;
        };
      };
    };
    extraConfig.pipewire."quality" = {
      "context" = {
        "properties" = {
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
          "default.clock.rate" = 192000;
          "default.clock.allowed-rates" = [192000];
          "module.x11.bell" = true;
          "module.access" = true;
          "module.jackdbus-detect" = true;
        };
        "properties.rules" = [
          {
            "matches" = [
              {
                "cpu.vm.name" = "!null";
              }
            ];
            "actions" = {
              "update-props" = {
                "default.clock.min-quantum" = 2048;
              };
            };
          }
        ];
        "spa-libs" = {
          "audio.convert.*" = "audioconvert/libspa-audioconvert";
          "avb.*" = "avb/libspa-avb";
          "api.alsa.*" = "alsa/libspa-alsa";
          "api.v4l2.*" = "v4l2/libspa-v4l2";
          "api.libcamera.*" = "libcamera/libspa-libcamera";
          "api.bluez5.*" = "bluez5/libspa-bluez5";
          "api.vulkan.*" = "vulkan/libspa-vulkan";
          "api.jack.*" = "jack/libspa-jack";
          "support.*" = "support/libspa-support";
          "video.convert.*" = "videoconvert/libspa-videoconvert";
        };
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
          {
            "name" = "libpipewire-module-access";
            "args" = {
              "access.socket" = {
                "pipewire-0" = "default";
                "pipewire-0-manager" = "unrestricted";
              };
            };
            "condition" = [
              {
                "module.access" = true;
              }
            ];
          }
          {
            "name" = "libpipewire-module-x11-bell";
            "args" = {
              "sink.name" = "@DEFAULT_SINK@";
              "sample.name" = "bell-window-system";
              "x11.display" = null;
              "x11.xauthority" = null;
            };
            "flags" = ["ifexists" "nofail"];
            "condition" = [
              {
                "module.x11.bell" = true;
              }
            ];
          }
          {
            "name" = "libpipewire-module-jackdbus-detect";
            "args" = {
              "source.props" = {};
              "sink.props" = {};
            };
            "flags" = ["ifexists" "nofail"];
            "condition" = [
              {
                "module.jackdbus-detect" = true;
              }
            ];
          }
        ];
      };
    };
  };
}

