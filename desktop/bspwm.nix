{ config, pkgs, inputs, ...}:

{
  xsession.windowManager.bspwm = 
  {
    enable = true;
    monitors = {
      eDP-1-1 = [
        "[1]"
          "[2]"
          "[3]"
          "[4]"
          "[5]"
          "[6]"
          "[7]"
          "[8]"
      ];
    };
    rules = {
      "mpv" = {
        state = "pseudo_tiled";
      };
      "Telegram-desktop" = {
        state = "floating";
      };
      "Zathura" = {
        state = "floating";
      };
      "Peek" = {
        state = "floating";
      };
      "GenshinImpact.exe" = {
        state = "floating";
      };
 #     "" = {
 #     state = ;
 #     };
    };
    settings = {
      border_width = 3;
      window_gap = 4;
      focused_border_color = "#0060FF";
      normal_border_color = "#7700AE";
      active_border_color = "#0060FF";
      pointer_modifier = "mod1";
      focus_follows_pointer = true;
      split_ratio = 0.5;
      borderless_monocle = true;
      gapless_monocle = true;
      single_monocle = true;

    };
#    extraConfig = ''
#    pgrep -x sxhkd > /dev/null || sxhkd &
#    '';
  };
  services.sxhkd = {
    enable = true;
#    keybindings = {
#    "super + t" = "kitty";
#    };
    extraConfig = ''
#
# wm independent hotkeys
#
#####APPS
# terminal emulator
super + t
  kitty

# program launcher
super + space
  rofi -show
#
super + x
##/home/ladas552/.local/bin/powermenu.sh
  xfce4-session-logout
super + c
  /home/ladas552/.local/bin/word-lookup.sh
#
super + l
  betterlockscreen -l dimblur
##program hot keys
super + {w,f}
  {floorp,thunar}
#
##kitty apps
super + {g,m,h,n}
  kitty -e {qalc,ncmpcpp,btop,nvim}
#
##Screenshot
Print
  flameshot gui
##MPD
#
shift + alt + {p,n,b,k,l,c}
  mpc {toggle,next,prev,volume -5,volume +5,clear}
#
shift + alt + m
  /home/ladas552/.local/bin/musnow.sh
##KeyboardSimvols
#
{XF86AudioRaiseVolume,XF86AudioLowerVolume}
  pamixer -{i,d} 2
#
XF86AudioMute
  pamixer -t
#
## make sxhkd reload its configuration files:
super + Escape
  pkill -USR1 -x sxhkd
#
##########
## bspwm hotkeys
##
#
##quit/restart bspwm
super + alt + {q,r}
  bspc {quit,wm -r}
#
## close and kill
super + {_,shift + }q
  bspc node -{c,k}
#
## alternate between the tiled and monocle layout
super + shift + m
  bspc desktop -l next
#
## send the newest marked node to the newest preselected node
##super + y
##	bspc node newest.marked.local -n newest.!automatic.local
#
## swap the current node and the biggest window
##super + g
##	bspc node -s biggest.window
#
##
## state/flags
##
#
## set the window state
super + shift +  {t,s,f}
  bspc node -t {tiled,floating,fullscreen}
#
## set the node flags
##super + ctrl + {m,x,y,z}
##	bspc node -g {marked,locked,sticky,private}
#
##
## focus/swap
##
#
## focus the node in the given direction
super + {_,shift + }{Left,Down,Up,Right}
  bspc node -{f,s} {west,south,north,east}
#
## focus the node for the given path jump
##super + {p,b,comma,period}
##	bspc node -f @{parent,brother,first,second}
#
## focus the next/previous window in the current desktop
alt + {_,shift + }Tab
  bspc node -f {next,prev}.local.!hidden.window
#
## focus the next/previous desktop in the current monitor
##super + bracket{left,right}
super + {a,s}
  bspc desktop -f {prev,next}.local
#
## focus the last node/desktop
##super + {grave,Tab}
##	bspc {node,desktop} -f last
#
## focus the older or newer node in the focus history
##super + {o,i}
##	bspc wm -h off; \
##	bspc node {older,newer} -f; \
##	bspc wm -h on
#
## focus or send to the given desktop
super + {_,shift + }{1-9,0}
  bspc {desktop -f,node -d} '^{1-9,10}'
#
##
## preselect
##
#
## preselect the direction
super + ctrl + {Left,Down,Up,Right}
  bspc node -p {west,south,north,east}
#
## preselect the ratio
super + ctrl + {1-9}
  bspc node -o 0.{1-9}
#
## cancel the preselection for the focused node
super + ctrl + space
  bspc node -p cancel
#
## cancel the preselection for the focused desktop
super + ctrl + shift + space
  bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel
#
##
## move/resize
##
#
## expand a window by moving one of its side outward
super + alt + {Left,Down,Up,Right}
  bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}
#
## contract a window by moving one of its side inward
super + alt + shift + {Left,Down,Up,Right}
  bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}
#
## move a floating window
alt + shift + {Left,Down,Up,Right}
  bspc node -v {-20 0,0 20,0 -20,20 0}
#
#    '';
  };
}
