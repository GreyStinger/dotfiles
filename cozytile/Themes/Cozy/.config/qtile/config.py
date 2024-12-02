#       █████████     ███████    ███████████ █████ █████ ███████████ █████ █████       ██████████
#      ███░░░░░███  ███░░░░░███ ░█░░░░░░███ ░░███ ░░███ ░█░░░███░░░█░░███ ░░███       ░░███░░░░░█
#     ███     ░░░  ███     ░░███░     ███░   ░░███ ███  ░   ░███  ░  ░███  ░███        ░███  █ ░
#    ░███         ░███      ░███     ███      ░░█████       ░███     ░███  ░███        ░██████
#    ░███         ░███      ░███    ███        ░░███        ░███     ░███  ░███        ░███░░█
#    ░░███     ███░░███     ███   ████     █    ░███        ░███     ░███  ░███      █ ░███ ░   █
#     ░░█████████  ░░░███████░   ███████████    █████       █████    █████ ███████████ ██████████
#      ░░░░░░░░░     ░░░░░░░    ░░░░░░░░░░░    ░░░░░       ░░░░░    ░░░░░ ░░░░░░░░░░░ ░░░░░░░░░░
#
#                                                                                    - DARKKAL44

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, hook, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.dgroups import simple_key_binder
from time import sleep

mod = "mod4"
terminal = "alacritty"
foreground_colour                  = "#4B427E"
secondary_foreground_colour        = "#86918A"
secondary_bg_colour                = "#232A2E"
inactive_colour                    = "#232A2E"
background_colour                  = "#343F44"
screen_border_colour               = "#343F44"
current_screen_border_colour       = "#343F44"
other_current_screen_border_colour = "#343F44"
other_screen_border_colour         = "#343F44"
active_colour                      = "#86918A"
block_highlight_text_colour        = "#D3C6AA"
highlight_colour                   = "#4B427E"
urgent_border_colour               = "#343F44"

# █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █▀
# █░█ ██▄ ░█░ █▄█ █ █░▀█y █▄▀ ▄█

keys = [
    #  D E F A U L T
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("sh -c ~/.config/rofi/scripts/launcher"), desc="Spawn a command using a prompt widget"),
    Key([mod], "p", lazy.spawn("sh -c ~/.config/rofi/scripts/power"), desc='powermenu'),
    Key([mod], "t", lazy.spawn("sh -c ~/.config/rofi/scripts/theme_switcher"), desc='theme_switcher'),

    # C U S T O M
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%"), desc='Volume Up'),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%"), desc='volume down'),
    Key([], "XF86AudioMute", lazy.spawn("pulsemixer --toggle-mute"), desc='Volume Mute'),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc='playerctl'),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc='playerctl'),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc='playerctl'),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc='brightness UP'),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc='brightness Down'),
    Key([mod],"e", lazy.spawn("thunar"), desc='file manager'),
    Key([mod], "h", lazy.spawn("roficlip"), desc='clipboard'),
    Key([mod], "s", lazy.spawn("flameshot gui"), desc='Screenshot'),
]


# █▀▀ █▀█ █▀█ █░█ █▀█ █▀
# █▄█ █▀▄ █▄█ █▄█ █▀▀ ▄█

groups = [Group(f"{i+1}", label="") for i in range(8)]
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
                ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )


# L A Y O U T S
lay_config = {
    "border_width": 0,
    "margin": 9,
    "border_focus": "3b4252",
    "border_normal": "3b4252",
    "font": "FiraCode Nerd Font",
    "grow_amount": 2,
}

layouts = [
    layout.Bsp(**lay_config, fair=False, border_on_single=True),
    layout.Columns(
        **lay_config,
        border_on_single=True,
        num_columns=2,
        split=False,
    ),
    layout.Floating(**lay_config),
    layout.Max(**lay_config),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = [ widget_defaults.copy() ]

def search():
    qtile.cmd_spawn("rofi -show drun")

def power():
    qtile.cmd_spawn("sh -c ~/.config/rofi/scripts/power")


# █▄▄ ▄▀█ █▀█
# █▄█ █▀█ █▀▄

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=15,
                    background=secondary_bg_colour,
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/launch_Icon.png',
                    margin=2,
                    background=secondary_bg_colour,
                    mouse_callbacks={"Button1":power},
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/6.png',
                ),

                widget.GroupBox(
                    fontsize=20,
                    borderwidth=4,
                    highlight_method='block',
                    active=active_colour,
                    block_highlight_text_color=block_highlight_text_colour,
                    highlight_color=highlight_colour,
                    inactive=inactive_colour,
                    foreground=foreground_colour,
                    background=background_colour,
                    this_current_screen_border=current_screen_border_colour,
                    this_screen_border=screen_border_colour,
                    other_current_screen_border=other_current_screen_border,
                    other_screen_border=other_screen_border_colour,
                    urgent_border=urgent_border_colour,
                    rounded=True,
                    disable_drag=True,
                ),

                widget.Spacer(
                    length=8,
                    background=background_colour,
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/1.png',
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/layout.png',
                    background=background_colour
                ),

                widget.CurrentLayout(
                    background=background_colour,
                    foreground=secondary_foreground_colour,
                    fmt='{}',
                    font="JetBrains Mono Bold",
                    fontsize=13,
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/5.png',
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/search.png',
                    margin=2,
                    background=secondary_bg_colour,
                    mouse_callbacks={"Button1": search},
                ),

                widget.TextBox(
                    fmt='Search',
                    background=secondary_bg_colour,
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    foreground=secondary_foreground_colour,
                    mouse_callbacks={"Button1": search},
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/4.png',
                ),

                widget.WindowName(
                    background = ,
                    format = "{name}",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    foreground=secondary_foreground_colour,
                    empty_group_string = 'Desktop',

                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/3.png',
                ),

                widget.Systray(
                    background=secondary_bg_colour,
                    fontsize=2,
                ),

                widget.TextBox(
                    text=' ',
                    background=secondary_bg_colour,
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/6.png',
                    background=background_colour,
                ),

                widget.Image(
                  filename='~/.config/qtile/Assets/1.png',
                ),

                widget.Net(
                  format=' {up:.0f}{up_suffix}',
                  background=background_colour,
                  foreground=secondary_foreground_colour,
                  font="JetBrains Mono Bold",
                  prefix='k',
                ),

                widget.Image(
                  filename='~/.config/qtile/Assets/Misc/wifi.png',
                  background=background_colour,
                  margin_y=6,
                  margin_x=5,
                ),

                widget.Net(
                  format='{down:.0f}{down_suffix} ',
                  background=background_colour,
                  foreground=secondary_foreground_colour,
                  font="JetBrains Mono Bold",
                  prefix='k',
                ),

                widget.Image(
                  filename='~/.config/qtile/Assets/2.png',
                ),

                widget.Spacer(
                  length=6,
                  background=background_colour,
                ),

                widget.Image(
                  filename='~/.config/qtile/Assets/Misc/cpu.png',
                  background=background_colour,
                  margin_y=6,
                  margin_x=5,
                ),

                widget.CPU(
                  format='{load_percent}% @ {freq_current}GHz',
                  background=background_colour,
                  foreground=secondary_foreground_colour,
                  font="JetBrains Mono Bold",
                ),

                widget.Image(
                  filename='~/.config/qtile/Assets/2.png',
                ),

                widget.Spacer(
                  length=8,
                  background=background_colour,
                ),


                widget.Image(
                    filename='~/.config/qtile/Assets/Misc/ram.png',
                    background=background_colour,
                ),


                widget.Spacer(
                    length=-7,
                    background=background_colour,
                ),


                widget.Memory(
                    background='#343F44',
                    format='{MemUsed: .0f}{mm}',
                    foreground=secondary_foreground_colour,
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    update_interval=5,
                ),


                widget.Image(
                    filename='~/.config/qtile/Assets/2.png',
                ),


                widget.Spacer(
                    length=8,
                    background=background_colour,
                ),


                widget.BatteryIcon(
                    theme_path='~/.config/qtile/Assets/Battery/',
                    background=background_colour,
                    scale=1,
                ),


                widget.Battery(
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    background=background_colour,
                    foreground=secondary_foreground_colour,
                    format='{percent:2.0%}',
                ),

                widget.Image(
                    filename='~/.config/qtile/Assets/5.png',
                    background=background_colour,
                ),


                widget.Image(
                    filename='~/.config/qtile/Assets/Misc/clock.png',
                    background=secondary_bg_colour,
                    margin_y=6,
                    margin_x=5,
                ),


                widget.Clock(
                    format='%I:%M %p',
                    background=secondary_bg_colour,
                    foreground=secondary_foreground_colour,
                    font="JetBrains Mono Bold",
                    fontsize=13,
                ),

                widget.Spacer(
                    length=18,
                    background=secondary_bg_colour,
                ),
            ],
            30,
            border_color = secondary_bg_colour,
            border_width = [0,0,0,0],
            margin = [15,60,6,60],

        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
	border_focus='#1F1D2E',
	border_normal='#1F1D2E',
	border_width=0,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

import os
import subprocess
# stuff
@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.expanduser('~/.config/qtile/autostart_once.sh')])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# E O F
