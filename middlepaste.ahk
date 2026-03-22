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

    isIBeam := (A_Cursor = "IBeam")
    isTerminal := (exe = "WindowsTerminal.exe")
    isExplorer := (exe = "explorer.exe")

    if !(isIBeam || isTerminal || isExplorer)
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