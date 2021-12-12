args = "-c" & " -l " & """DISPLAY=thilan-pc.local:0.0 konsole"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0
