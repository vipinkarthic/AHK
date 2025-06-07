#Requires AutoHotkey v2
#SingleInstance Force

;─── Adjustable countdown position ────────────────────────────────────────
timerX := 900         ; horizontal offset (0 = screen left)
timerY := 20          ; vertical   offset (0 = screen top)
;──────────────────────────────────────────────────────────────────────────

;─── State & timing variables ─────────────────────────────────────────────
toggle         := false
intervalMs     := 600000   ; 10 minutes in ms
nextClickTime  := 0
;──────────────────────────────────────────────────────────────────────────

;─── Countdown updater ────────────────────────────────────────────────────

UpdateTimer() {
    global toggle, nextClickTime, timerX, timerY
    if (toggle) {
        remaining := nextClickTime - A_TickCount
        if (remaining < 0)
            remaining := 0
        mins := remaining // 60000
        secs := Mod((remaining // 1000), 60)
        minsText := (mins < 10 ? "0" . mins : mins)
        secsText := (secs < 10 ? "0" . secs : secs)
        ToolTip minsText . ":" . secsText, timerX, timerY
    } else {
        ToolTip()  ; hide when not running
    }
}

SetTimer(UpdateTimer, 10000)   ; refresh every 10 s
UpdateTimer()                  ; immediate first draw
;──────────────────────────────────────────────────────────────────────────

;─── Hotkeys & click routine ──────────────────────────────────────────────
^!0:: {
    global toggle, intervalMs, nextClickTime
    if !WinActive("Roblox")
        return

    toggle := !toggle
    if (toggle) {
        ClickPositions()
        nextClickTime := A_TickCount + intervalMs
        SetTimer(ClickPositions, intervalMs)
        TrayTip("Auto Clicker", "Started; clicking every 10 minutes.", 2)
    } else {
        SetTimer(ClickPositions, 0)
        nextClickTime := 0
        ToolTip()  ; clear countdown
        TrayTip("Auto Clicker", "Stopped.", 2)
    }
}

^!Esc:: ExitApp

ClickPositions() {
    global nextClickTime, intervalMs
    Sleep 500
    Send("!{8}")  
    Sleep 50
    Send("!{9}")  
    Sleep 500
    Send("{A Down}") 
    Sleep 500
    Send("{A Up}")   
    Sleep 500
    Send("!{8}")  
    Sleep 50
    Send("!{9}")  
    Sleep 500
    Send("{D Down}") 
    Sleep 500
    Send("{D Up}")
    nextClickTime := A_TickCount + intervalMs
}

Cleanup(*) {
    ToolTip()  ; ensure tooltip is hidden
}
;──────────────────────────────────────────────────────────────────────────
