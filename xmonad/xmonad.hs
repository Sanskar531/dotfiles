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

fColor = "#ff8182"

nColor = "#232136"

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
            terminal = "kitty",
            startupHook = myStartupHook
          }
        `additionalKeys` [ ((mod1Mask, xK_c), spawn "google-chrome"),
                           ((mod1Mask, xK_f), spawn "firefox"),
                           ((mod1Mask, xK_s), unGrab *> spawn "scrot -s ~/screenshots/%b%d::%H%M%S.png")
                         ]
