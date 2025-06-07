#Requires AutoHotkey v2.0
#SingleInstance Force



function1()
{
    g := Gui() 
    g.Add("Text",,"Project BEB : beb")
    g.Add("Text",,"DOTAGENT : dotagent")
    g.Add("Text",,"LAB : lab")
    g.Add("Text",,"Steam : steam")
    g.Add("Text",,"DOTAGENT DOC CODE : dotagentdoc")
    g.Add("Text",,"AHK : ahk")
    g.Add("Text",,"GameMaker Studio : gmsl")
    g.Add("Text",,"Discord : disc")
    g.Add("Text",,"Proton VPN : vpn1")
    g.Add("Text",,"C++ Projects cgp")
    g.Add("Text",,"Timestamp Creation : tc")
    g.Add("Text",,"SDL_DEV : gd")
    g.Add("Text","x220 y10","Warp : warp")
    g.Add("Text",,"Opera GX : gx")
    g.Add("Text",,"Obsidian : obby")
    g.Add("Text",,"Minecraft : mcforge")
    g.Add("Text",,"VALORANT : valo")
    g.Add("Text",,"Coding Folder : codf")
    g.Add("Text",,"Movies : movies")
    g.Add("Text",,"Notes : notes")
    g.Add("Text",,"Xournal : xnotes")
    g.Add("Text",,"Turn On Warp : warpon")
    g.Add("Text",,"CPH BOOK : cph")
    g.Add("Text",,"Sublime Text : sublime")
    g.Add("Text","x440 y10","Glaze : GlazeWM")
    g.Add("Text",,"Project Z : pjz")
    g.Add("Text",,"BEB ARPG : brpg")
    g.Add("Text","x300 y400","Enter the code of the file you want to open : ")
    g.Add("Edit","vcode")
    g.Add("Button", "default", "OK").OnEvent("Click", ProcessUserInput)
    g.BackColor := "Silver"
    g.Show("w800 h500")


    ProcessUserInput(*)
    {
        Saved := g.Submit()  ; Save the contents of named controls into an object.
        beb := "beb"
        dotagent := "dotagent"
        lab := "lab"
        steam := "steam"
        dotagentdoc := "dotagentdoc"
        ahk := "ahk"
        gmsl := "gmsl"
        disc := "disc"
        vpn1 := "vpn1"
        warp := "warp"
        gx := "arc"
        obby := "obby"
        mcforge := "mcforge"
        valo := "valo"
        codingfolder := "codf"
        movies := "movies"
        notes := "notes"
        xnotes := "xnotes"
        warpon := "warpon"
        cph := "cph"
        cgp := "cgp"
        tc := "tc"
        gd := "gd"
        sublime := "sublime"
        glaze := "gwm"
        If (beb == Saved.code)  ; If the user entered something:
            Run "D:\Coding\Workspaces\ProjectBeb.code-workspace"
        Else If (dotagent == Saved.code)
            Run "D:\Coding\Workspaces\nextpy-development.code-workspace"
        Else If (lab == Saved.code)
            Run "D:\Coding\Workspaces\LAB.code-workspace"
        Else If (steam == Saved.code)
            Run "F:\Steam\steam.exe"
        Else If (dotagentdoc == Saved.code)
            Run "D:\Coding\Workspaces\nextpy-documentation.code-workspace"
        Else If (ahk == Saved.code)
            Run "D:\Coding\Workspaces\AHK.code-workspace"
        Else If (gmsl == Saved.code)
            Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\GameMaker\GameMaker.lnk"
        Else If (disc == Saved.code)
            Run "C:\Users\vipin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk"
        Else If (vpn1 == Saved.code)
            Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Proton\Proton VPN.lnk"
        Else If (warp == Saved.code)
            Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cloudflare\Cloudflare WARP.lnk"
        Else If (gx == Saved.code)
            Run "D:\ShortCuts\Arc.lnk"
        Else If (obby == Saved.code)
            Run "C:\Users\vipin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Obsidian.lnk"
        Else If (mcforge == Saved.code)
            Run "C:\XboxGames\Minecraft Launcher\Content\Minecraft.exe"
        Else If (valo == Saved.code)
            Run "C:\Users\vipin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Riot Games\VALORANT.url"
        Else IF (codingfolder == Saved.code)
            Run "D:\Coding"
        Else If (movies == Saved.code)
            Run "D:\Movies"
        Else If (notes == Saved.code)
            Run "D:\Notes"
        Else If (xnotes == Saved.code)
            Run "D:\Xournal" 
        Else If (cph = Saved.Code)
            Run "D:\book.pdf"
        Else If (cgp = Saved.Code)
            Run "D:\Coding\Workspaces\C++.code-workspacew.code-workspace"
        Else If(tc = Saved.Code)
            Run "D:\Coding\C++\Discord Timestamp CLI tool\main.exe"
        Else If(gd = Saved.Code)
            Run "C:\Dev\SDL_DEV\SDL_DEV.sln"
        Else If(sublime = Saved.Code)
            Run "D:\Softwares\Sublime Text\sublime_text.exe"
        Else If (glaze = Saved.Code)
            Run "C:\Program Files\glzr.io\GlazeWM\cli\glazewm.exe"
        Else If ("pjz" == Saved.code)
            Run "D:\Coding\Workspaces\ProjectZ-workspace.code-workspace" 
        Else If ("brpg" == Saved.code)
            Run "D:\Coding\Workspaces\beb-arpg-workspace.code-workspace"
        Else
            MsgBox("Please Enter the Correct code")
    }

}

!U::function1() 

; To work around GlazeWM using !1, !2, etc.
#HotIf WinActive("ahk_exe Arc.exe")
^!1:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{1}")
    Sleep(50)
    Send("!+{p}")
}

^!2:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{2}")
    Sleep(50)
    Send("!+{p}")
}

^!3:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{3}")
    Sleep(50)
    Send("!+{p}")
}

^!4:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{4}")
    Sleep(50)
    Send("!+{p}")
}

^!5:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{5}")
    Sleep(50)
    Send("!+{p}")
}

^!6:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{6}")
    Sleep(50)
    Send("!+{p}")
}

^!7:: {
    Send("!+{0}")
    Sleep(50)
    Send("!{7}")
    Sleep(50)
    Send("!+{p}")
}
#HotIf





 



