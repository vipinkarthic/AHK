#Requires AutoHotkey v2
#SingleInstance Force
toggle := false
; Define an array of positions. Each element is an array: [x, y].
positions := [[311, 279]]
posIndex := 1

^!0:: {
    global toggle, positions, posIndex
    if WinActive("Roblox") {
        toggle := !toggle
        if toggle {
            ; Immediately click the current position.
            ClickPositions()
            ; Then set the timer to call ClickPositions every 15000 ms (15 seconds).
            SetTimer(ClickPositions, 600000) ; 10 minutes
            TrayTip("Auto Clicker", "Started clicking positions every 15 seconds.", 2)
        } else {
            SetTimer(ClickPositions, 0)
            TrayTip("Auto Clicker", "Stopped clicking.", 2)
        }
    }
}

^!Esc:: ExitApp


^!1:: {
    global toggle
    if WinActive("Roblox") {
        toggle := !toggle
        if toggle 
            MsgBox("Auto Clicker Started clicking 'A' and 'D' every second.")
        else 
            MsgBox("Auto Clicker Stopped clicking 'A' and 'D'.")
        
    }
}


ClickPositions() {
    Sleep(500)
    Send("!{8}") 
    Sleep(50)
    Send("!{9}")
    Sleep(500)
    Send("{A Down}")
    Sleep(500)
    Send("{A Up}")
    Sleep(500)
    Send("!{8}") 
    Sleep(50)
    Send("!{9}")
    Sleep(500)
    Send("{D Down}")
    Sleep(500)
    Send("{D Up}")
        ; ; Retrieve the x, y coordinates for the current position.
        ; x := positions[posIndex][1]
        ; y := positions[posIndex][2]
        ; ;Move coords to specific x and y
        ; MouseMove(x, y)
        ; ; Click(x, y)
        ; MouseClick('L', x, y)
        ; ; Move to the next position. Wrap around if needed.
        ; posIndex++
        ; if posIndex > ArrayLength(positions) {
        ;     posIndex := 1
        ; }
}

; Custom function to return the number of elements in an array.
ArrayLength(arr) {
    count := 0
    for key, value in arr
        count++
    return count
}
