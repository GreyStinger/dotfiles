{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "tmux-256color";
    escapeTime = 10;
    historyLimit = 8000;
    keyMode = "emacs";
    prefix = "M-u";
    aggressiveResize = true;
    extraConfig = ''
      # Status
      set -g status-interval 1

      # Terminal colors
      set -as terminal-features ",xterm-256color:RGB"

      # Enable CSI u
      set -g extended-keys on
      set -sag terminal-features 'xterm*:extkeys'

      # Forward escape code to applications
      set -g allow-passthrough on

      # Enable focus events
      set -g focus-events on

      # Enable gapeless window
      set -g renumber-windows on

      # Set tmux to use the smallest windows size:
      # set -g window-size smallest

      # Set bar to top
      set-option -g status-position top

      # Set numbering to start from 0
      set -g base-index 1
      setw -g pane-base-index 1

      # General
      bind u choose-tree -Z

      # Windows
      bind -n C-Right next-window
      bind -n C-Left previous-window

      bind -n C-S-Right swap-window -t +1\; select-window -t +1
      bind -n C-S-Left swap-window -t -1\; select-window -t -1

      # Panes
      bind -n M-Left select-pane -L
      bind -n M-Down select-pane -D
      bind -n M-Up select-pane -U
      bind -n M-Right select-pane -R

      bind -r ] swap-pane -D
      bind -r [ swap-pane -U

      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"

      bind i choose-tree -Z "join-pane -h -s "%%""
      bind o choose-tree -Z "join-pane -h -t "%%""
      bind b if-shell " [ #{window_panes} -gt '1' ] " { break-pane -a }

      # reload config file
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "~/.config/tmux/tmux.conf reloaded"
    '';
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      {
        plugin = catppuccin;
        extraConfig = ''
          # Config

          # general
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "basic"
          set -g @catppuccin_status_background "none"

          # window conf
          set -g @catppuccin_window_number_position 'left'
          set -g @catppuccin_window_status 'no'
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_window_current_color '#{E:@thm_surface_2}'
          set -g @catppuccin_status_module_text_bg '#{E:@thm_mantle}'
          set -g @catppuccin_window_current_text " #{b:pane_current_path}"
          set -g @catppuccin_window_text " #{b:pane_current_path}"
          set -g @catppuccin_date_time_text " %Y-%m-%d %H:%M:%S"

          # status
          set -g status-left ""

          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"

          set -g status-right-length 120
          set -g status-right ""
          set -ag status-right '#{E:@catppuccin_status_application}'
          set -ag status-right '#{E:@catppuccin_status_session}'
          set -ag status-right '#{E:@catppuccin_status_date_time}'

          set -g @catppuccin_status_fill "icon"

          # set -g @catppuccin_flavor "mocha"

          source-file ~/.config/tmux/catppuccin.conf

          # status format
          # set -g @catppuccin_status_background "default"
          # set -g @catppuccin_status_connect_separator "yes"
          # set -g @catppuccin_window_status_style "slanted"

          # window format
          # set -g @catppuccin_window_separator " "
          # set -g @catppuccin_window_left_separator "█"
          # set -g @catppuccin_window_right_separator "█"
          # set -g @catppuccin_window_number_position "left"
          # set -g @catppuccin_window_middle_separator "█ "
          # set -g @catppuccin_window_status_enable "yes"
          # set -g @catppuccin_window_status_icon_enable "no"

          # window default format
          # set -g @catppuccin_window_default_fill "number"
          # set -g @catppuccin_window_default_text "#{s|$USER|~|:#{b:pane_current_path}}"

          # window current format
          # set -g @catppuccin_window_current_fill "number"
          # set -g @catppuccin_window_current_text "#{s|$HOME|~|:pane_current_path}"

          # status modules list
          # set -g @catppuccin_status_modules_right "application session date_time"
          # set -g @catppuccin_status_left_separator "█"
          # set -g @catppuccin_status_right_separator "█"
          # set -g @catppuccin_status_right_separator_inverse "no"
          # set -g @catppuccin_status_fill "icon"

          # config for date_time module
          # set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
        '';
      }
    ];
  };
}
