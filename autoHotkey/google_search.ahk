#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^g::
clipboard = 
Send,{CTRL Down}c{CTRL Up}
ClipWait  
; MsgBox, %clipboard%
clipb = %clipboard% ; get clipboardText
clipbb := clipb ; clipboard to the new kind of variable
com := "facebook.com"
If clipbb contains .com,.gr,.org,.gov
{
    Run, C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe %clipb%
    return
}
arr := StrSplitByWhiteSpace(clipb) ; split clipboard to array, not used
clipb := StrReplace(clipb, " ", "%20") ; replace spaces with %20 used by google
; MsgBox, % clipb
google := "http://www.google.com/search?q=%20" ; beggining
;http://www.google.com/search?q=
Run, C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe %google%%clipb% ; open ms edge with parameter concatenation of the google string and clipb string
return


StrSplitByWhiteSpace(str)
{
    Arr := []
    Loop, Parse, str, % A_Space
        if (A_LoopField != "")
            Arr.push(A_LoopField)
    return Arr
}