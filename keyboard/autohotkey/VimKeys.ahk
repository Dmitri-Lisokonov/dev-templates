#HotIf WinActive("ahk_exe WindowsTerminal.exe") || WinActive("ahk_exe powershell.exe")

; Right Shift + A → Select All in Vim (ggVG) without echoing "A"
RShift & a::
{
    ; Suppress "A" by not letting the normal key through
    Send("{Esc}")  ; Ensure Normal mode
    Send("g")
    Send("g")
    Send("V")
    Send("G")
    return  ; Do nothing else, so "A" won't type
}

#HotIf
