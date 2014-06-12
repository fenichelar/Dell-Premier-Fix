@echo off

:Ask

echo 1 Normal Mode
echo 2 Dell Premier Mode
echo 3 Quit and Normal Mode

Choice /C 123 /M "Select a setting to apply"

If Errorlevel 3 Goto Done
If Errorlevel 2 Goto Premier
If Errorlevel 1 Goto Normal

Goto Done


:Normal
netsh interface ip set dns name="Local Area Connection" source=dhcp
echo.
echo Normal Mode Set
echo.
echo.
Goto Ask


:Premier
netsh interface ip set dns name="Local Area Connection" source=static addr=8.8.8.8
netsh interface ip add dns name="Local Area Connection" addr=8.8.4.4 index=2
echo Dell Premier Mode Set
echo.
echo.
Goto Ask


:Done
netsh interface ip set dns name="Local Area Connection" source=dhcp
echo Quiting