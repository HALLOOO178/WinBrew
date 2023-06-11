@echo off
:1
color 1f
taskkill /f /im explorer.exe
cls
title WinBrew
echo Welcome in
echo WinBrew
echo What do you want to do?
echo 1. Go back to Windows
echo 2. Run App (C.C.)
echo 3. run as system
echo 4. user check
echo 5. run update
echo 6. power off
set /p input=
if /i %input%== 1 goto wb
if /i %input%==2 goto app
if /i %input%==3 goto sys
if /i %input%==4 goto usercheck
if /i %input%==5 goto updateopt
if /i %input%==6 goto shutdown

:wb
cls
echo are you sure to go back to Windows?
echo (Y/N)
set /p input=
if /i %input%== Y goto wby
if /i %input%==N goto 1

:wby
echo going back to Windows...
explorer
exit
goto wbyerr

:wbyerr
cls
color 0f
echo Error-Code 056-391-925
echo.
echo  Unable to boot.
echo.
echo for more info visit the site
echo https:\\Win.Brew.com\err\ub\info.html
pause
cls
echo go back to the home menu?
pause
goto 1

:app
cls
echo Select an app to run
echo.
echo to run an app (CC.C.)
echo rename it "ccc-app.bat"
echo and put it in the X:\ccapp\cccapp directory
echo.
echo.
echo 1. "app cc.c."
echo 2. boot HFWFW
echo 3. go back
set /p input=
if /i %input%== 1 goto cccapp
if /i %input%== 2 goto HFWFW
if /i %input%== 3 goto 1

:cccapp
cls
X:
cd ccapp
cd cccapp
ccc-app.bat
goto wbyerr

:shutdown
cls
echo shutting down
shutdown -s -t 1
goto shutdown

:usercheck
cls
echo the user is:
whoami
pause
goto 1

:sys
cls
echo Running custom code as System is riskious!
echo Are you sure that you want to do that?
echo (Y/N)
set /p input=
if /i %input%== Y goto runsys
if /i %input%==N goto 1
goto sys

:runsys
runas /user:SYSTEM X:\WinBrew
echo an error has accoured
pause
goto 1

:HFWFW
cls
echo Welcome in:
echo /\   /\  II-----I
echo II   II  II-----I
echo II___II  II_____
echo II---II  II-----I
echo II   II  II         WFW
echo.
echo.
echo Load patched version of Windows?
echo (Y/N)
set /p input=
if /i %input%== Y goto runcfw
if /i %input%==N goto 1
goto HFWFW

:runcfw
systeminfo
explorer
exit

:updateopt
cls
echo What do you want to do?
echo 1. run online update
echo 2. run offline update
echo 3. go back
set /p input=
if /i %input%== 1 goto hbonupdate
if /i %input%==2 goto hboffupdate
if /i %input%==3 goto 1
goto updateopt

:hboffupdate
cls
echo to run an offline update
echo put the update installer in the X:\hb\update\offline directory
echo and rename it "hboffupdate.bat"
X:
md X:\hb
cd hb
md update
cd update
md offline
cd offline
pause
hboffupdate.bat
echo unable to run update
pause
goto updateopt

:hbonupdate
echo Run online update?
echo (Y/N)
set /p input=
if /i %input%== Y goto updateingon
if /i %input%==N goto updateopt
goto hbonupdate

:updateingon
X:
md hb
cd hb
md update
cd update
md online
cd online
md extracted_update
powershell -c "Invoke-WebRequest -Uri 'https://github.com/HALLOOO178/GodMode/releases/download/GodMode-beta-0.0.3/WinBrew-en.bat' -OutFile 'X:\hb.bat'"
pause
md X:\uip
cd \
hb.bat
echo unable to continue update, try to install it manually

:updateip
echo i'm continueing the update...
X:
cd \
rename WinBrew.bat old.bat
complete.bat
echo unable to complete the update, try to install it manually
pause
goto 1