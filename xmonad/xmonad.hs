import XMonad
import XMonad.Config.Gnome
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.StackTile

myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-shell" --> doFloat
    ])

main = xmonad $ gnomeConfig
    {
      layoutHook = avoidStruts $ myLayouts
    , manageHook = myManageHook
    }

myLayouts = layoutHints(ThreeCol 1 (3/100) (1/2)) ||| ResizableTall 1 (3/100) (1/2) [] ||| Full ||| StackTile 1 (3/100) (1/2)
