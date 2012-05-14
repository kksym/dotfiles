import XMonad
import XMonad.Util.Run
import XMonad.Util.Loggers
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Layout.Gaps
import XMonad.Layout.Tabbed
import XMonad.Actions.UpdatePointer
import XMonad.StackSet (shift)
import System.IO
import XMonad.Layout.IM
import XMonad.Layout.Reflect
import XMonad.Layout.ResizableTile
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Named
 
myWorkspaces :: [String]
myWorkspaces = ["web", "util", "img", "game"]

myManageHook :: ManageHook
myManageHook = composeAll
    [
    title =? "Nitrogen" --> doFloat,
    className =? "Gimp" --> doShift "img",
    className =? "Gimp-2.6" --> doShift "img",
    className =? "feh" --> doFloat,
    className =? "Skype" --> doShift "util",
    title =? "Copying files" --> doFloat,
    title =? "Engine" --> doFloat,
    className =? "Steam" --> doShift "game",
    className =? "Putty" --> doFloat
    ]

myLayoutHook =
    onWorkspace "img" (named "gimp" gimp) $
        avoidStruts $ layoutHook defaultConfig
            where gimp = avoidStruts $ withIM 0.15 (Role "gimp-toolbox") $ reflectHoriz $ 
                            withIM 0.2 (Role "gimp-dock") (ResizableTall 3 (3 / 100) (1 / 2) [])			

myPrettyPrinter xmobar = xmobarPP {
    ppCurrent = xmobarColor "#0000ff" "#eeeeee" . pad,
    ppHidden = xmobarColor "#00309f" "#fefefe",
    ppOutput = hPutStrLn xmobar,
    ppTitle = xmobarColor "#000000" "#ffffff" . (replicate 60 ' ' ++),
    ppOrder = \(ws:layout:title:_) -> [ws],
    ppSep = ""
}

myDefaultConfig xmobar = defaultConfig {
    terminal = "urxvt",
    modMask = mod1Mask,
    borderWidth = 2,
    workspaces = myWorkspaces ++ map show [length myWorkspaces + 1..9],
    normalBorderColor = "#eeeeee",
    focusedBorderColor = "#cacaca",
    startupHook = setWMName "LG3D", -- Make sure Java applications display
    manageHook = manageDocks <+> myManageHook,
    layoutHook = myLayoutHook,
    logHook = dynamicLogWithPP $ myPrettyPrinter xmobar
}

myKeyBindings :: [((KeyMask, KeySym), X ())]
myKeyBindings =
    [
    ((0, xK_Print), spawn "scrot -e 'mv $f ~/screen'"),
    ((mod1Mask .|. controlMask, xK_c), spawn "firefox"),
    ((mod1Mask .|. controlMask, xK_u), spawn "uzbl-tabbed"),
    ((mod1Mask .|. controlMask, xK_p), spawn "pcmanfm"),
    ((mod1Mask .|. controlMask, xK_m), spawn "~/games/minecraft"),
    ((mod1Mask .|. controlMask, xK_e), spawn "eclipse"),	
    ((mod1Mask .|. controlMask, xK_g), spawn "gimp"),
    ((mod1Mask .|. controlMask, xK_n), spawn "nitrogen"),
    ((mod1Mask .|. controlMask, xK_d), spawn "desura"),
    ((mod1Mask .|. controlMask, xK_t), spawn "thunderbird"),
    ((mod1Mask, xK_KP_Add), spawn "mpc volume +2"),
    ((mod1Mask, xK_KP_Subtract), spawn "mpc volume -2")
    ]

main :: IO ()
main = do
    xmobar <- spawnPipe "xmobar"
    xmonad $ myDefaultConfig xmobar `additionalKeys` myKeyBindings

