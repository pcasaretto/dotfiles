on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning

on execInTerminalTab(_window, _tab, _command)
	tell application "Terminal"
		activate
		set frontmost of _window to true
		set selected of _tab to true
		do script _command in _tab
	end tell
end execInTerminalTab

on run argv
	set _command to item 1 of argv
	set _foundTab to false
	-- Second argument should be the tty to look for
	if length of argv is 2 then
		tell application "Terminal"
			repeat with w in windows
				tell w
					repeat with t in tabs
						set _tty to (tty of t)
						if _tty = (item 2 of argv) then
							set _foundTab to true
							set _window to w
							set _tab to t
							exit repeat
						end if
					end repeat
				end tell
				if _foundTab then
					exit repeat
				end if
			end repeat
		end tell
		if _foundTab then
			execInTerminalTab(_window, _tab, _command)
		end if
	end if
end run

