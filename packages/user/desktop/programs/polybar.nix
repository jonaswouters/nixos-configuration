{ config, pkgs, lib, ... }:

let
  settings = (import ../../../../private/settings.nix);
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username} = {
     services.polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        #pulseSupport = true;
        #iwSupport = true;
        githubSupport = true;
        mpdSupport = true;
      };

      script = "polybar bar2 &";

      extraConfig = ''
        [global/wm]
        margin-top = 5
        margin-bottom = 2

        [colors]
        orange = #d79921
        darkgray = #8a8a8a
        white = #f9f5d7
        gray = #585858
        black = #090909
        red = #db3f3f
        blue = #95aec7
        yellow = #c7ae95
        green = #aec795
        background = #111313
        background-alt = #111313
        foreground = #f9f5d7
        foreground-alt = #f9f5d7
        primary = #111313
        secondary = #d79921
        alert = #db2f2f

        [bar/bar1]
        bottom = false
        override-redirect = false
        wm_stack = i3
        width = 100%
        height = ${settings.desktop.polybar.height}
        offset-x = 
        offset-y = 

        #border-left-size = 6
        #border-right-size = 6
        #border-top-size = 7

        padding-left = 0
        padding-right = 0

        module-margin-right = 1
        module-margin-left = 1

        modules-right = cpu memory temperature filesystem wlan backlight volume battery date
        modules-center = i3

        background = ''${colors.background}
        foreground = ''${colors.foreground}

        underline-size = 3
        underline-color = ''${colors.orange}

        tray-detached = false
        tray-position = right
        tray-offset-x = 0
        tray-offset-y = 0
        tray-maxsize = 16
        tray-padding = 0

        font-0 = "Hack Regular Nerd Font Complete:size=${settings.desktop.polybar.font1-size};0"
        font-1 = "Hack Regular Nerd Font Complete:size=${settings.desktop.polybar.font2-size};0"

        [bar/bar2]
        bottom = false
        override-redirect = false
        wm_stack = i3
        width = 100%
        height = ${settings.desktop.polybar.height}
        offset-x = 
        offset-y = 

        #border-left-size = 6
        #border-right-size = 6
        #border-top-size = 7

        padding-left = 0
        padding-right = 0

        module-margin-right = 1
        module-margin-left = 1

        #modules-right = filesystem wlan backlight volume battery date
        #modules-right = timesheet secure-tunnel volume date
        modules-right = volume date
        modules-center = i3
        modules-left = battery eth wlan filesystem temperature memory cpu

        background = ''${colors.background}
        foreground = ''${colors.foreground}

        underline-size = 3
        underline-color = ''${colors.orange}

        tray-detached = false
        tray-position = right
        tray-offset-x = 0
        tray-offset-y = 0
        tray-maxsize = 16
        tray-padding = 0

        font-0 = "Hack Nerd Font:size=${settings.desktop.polybar.font1-size};0"
        font-1 = "Hack Nerd Font:size=${settings.desktop.polybar.font2-size};0"

        [module/xwindow]
        type = internal/xwindow
        #format-underline = ''${colors.background}
        label = %title%
        label-maxlen = 30

        [module/i3]
        type = internal/i3
        format = <label-state> <label-mode>
        index-sort = false
        wrapping-scroll = false
        strip-wsnumbers = true
        pin-workspaces = true
        enable-click = true

        label-mode-padding = 1
        label-mode-foreground = #db3f3f
        label-mode-background = ''${colors.primary}

        label-focused = %name%
        label-focused-background = ''${colors.gray}
        label-focused-underline = ''${colors.orange}
        label-focused-padding = 1

        label-unfocused = %name%
        label-unfocused-padding = 1

        label-urgent = %name%!
        label-urgent-foreground = ''${colors.red}
        label-urgent-padding = 1

        label-visible = %name%
        label-visible-background = ''${self.label-focused-background}
        label-visible-underline = ''${self.label-focused-underline}
        label-visible-padding = ''${self.label-focused-padding}

        [module/backlight]
        type = internal/backlight
        card = intel_backlight

        format = <label>
        format-padding = 1
        format-underline = ''${colors.orange}
        label =  %percentage%%

        bar-width = 6
        bar-indicator = 
        bar-indicator-foreground = ''${colors.white}
        bar-indicator-font = 0
        bar-fill = 
        bar-fill-font = 0
        bar-fill-foreground = ''${colors.white}
        bar-empty = 
        bar-empty-font = 0
        bar-empty-foreground = #282a2e

        [module/date]
        type = internal/date
        date =  %A %d %b  %H:%M
        interval = 5
        format-underline = ''${colors.orange}
        format-foreground = ''${colors.foreground}
        format-padding = 1

        [module/volume]
        type = internal/volume

        format-volume = <ramp-volume> <label-volume> 
        format-volume-padding = 1
        label-muted-padding = 1

        format-volume-underline = ''${colors.orange}

        label-volume = %percentage%%

        label-muted =  mut
        label-muted-underline = ''${colors.orange}

        ramp-volume-0 = 
        ramp-volume-1 = 
        ramp-volume-2 = 

        [module/battery]
        type = internal/battery
        battery = BAT0
        adapter = AC
        full-at = 96
        interval = 10

        format-charging = <animation-charging> <label-charging>
        label-charging = %percentage%%
        format-charging-underline = ''${colors.orange}
        format-charging-padding = 1

        time-format = %H:%M
        #label-discharging = %percentage%% - %time%
        label-discharging = %percentage%%
        format-discharging = <ramp-capacity> <label-discharging> 
        format-discharging-underline = ''${colors.orange}
        format-discharging-padding = 1

        label-full = %percentage%%
        format-full = <ramp-capacity> <label-full>
        format-full-underline = ''${self.format-charging-underline}
        format-full-overline = ''${self.format-charging-underline}
        format-full-padding = 1

        ramp-capacity-0 = 
        ramp-capacity-1 = 
        ramp-capacity-2 = 
        ramp-capacity-3 = 
        ramp-capacity-foreground = ''${colors.foreground}

        animation-charging-0 = 
        animation-charging-1 = 
        animation-charging-2 = 
        animation-charging-3 = 
        animation-charging-4 = 
        animation-charging-foreground = ''${colors.foreground}
        animation-charging-framerate = 1000

        [module/temperature]
        hwmon-path = /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
        type = internal/temperature
        thermal-zone = 3
        warn-temperature = 65
        interval = 5

        format = <ramp> <label>
        format-underline = ''${colors.orange}
        format-warn = <ramp> <label-warn>
        format-warn-underline = ''${colors.red}

        format-padding = 1
        format-warn-padding = 1

        label = %temperature%
        label-warn = %temperature%

        ramp-0 = 
        ramp-1 = 
        ramp-2 = 
        ramp-foreground = #f9f5d7

        [module/cpu]
        format-label = internal/cpu

        #format = <label> <ramp-coreload>
        fotmat = <label>

        ramp-coreload-0 = ▁
        ramp-coreload-1 = ▂
        ramp-coreload-2 = ▃
        ramp-coreload-3 = ▄
        ramp-coreload-4 = ▅
        ramp-coreload-5 = ▆
        ramp-coreload-6 = ▇
        ramp-coreload-7 = █
        ramp-coreload-underline = ''${colors.orange}

        type = internal/cpu
        interval = 2
        label = %{F''${colors.white} %percentage%%  
        label-underline = ''${colors.orange}
        label-padding = 1

        [module/memory]
        type = internal/memory
        interval = 2

        label = %{F''${colors.white} %percentage_used%%
        label-underline = ''${colors.orange}
        label-foreground = ''${colors.orange}
        label-padding = 1

        [module/wlan]
        type = internal/network
        interface = wlp3s0
        interval = 5

        format-connected-padding = 1
        format-disconnected-padding = 0

        format-connected = <label-connected>
        format-connected-underline = ''${colors.orange}
        format-disconnected-underline = ''${colors.gray}

        label-connected = %essid% 
        label-disconnected =
        label-disconnected-foreground = ''${colors.gray}


        [module/eth]
        type = internal/network
        interface = enp0s31f6
        interval = 5

        format-connected-padding = 1
        format-disconnected-padding = 0

        format-connected-underline = ''${colors.orange}
        format-disconnected-underline = ''${colors.gray}

        # label-connected =  %linkspeed%
        label-connected =   %downspeed:9%
        label-disconnected = 
        label-disconnected-foreground = ''${colors.white}


        [module/filesystem]
        type = internal/fs
        interval = 25

        mount-0 = /

        label-mounted =  %percentage_used%% %free%
        label-mounted-underline = ''${colors.orange}
        label-mounted-padding = 1

        label-unmounted =
        label-unmounted-foreground = ''${colors.black}

        [module/menu0]
        type = custom/menu

        format = <label-toggle>
        format-underline = ''${colors.orange}
        format-padding = 1

        label-open =   

        [module/spotify]
        type = custom/script
        exec = ~/.config/polybar/spotify.sh
        tail = true
        format-padding = 2

        [module/secure-tunnel]
        type = custom/script
        exec = ~/.bin/polybar/check-secure-tunnel.sh
        interval = 60
        format-underline = ''${colors.orange}
        format-padding = 1
        format-prefix = "%{T2}%{T-} "

        [module/timesheet]
        type = custom/script
        exec = ~/.bin/polybar/timesheet.sh
        interval = 0
        format-underline = ''${colors.orange}
        format-padding = 1
        format-prefix = "%{T2} %{T-} "
        tail = true
        click-right = kill -USR1 %pid%
      '';
    };
  };
}
