# ahk_scripts

AutoHotkey v2 scripts for Windows quality-of-life improvements.

## Requirements

- Windows
- [AutoHotkey v2](https://www.autohotkey.com/)

## MiddlePaste.ahk

Enables Linux-style middle-click paste on Windows. Clicking the middle mouse button pastes clipboard contents when the cursor is over a text field (IBeam cursor), a supported terminal, or File Explorer.

### Behavior

- **Text fields**: focuses the field, clicks to position the cursor, then pastes
- **Alacritty, Windows Terminal, and WezTerm**: activates the window and sends `Ctrl+Shift+V` without clicking
- **File Explorer**: activates the window and sends `Ctrl+V` to paste into the current location
- **Everywhere else**: passes the middle click through unchanged

## WinDrag.ahk

Hold **Win** and drag with the **left mouse button** anywhere on a window to move it.

### Behavior

- Starts moving after a small drag threshold, reducing accidental movement
- Restores maximized windows when dragging begins and keeps the window under the pointer
- Ignores the desktop and taskbars
- Handles closing or protected windows without interrupting the hotkey
- Writes hotkey activations and caught errors to `debug.log` beside the script

## Usage

Run `MiddlePaste.ahk`, `WinDrag.ahk`, or both with AutoHotkey v2. Each script runs independently.

To start a script automatically when you sign in, press `Win+R`, enter `shell:startup`, and add a shortcut to the script in that folder.

To reload or exit a running script, right-click its AutoHotkey icon in the system tray and choose the corresponding action.
