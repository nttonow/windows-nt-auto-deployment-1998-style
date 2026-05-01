@ECHO OFF

REM ============================================================
REM STAGE1.BAT - Computer Rename Script
REM Runs locally on first boot after Ghost deploy
REM ============================================================

ECHO Stage 1 started > C:\JOIN\LOG.TXT
ECHO %TIME% >> C:\JOIN\LOG.TXT
ECHO %DATE% >> C:\JOIN\LOG.TXT

REM --- Get MAC address ---
ECHO Getting MAC address... >> C:\JOIN\LOG.TXT
FOR /F "tokens=*" %%A IN ('ipconfig /all') DO (
    ECHO %%A | FIND "Physical Address" > NUL
    IF NOT ERRORLEVEL 1 SET MACLINE=%%A
)
ECHO MACLINE=%MACLINE% >> C:\JOIN\LOG.TXT

REM --- Extract MAC address from line ---
FOR /F "tokens=2 delims=:" %%A IN ("%MACLINE%") DO SET MACADDR=%%A
ECHO MACADDR=%MACADDR% >> C:\JOIN\LOG.TXT

REM --- Extract last three octets ---
FOR /F "tokens=4-6 delims=-" %%A IN ("%MACADDR%") DO SET SUFFIX=%%A%%B%%C
ECHO SUFFIX=%SUFFIX% >> C:\JOIN\LOG.TXT

REM --- Build computer name ---
SET COMPNAME=WKST-%SUFFIX%
ECHO COMPNAME=%COMPNAME% >> C:\JOIN\LOG.TXT

REM --- Write reg file locally with dynamic name ---
ECHO Writing SETNAME.REG... >> C:\JOIN\LOG.TXT
ECHO REGEDIT4 > C:\JOIN\SETNAME.REG
ECHO. >> C:\JOIN\SETNAME.REG
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName] >> C:\JOIN\SETNAME.REG
ECHO "ComputerName"="%COMPNAME%" >> C:\JOIN\SETNAME.REG
ECHO. >> C:\JOIN\SETNAME.REG
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName] >> C:\JOIN\SETNAME.REG
ECHO "ComputerName"="%COMPNAME%" >> C:\JOIN\SETNAME.REG
ECHO SETNAME.REG written >> C:\JOIN\LOG.TXT

REM --- Import the registry file ---
ECHO Importing SETNAME.REG... >> C:\JOIN\LOG.TXT
REGEDIT /S C:\JOIN\SETNAME.REG
ECHO REGEDIT returned %ERRORLEVEL% >> C:\JOIN\LOG.TXT


REM --- Clean up ---
DEL C:\JOIN\SETNAME.REG
ECHO Cleanup done >> C:\JOIN\LOG.TXT

REM --- Reboot ---
ECHO Rebooting... >> C:\JOIN\LOG.TXT
COPY C:\JOIN\REBOOT1.BAT "C:\WINNT\Profiles\Administrator\Start Menu\Programs\Startup\"

