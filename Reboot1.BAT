@ECHO OFF
COPY C:\JOIN\STAGE2.BAT "C:\WINNT\Profiles\Administrator\Start Menu\Programs\Startup\"
"C:\Join\WAIT.EXE" 10
"C:\Join\SHUTDOWN.EXE" /L /R /T:05 /Y /C
DEL "C:\WINNT\Profiles\Administrator\Start Menu\Programs\Startup\REBOOT1.BAT"