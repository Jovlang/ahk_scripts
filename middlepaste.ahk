#Requires AutoHotkey v2.0

*MButton::
{
    if HandleMiddlePaste()
        return

    SendEvent "{Blind}{MButton}"
}

HandleMiddlePaste() {
    MouseGetPos &mx, &my, &hwnd
    if !hwnd
        return false

    exe := ""
    try exe := WinGetProcessName("ahk_id " hwnd)

    if (exe = "alacritty.exe" || exe = "WindowsTerminal.exe" || exe = "wezterm-gui.exe") {
        if !WinActive("ahk_id " hwnd) {
            WinActivate("ahk_id " hwnd)
            WinWaitActive("ahk_id " hwnd, , 0.15)
            Sleep 10
        }
        SendEvent "^+v"
        return true
    }

    isIBeam := (A_Cursor = "IBeam")
    isExplorer := (exe = "explorer.exe")

    if !(isIBeam || isExplorer)
        return false

    if !WinActive("ahk_id " hwnd) {
        WinActivate("ahk_id " hwnd)
        WinWaitActive("ahk_id " hwnd, , 0.15)
        Sleep 10
    }

    if isIBeam {
        Click "Left"
        Sleep 8
    }

    SendEvent "^v"
    return true
}