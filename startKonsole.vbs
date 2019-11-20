args = "-c" & " -l " & """DISPLAY=:0 konsole"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0