@echo off
setlocal enabledelayedexpansion
call :echo3 %*
goto:eof

:echo3
set "text=%~1"
for /f "tokens=1* delims=$" %%a in ("%~1") do (
set "current=%%a"
if not "%text:~0,1%"=="$" set "current=07!current!"
if not "%%a" == "" call :color !current:~0,2! "!current:~2!"
if not "%%b" == "" call :echo3 "$%%~b"
)
goto:eof

:color
for /f "tokens=1 delims=#" %%x in ('"prompt $H# & echo on & for %%z in (1) do rem"') do set DEL=%%x
<nul set /p ".=%DEL%">"%~2"
findstr /v /a:%1 /r "^$" "%~2" nul
del "%~2">nul 2>&1
goto :eof