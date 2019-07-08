import           System.IO
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Layout.Spacing
import           XMonad.Util.EZConfig     (additionalKeys)
import           XMonad.Util.Run          (spawnPipe)

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" , ppTitle = const ""}

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts myLayout
    , modMask = mod4Mask
    , workspaces = myWorkspaces
    , terminal = "termite"
    }

myWorkspaces = ["1:Web", "2:Dev", "3:Docs", "4:Music", "5", "6", "7", "8"]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = smartSpacing 10 $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100
