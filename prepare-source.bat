@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "source_dir=.\source"
set "index_html=.\index.html"
set "counter=0"

for %%f in ("%source_dir%\*") do (
    set "new_name=!counter!%%~xf"
    ren "%%f" "!new_name!"
    set /a counter+=1
)

(
    for /f "delims=" %%i in (%index_html%) do (
        set "line=%%i"
        echo !line! | findstr /r /c:"const max = [0-9]*;" >nul
        if !errorlevel! == 0 (
            setlocal enabledelayedexpansion
            endlocal & set "line=!line:=asdasd!"
        )
        echo !line!
    )
) > index.tmp
move /y index.tmp %index_html% >nul

del { >nul 2>&1

endlocal
exit
