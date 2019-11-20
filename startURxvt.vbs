args = "-c" & " -l " & """DISPLAY=:0 xrdb -merge ~/.Xresources && DISPLAY=:0 urxvt"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0