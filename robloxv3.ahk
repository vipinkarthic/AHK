#Requires AutoHotkey v2
#SingleInstance Force

;─── Adjustable countdown position ────────────────────────────────────────
timerX := 900         ; horizontal offset (0 = screen left)
timerY := 20          ; vertical   offset (0 = screen top)
;──────────────────────────────────────────────────────────────────────────

;─── State & timing variables ─────────────────────────────────────────────
toggle        := false
intervalMs    := 600000    ; 10 minutes in ms
nextClickTime := 0
;──────────────────────────────────────────────────────────────────────────

;─── Helper: is Roblox the focused window? ─────────────────────────────────
IsRobloxActive() {
    ; Matches the Roblox Player process (adjust exe name if necessary)
    return WinActive("ahk_exe RobloxPlayerBeta.exe")
}

;─── Countdown updater ────────────────────────────────────────────────────
UpdateTimer() {
    global toggle, nextClickTime, timerX, timerY

    if (toggle && IsRobloxActive()) {
        remaining := nextClickTime - A_TickCount
        if (remaining < 0)
            remaining := 0

        mins := remaining // 60000
        secs := Mod((remaining // 1000), 60)
        minsText := (mins < 10 ? "0" . mins : mins)
        secsText := (secs < 10 ? "0" . secs : secs)

        ToolTip minsText . ":" . secsText, timerX, timerY
    }
    else {
        ToolTip()  ; always hide unless both toggled and Roblox is active
    }
}

SetTimer(UpdateTimer, 10000)   ; refresh every 10 s
UpdateTimer()                  ; immediate first draw

;─── Hotkeys & click routine ──────────────────────────────────────────────
^!0:: {
    global toggle, intervalMs, nextClickTime

    if !IsRobloxActive()
        return    ; ignore toggle if Roblox isn’t in focus

    toggle := !toggle
    if (toggle) {
        ClickPositions()
        nextClickTime := A_TickCount + intervalMs
        SetTimer(ClickPositions, intervalMs)
        TrayTip("Auto Clicker", "Started; clicking every 10 minutes.", 2)
    } else {
        SetTimer(ClickPositions, 0)
        nextClickTime := 0
        ToolTip()   ; clear any lingering tooltip
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


^!9:: {
    global toggle, intervalMs, nextClickTime

    if !IsRobloxActive()
        return    ; ignore toggle if Roblox isn’t in focus

    toggle := !toggle
    if (toggle) {
        ClickPositions2()
        nextClickTime := A_TickCount + intervalMs
        SetTimer(ClickPositions2, intervalMs)
        TrayTip("Auto Clicker", "Started; clicking every 10 minutes. with switch", 2)
    } else {
        SetTimer(ClickPositions2, 0)
        nextClickTime := 0
        ToolTip()   ; clear any lingering tooltip
        TrayTip("Auto Clicker", "Stopped.", 2)
    }
}


ClickPositions2() {
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
    Sleep 500
    Send("!{2}")
    

    nextClickTime := A_TickCount + intervalMs
}

Cleanup(*) {
    ToolTip()  ; ensure tooltip is hidden on exit
}
