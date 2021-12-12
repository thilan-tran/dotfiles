args = "-c" & " -l " & """DISPLAY=thilan-pc.local:0.0 konsole -e zsh -ic vim"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0
