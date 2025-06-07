#Requires AutoHotkey v2.0
#SingleInstance Force


    openwindow(){
        if WinActive("blackout.ahk"){
            return
        }
        scrn := Gui("+AlwaysOnTop")
        scrn.BackColor := "Black"
        scrn.Show("w9000 h2000")
    }

    closewindow(){
        if WinActive("blackout.ahk"){
            WinClose("blackout.ahk")
        }
    }


^!U::openwindow()
^!I::closewindow()