#SingleInstance Force

^!8:: ExitApp
SetTimer(funnc,3000)

funnc(){
    SetTimer(funnc2, -1000)
}

funnc2(){
    MsgBox("Bye")
}