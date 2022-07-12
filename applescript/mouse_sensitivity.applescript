set trackingValue to 6

if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if

tell application "System Preferences" to activate

tell application "System Events"
	tell process "System Preferences"
		try
			click menu item "Mouse" of menu "View" of menu bar 1
			delay 2
			set value of slider "Tracking Speed" of window "Mouse" to trackingValue
		on error err
			display dialog ("Sorry, an error occured while altering Keyboard and Mouse settings:" & return & err) buttons "OK" default button "OK"
		end try
	end tell
end tell
