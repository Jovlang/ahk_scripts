#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent
CoordMode 'Mouse', 'Screen'
SetWinDelay -1

#LButton:: {
    FileAppend FormatTime(, 'yyyy-MM-dd HH:mm:ss') ' hotkey fired`n', A_ScriptDir '\debug.log'
    MouseGetPos &startX, &startY, &target
    if !target
        return
    target := DllCall('GetAncestor', 'Ptr', target, 'UInt', 2, 'Ptr')
    try {
        className := WinGetClass('ahk_id ' target)
        if className = 'Progman' || className = 'WorkerW' || className = 'Shell_TrayWnd' || className = 'Shell_SecondaryTrayWnd'
            return
        WinGetPos &winX, &winY, &winW, &winH, 'ahk_id ' target
        wasMaximized := WinGetMinMax('ahk_id ' target) = 1
        moving := false
        while GetKeyState('LButton', 'P') {
            MouseGetPos &x, &y
            if !moving && Abs(x - startX) + Abs(y - startY) < 4 {
                Sleep 10
                continue
            }
            if !moving {
                moving := true
                if wasMaximized {
                    fraction := Max(0, Min(1, (startX - winX) / winW))
                    WinRestore 'ahk_id ' target
                    WinGetPos , , &restoredW, &restoredH, 'ahk_id ' target
                    winX := startX - Round(restoredW * fraction)
                    winY := startY - Min(startY - winY, 30)
                }
            }
            WinMove winX + x - startX, winY + y - startY, , , 'ahk_id ' target
            Sleep 10
        }
    } catch Error as err {
        FileAppend err.Message ' at line ' err.Line '`n', A_ScriptDir '\debug.log'
        ; A closing or protected window should not interrupt the hotkey.
    }
}

