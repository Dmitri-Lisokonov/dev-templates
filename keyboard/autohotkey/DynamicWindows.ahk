; Dynamic Multi-Window Hotkey Binder (Up to 5 windows) - Fixed for AutoHotkey v2

global SavedWindows := [0, 0, 0, 0, 0]  ; Pre-initialize 5 slots

SaveWindow(slot) {
    global SavedWindows
    hwnd := WinGetID("A")  ; Get the active window ID
    SavedWindows[slot] := hwnd
    ToolTip("Window saved to slot #" slot)
    SetTimer(() => ToolTip(), -1000)  ; Hide tooltip after 1s
}

ActivateWindow(slot) {
    global SavedWindows
    hwnd := SavedWindows[slot]
    if (hwnd && WinExist("ahk_id " hwnd)) {
        WinActivate("ahk_id " hwnd)  ; Bring window to front
    } else {
        ToolTip("Slot #" slot " is empty or the window no longer exists.")
        SetTimer(() => ToolTip(), -1500)  ; Hide tooltip after 1.5s
    }
}

; Hotkeys:
; Ctrl+Alt+1..5 to SAVE a window
; Alt+1..5 to ACTIVATE a saved window

^!1::SaveWindow(1)
^!2::SaveWindow(2)
^!3::SaveWindow(3)
^!4::SaveWindow(4)
^!5::SaveWindow(5)

!1::ActivateWindow(1)
!2::ActivateWindow(2)
!3::ActivateWindow(3)
!4::ActivateWindow(4)
!5::ActivateWindow(5)

