# ahk_scripts

AutoHotkey v2 scripts for Windows quality-of-life improvements.

## middlepaste.ahk

Enables Linux-style middle-click paste on Windows. Clicking the middle mouse button pastes clipboard contents when the cursor is over a text field (IBeam cursor), Windows Terminal, or File Explorer.

### Behavior

- **Text fields**: focuses the field, clicks to position the cursor, then pastes
- **Windows Terminal**: pastes directly (no click needed)
- **File Explorer**: pastes into the current location
- **Everywhere else**: passes the middle click through unchanged

### Requirements

- [AutoHotkey v2](https://www.autohotkey.com/)

### Usage

Run `middlepaste.ahk` with AutoHotkey v2. To have it start automatically, add a shortcut to your startup folder (`shell:startup`).
