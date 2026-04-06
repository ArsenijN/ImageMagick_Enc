@echo off
>NUL chcp 65001
setlocal enableextensions enabledelayedexpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
for /f %%a in ('"prompt $H&for %%b in (0) do rem"') do set "BS=%%a"

::echo ^<ESC^>[92m [92mGreen[0m
type logo
@REM logo maked in https://patorjk.com/software/taag/#p=display&f=3D%20Diagonal&t=AIC
@REM IDK how to make "type" text: https://chat.openai.com/share/e369a9b8-938d-4909-95a4-111ae2993141
@REM echo ImageMagick converter v.2.0.1

@REM Colored text with powershell: https://stackoverflow.com/questions/2048509/how-to-echo-with-different-colors-in-the-windows-command-line
powershell write-host -fore Green ImageMagick converter v.2.0.1
powershell write-host -fore DarkGray -back Black 2023-2026. Open source. GitHub: https://github.com/ArsenijN/ImageMagick_Enc
echo Read config...
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

if "%Language%"=="Ukr" set /p quality=Введіть налаштування якості 0..100 (примітка: для lossless форматів буде встановлено значення 100): 
if "%Language%"=="En" set /p quality=Enter a quality setting of 0..100 (note: lossless formats will be set to 100): 

if "%Language%"=="Ukr" echo Створення папок...
if "%Language%"=="En" echo Making folders...

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
        echo Converted %%F files: !Difference!/!files!
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
