@echo off
if exist X:\uip goto updateip
:1
color 1f
taskkill /f /im explorer.exe
cls
title WinBrew
echo benvenuto in
echo WinBrew!
echo Cosa vuoi fare?
echo 1. Torna a Windows
echo 2. esegui app (C.C.)
echo 3. esegui come SYSTEM
echo 4. controllo utente
echo 5. Aggiornamento
echo 6. spegni
set /p input=
if /i %input%== 1 goto wb
if /i %input%==2 goto app
if /i %input%==3 goto sys
if /i %input%==4 goto usercheck
if /i %input%==5 goto updateopt
if /i %input%==6 goto shutdown

:wb
cls
echo sei sicuro di voler tornare a Windows?
echo (Y/N)
set /p input=
if /i %input%== Y goto wby
if /i %input%==N goto 1

:wby
echo torno a Windows...
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
echo Seleziona un app (C.C.)
echo da avviare
echo.
echo per avviare un app (CC.C.)
echo rinominala "ccc-app.bat"
echo.
echo.
echo 1. "app cc.c."
echo 2. HFWFW CFW
echo 3. menu precedente
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
echo spegnimento...
shutdown -s -t 1
goto shutdown

:runsys
runas /user:SYSTEM X:\WinBrew
pause
goto wby

:sys
cls
echo Eseguire codice non autorizzato come SYSTEM è rischioso!
echo Sei sicuro di volerlo fare?
echo (Y/N)
set /p input=
if /i %input%== Y goto runsys
if /i %input%==N goto 1
goto sys

:usercheck
cls
echo L'utente è:
whoami
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
echo cosa vuoi fare?
echo 1. Esegui un aggiornamento online
echo 2. Esegui un aggiornamento offline
echo 3. Torna indietro
set /p input=
if /i %input%== 1 goto hbonupdate
if /i %input%==2 goto hboffupdate
if /i %input%==3 goto 1
goto updateopt

:hboffupdate
cls
echo per eseguire l'aggiornamento è necessario avere i file dell'Aggiornamento!
echo per installarlo mettilo nella cartella X:\hb\update\offline
echo e rinominalo "hboffupdate.bat"
X:
md X:\hb
cd hb
md update
cd update
md offline
cd offline
pause
hboffupdate.bat
echo file di aggiornamento non trovato
echo crontrolla e riprova, se non si dispone
echo del file di aggiornamento si può scaricare da github
echo oppure si può eseguire un aggiornamento online
pause
goto updateopt

:hbonupdate
echo eseguire l'aggiornamento online?
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
powershell -c "Invoke-WebRequest -Uri 'https://github.com/HALLOOO178/GodMode/releases/download/GodMode-beta-0.0.3/WinBrew.bat' -OutFile 'X:\hb.bat'"
pause
md X:\uip
cd \
hb.bat
echo impossibile avviare la versione aggiornata del firmware

:updateip
echo sto continnuando l'aggiornamento...
X:
cd \
rename WinBrew.bat old.bat
complete.bat
echo impossibile completare l'aggiornamento
pause
goto 1