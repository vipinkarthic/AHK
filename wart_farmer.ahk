#Requires AutoHotkey v2.0 

#SingleInstance Force

SetTitleMatchMode(2)

auto_farm_on := false

side_ways_time := 48000
forward_time := 1500

side_ways_randomize_time := 500
forward_randomize_time := 1000

while_loop_sleep := 100

mc_win_hwnd := 0


!x:: {
    global auto_farm_on, mc_win_hwnd
    auto_farm_on := !auto_farm_on
    mc_win_hwnd := 0
    if auto_farm_on
        mc_win_hwnd := WinGetID("A")
        SetTimer(auto_farm, -100)
}

#HotIf auto_farm_on
F11:: global auto_farm_on := false
mc_win_hwnd := 0
#HotIf

auto_farm() {
    global auto_farm_on, side_ways_time, forward_time, mc_win_hwnd
    if mc_win_hwnd == 0 {
        MsgBox("Minecraft window didn't get set!", "Error")
        auto_farm_on := false
        return
    }
    loop {
        start_time := A_TickCount + Random(0, side_ways_randomize_time)
        ControlSend("{D down}", , "ahk_id " mc_win_hwnd)
        ; Send("{D down}")
        while (auto_farm_on and (A_TickCount - start_time < side_ways_time)) {
            Sleep(while_loop_sleep)
        }
        ControlSend("{D Up}", , "ahk_id " mc_win_hwnd)
        ; Send("{D Up}")
        if !auto_farm_on
            break
        
        start_time := A_TickCount + Random(0, forward_randomize_time)
        ControlSend("{W down}", , "ahk_id " mc_win_hwnd)
        ; Send("{W down}")
        while (auto_farm_on and (A_TickCount - start_time < forward_time)) {
            Sleep(while_loop_sleep)
        }
        ControlSend("{W Up}", , "ahk_id " mc_win_hwnd)
        ; Send("{W Up}")
        if !auto_farm_on
            break

        start_time := A_TickCount + Random(0, side_ways_randomize_time)
        ControlSend("{A down}", , "ahk_id " mc_win_hwnd)
        ; Send("{A down}")
        while (auto_farm_on and (A_TickCount - start_time < side_ways_time)) {
            Sleep(while_loop_sleep)
        }
        ControlSend("{A Up}", , "ahk_id " mc_win_hwnd)
        ; Send("{A Up}")
        if !auto_farm_on
            break
        
        start_time := A_TickCount + Random(0, forward_randomize_time)
        ControlSend("{W down}", , "ahk_id " mc_win_hwnd)
        ; Send("{W down}")
        while (auto_farm_on and (A_TickCount - start_time < forward_time)) {
            Sleep(while_loop_sleep)
        }
        ControlSend("{W Up}", , "ahk_id " mc_win_hwnd)
        ; Send("{W Up}")
        if !auto_farm_on
            break
    }
}

F12::ExitApp