import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Magnifier
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Actions.SpawnOn
import XMonad.Util.Ungrab
import XMonad.Hooks.ManageHelpers
import XMonad.StackSet
import XMonad.Layout.ThreeColumns

fColor = "#d73a49"

nColor = "#586069"

myLayout = avoidStruts (tiled ||| Full)
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

myStartupHook = do
    spawn "~/.config/polybar/launch.sh"
    spawn "~/.fehbg &"
    spawnOnce "xrandr -s 3440x1440 -r 120"
    spawnOnce "picom -b --config ~/.config/picom/picom.conf"

main = do
  xmonad $
    docks $
      ewmh
        def
          { normalBorderColor = nColor,
            borderWidth = 3,
            focusedBorderColor = fColor,
            layoutHook = spacingWithEdge 10 myLayout,
            manageHook = manageSpawn,
            terminal = "alacritty",
            startupHook = myStartupHook
          }
        `additionalKeys` [ ((mod1Mask, xK_b), spawn "google-chrome-stable"),
                           ((mod1Mask, xK_s), unGrab *> spawn "scrot -s ~/screenshots/%b%d::%H%M%S.png"),
                           ((mod1Mask, xK_Q), spawn "pkill X"),
                           ((mod1Mask, xK_x), spawn "xsecurelock"),
                           ((mod1Mask, xK_p), spawn "rofi -show run")
        ]
