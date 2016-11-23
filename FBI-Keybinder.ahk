#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive, GTA:SA:MP ; Folgende Hotkeys Funktionieren nur wenn GTA SA:MP geöffnet ist
#UseHook
#SingleInstance, Force

KeybinderState := 1

#include SAMP.ahk
#include utils.ahk
#Persistent

Gui:
Gui, Add, Tab2, x0 y0 w570 h540 , Startseite
Gui, Tab, Startseite
Gui, Add, Text, x12 y230 w380 h150 , Willkommen im FBI Keybinder von City of SA. Fragen bitte im internen Bereich stellen.
Gui, Add, Picture, x102 y30 w200 h190 , .\fbi.png
Gui, Show, w410 h490, FBI Keybinder - City of SA
return

GuiClose:
ExitApp

~1::
if (CanUseKeybinds() == false)
    return

SendChat("Guten Tag, Sir. Mein Name ist " getUsername() " und ich arbeite für das FBI. Ich würde Ihnen gerne ein paar Fragen stellen.")
return

~Numpad2::
if (!CanUseKeybinds())
    return

SendChat("/m >> FBI, stoppen Sie bitte Ihr Fahrzeug und fahren Sie an den rechten Seitenrand! <<")
return

~Numpad3::
if (!CanUseKeybinds())
    return

SendChat("/m >> FBI, machen Sie bitte umgehend die Straße frei! <<")
return

~LAlt & h::
if (KeybinderState == 1)
{
    KeybinderState := 0
    AddChatMessageEx("Der Keybinder wurde deaktiviert.")
}
else
{
    KeybinderState := 1
    AddChatMessageEx("Der Keybinder wurde aktiviert.")
}
return

~<::
SendInput t/find{space}
return

~LAlt & <::
SendChat("/findstop")
return
