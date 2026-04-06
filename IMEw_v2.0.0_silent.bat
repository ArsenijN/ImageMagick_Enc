::@echo off
>NUL chcp 65001
setlocal enableextensions enabledelayedexpansion
for /f "usebackq tokens=1,2 delims==\" %%a in ("config.txt") do (
    if "%%a" neq "" set "%%a=%%~b"
)

if "%formats%"=="" (
    set "formats=.jpg .jpeg .heic .webp .png .bmp .avif .jxl .jng .dng"
    echo Changing formats to default.
    echo Please, change settings in config.txt^^!
    2>NUL >NUL timeout -t 3
)

::Before 1.5.5:
set Parameters=%ParametersWoConvert%

if "%Language%"=="Ukr" echo Створення папок...
if "%Language%"=="En" echo Making folders...

::FIX: wmic was removed in Windows 11 24H2/25H2. Use PowerShell to get datetime instead.
for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyyMMddHHmmss'"') do set "datetime=%%a"

if "%Language%"=="Ukr" echo Значення змінної datetime: %datetime%
if "%Language%"=="En" echo Datetime variable value: %datetime%

if exist "converted" (
    2>NUL mkdir "converted\.old\%datetime%"
    for %%F in ("converted\*.*") do (
        2>NUL >NUL move "%%F" "converted\.old\%datetime%\"
    )
)
if exist "originals" (
    2>NUL mkdir "originals\.old\%datetime%"
    for %%F in ("originals\*.*") do (
        2>NUL >NUL move "%%F" "originals\.old\%datetime%\"
    )
)

2>NUL mkdir converted
>nul 2>NUL mkdir originals
set ImageCount=1

if "%Language%"=="Ukr" echo Конвертація...
if "%Language%"=="En" echo Converting...

for %%i in (%formats%) do (
    set "sameformats=!sameformats! *%%i"
)

for %%F in (%formats%) do (
    set "format=%%F"
    set "files=0"
    for %%x in (*%%F) do @(set /a files+=1 >nul)
    setlocal enabledelayedexpansion
    for %%x in (*%%F) do (
        set "ImageCount=0"
        set "Difference=0"
        for /F %%G in ('dir /a:-d /s /b "converted" ^| findstr /v /c:"converted\.old\" ^| findstr /v /c:"converted\\.old\\" ^| find /c ":"') do set ImageCount=%%G
        set /a "Difference=ImageCount"
        
        if "%%~dpa"=="%cd%\" (
            if "%Language%"=="Ukr" (
                echo Процесс конвертації %%F: !Difference!/!files!
            )
            if "%Language%"=="En" (
                echo Converting %%F files: !Difference!/!files!
            )
        )
        
        for %%a in (%sameformats%) do (
            if "%%~dpa"=="%cd%\" (
                if "%TOACimg%"=="1" (
                    for %%a in (%sameformats%) do (
                        for /f "delims=" %%b in ('ImageMagick\identify -format "%%[channels]" %%a') do set IdentifyAlpha=%%b
                        if not "!IdentifyAlpha:%substring%=!"=="%IdentifyAlpha%" (
                            echo Image may contains Alpha channel. Moving in converted... ^(%substring%^)
                            2>NUL >NUL move "%%a" "originals\"
                        ) else (
                            echo Image doesn't have Alpha channel. Converting... ^(%substring%.^)
                            ImageMagick\%PreferUse% !Parameters! -quality !quality! "%%a" "converted\%%~na%outformat%"
                            2>NUL >NUL move "%%a" "originals\"
                        )
                    )
                ) else (
                    ImageMagick\%PreferUse% !Parameters! -quality !quality! "%%a" "converted\%%~na%outformat%"
                    2>NUL >NUL move "%%a" "originals\"
                )
            )
        )
        for /F %%G in ('dir /a:-d /s /b "converted\*%format%" ^| find /c ":"') do set /a "ImageCount=%%G"
    )
    if "%Language%"=="Ukr" (
        echo:
        echo Було конвертовано файлів %%F: !Difference!/!files!
    )
    if "%Language%"=="En" (
        echo:
        echo Було конвертовано файлів %%F: !Difference!/!files!
    )
    endlocal
)

if exist "%temp_folder%" rmdir /S /Q "%temp_folder%"
endlocal


set convertedfiles=0 & for %%a in (converted/*.*) do set /a convertedfiles+=1
if "%Language%"=="Ukr" (
echo Конвертування закінчено!
echo Було конвертовано %convertedfiles% файлів.
)
if "%Language%"=="En" (
echo Conversion complete!
echo %convertedfiles% files have been converted.
)


pause
