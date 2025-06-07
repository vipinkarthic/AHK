#Requires AutoHotkey v2.0 

#SingleInstance Force

auto_farm_on := false

side_ways_time := 97500
forward_time := 1200

side_ways_randomize_time := 500
forward_randomize_time := 500


!k:: {
    global auto_farm_on
    auto_farm_on := !auto_farm_on
    if auto_farm_on
        SetTimer(auto_farm, -5)
}

#HotIf auto_farm_on
Esc:: global auto_farm_on := false
#HotIf

auto_farm() {
    global auto_farm_on, side_ways_time, forward_time
    loop {
        start_time := A_TickCount + Random(0, side_ways_randomize_time)
        Send("{D down}")
        while (auto_farm_on and (A_TickCount - start_time < side_ways_time)) {
            Sleep(100)
        }
        Send("{D Up}")
        if !auto_farm_on
            break
        
        start_time := A_TickCount + Random(0, forward_randomize_time)
        Send("{W down}")
        while (auto_farm_on and (A_TickCount - start_time < forward_time)) {
            Sleep(100)
        }
        Send("{W Up}")
        if !auto_farm_on
            break

        start_time := A_TickCount + Random(0, side_ways_randomize_time)
        Send("{A down}")
        while (auto_farm_on and (A_TickCount - start_time < side_ways_time)) {
            Sleep(100)
        }
        Send("{A Up}")
        if !auto_farm_on
            break
        
        start_time := A_TickCount + Random(0, forward_randomize_time)
        Send("{W down}")
        while (auto_farm_on and (A_TickCount - start_time < forward_time)) {
            Sleep(100)
        }
        Send("{W Up}")
        if !auto_farm_on
            break
    }
}

Delete::ExitApp