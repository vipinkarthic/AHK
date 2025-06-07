#Requires AutoHotkey v2.0
#SingleInstance Force

fight_on := false
click_time := 2000
fight_button_location := "x361 y890"

F8:: {
    global fight_on
    fight_on := !fight_on
    if fight_on {
        discord_window := WinGetID("A")
        auto_fight(discord_window)
    }
}

F9::Reload

auto_fight(discord_window) {
    loop {
        if !fight_on
            break
        WinActivate(discord_window)
        ControlClick fight_button_location, discord_window
        Sleep(click_time)
    }
}
