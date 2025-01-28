{ home, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    systemd.variables = [ "--all" ];
    enable = true;
    # xwayland.enable = false;
    sourceFirst = true;
    package = pkgs.hyprland;
    settings = {
      "$mod" = "SUPER";
      "$term" = "kitty";

      monitor = [
        "eDP-1, 1366x768@60, 0x0, 1"
        "HDMI-A-1, 1920x1080@75, -1920x0, 1"
      ];

      exec-once = [
        "eww daemon"
        "wl-paste --type text --watch cliphist store"
        "eww open bar"
      ];

      source = [ "~/.config/hypr/temp.conf" ];

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
      };

      windowrulev2 = [ "noanim, class:^(flameshot)$" ];

      input = {
        follow_mouse = 1;
        force_no_accel = 1;
        touchpad = { natural_scroll = true; };
      };

      # Keyboard Bindings
      bind = [
        # Launch Keys
        "$mod, Return, exec, $term"
        "$mod, R, exec, sh -c ~/.config/rofi/scripts/launcher"
        "$mod SHIFT, P, exec, sh -c ~/.config/rofi/scripts/power"
        ", Print, exec, flameshot gui"

        # Window Management
        "$mod, Q, killactive"
        "$mod SHIFT, Q, exit"
        "$mod SHIFT, R, exec, hyprctl reload"
        "$mod, T, togglefloating"
        "$mod, Z, fullscreen, 1"
        "$mod, F, fullscreen, 0"
        "$mod, P, pseudo"

        # Focus Windows
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        # Shift Windows
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        # Move to Workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
      ];

      # Decorations
      decoration = {
        # Edges and corners
        rounding = 2;

        # Blur controls
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          xray = true;
          ignore_opacity = false;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      # Mouse Bindings
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
    };
  };
}
