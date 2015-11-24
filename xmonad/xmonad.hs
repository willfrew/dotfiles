import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import System.IO
import Control.Monad (liftM2)
import qualified XMonad.StackSet as W


main = 
  xmonad =<< xmobar c0nf1g 

-- Named (and un-named) workspaces.
w0rksp4ces = ["code", "web", "term", "skype", "tunes", "6", "7", "8", "9"]

-- Per-program management
managePr0gz = composeAll
                [ className =? "chromium" --> viewShift "web",
                  className =? "Firefox"  --> viewShift "web",
                  className =? "Brackets" --> viewShift "code",
                  className =? "Atom"     --> viewShift "code",
                  stringProperty "WM_NAME" =? "Eclipse"  --> viewShift "code",
                  className =? "Gimp"     --> viewShift "img",
                  className =? "URxvt"    --> viewShift "term",
                  className =? "Skype"    --> viewShift "skype",
                  stringProperty "WM_WINDOW_ROLE" =? "pop-up" --> doFloat
                ]
                where viewShift = doF . liftM2 (.) W.greedyView W.shift

k3yz        = [
                ("M-S-l", spawn "xscreensaver-command --lock"),
                ("M-i", spawn "chromium" ),
                ("<XF86AudioRaiseVolume>", spawn "amixer set Master 1+"),
                ("<XF86AudioLowerVolume>", spawn "amixer set Master 1-"),
                ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10"),
                ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
              ]
              ++ -- Stop greedyViewing on multiple screens
              [(otherModMasks ++ "M-" ++ [key], action tag)
                | (tag, key) <- zip w0rksp4ces "123456789"
                , (otherModMasks, action) <- [ ("", windows . W.view)
                                                , ("S-", windows . W.shift)]
              ]

c0nf1g =  defaultConfig
            { terminal     = "urxvt",
              modMask      = mod4Mask, -- Windows key
              borderWidth  = 1,        -- 1 pixel window borders
              normalBorderColor = "#515151",
              focusedBorderColor = "#00aeba",
              workspaces = w0rksp4ces,
              manageHook = managePr0gz <+> manageDocks <+> manageHook defaultConfig,
              layoutHook   = avoidStruts $ Tall 1 (3/100) (1/2) ||| noBorders Full,
              handleEventHook = docksEventHook <+> handleEventHook defaultConfig
            }
          `additionalKeysP` k3yz

