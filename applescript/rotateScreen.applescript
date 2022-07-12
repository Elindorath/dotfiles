if application "System Preferences" is running then
  tell application "System Preferences" to quit
end if
tell application "System Preferences"
  activate
  set current pane to pane "com.apple.preference.displays"
end tell

tell application "System Events"
  tell process "System Preferences"
    tell window "Q3277 (2)"
      tell pop up button 2 of tab group 1
        click
        set V to value
        if V is "Standard" then
          pick menu item "90°" of menu 1
        else
          pick menu item "Standard" of menu 1
        end if
      end tell
      if V is "Standard" then
        repeat until exists sheet 1
          delay 0.2
        end repeat
        click button 1 of sheet 1
      end if
    end tell
  end tell
end tell

tell application "System Preferences" to quit
