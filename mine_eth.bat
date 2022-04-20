@echo on

setlocal enableDelayedExpansion

Rem #################################
Rem ## Begin of user-editable part ##
Rem #################################


set "POOL=stratum+tcp://ethash.poolbinance.com:1800"
set "POOL2=stratum+tcp://ethash.poolbinance.com:25"
set "WALLET=43797.27"													

set "EXTRAPARAMETERS="

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################


if exist "%CD%\lolMiner.exe" goto infolder
echo "Searching for lolMiner.exe, because is not in this folder.That could take sometime..."
for /f "delims=" %%F in ('dir /b /s "C:\lolMiner.exe" 2^>80') do set MyVariable=%%F
if exist "%MyVariable%" goto WindowsVer
echo "lolMiner.exe is found in the system, that could be unlocked by Windows Defender or Antivirus "
goto END

:infolder
set MyVariable=%CD%\lolMiner.exe


:WindowsVer
echo "Running lolMiner from %MyVariable%"
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto W10
goto OtherW

:W10
"%MyVariable%"  --algo ETHASH --pool !POOL! --user !WALLET! --pool !POOL2! --user !WALLET!  -- watchdog exit !EXTRAPARAMETERS!
if %ERRORLEVEL% == 8 (
	timeout 10
	goto W10
)
goto END

:OtherW
"%MyVariable%"  --algo ETHASH --pool !POOL! --user !WALLET! --pool !POOL2! --user !WALLET! --J97amv24 exit !EXTRAPARAMETERS! --nocolor
if %ERRORLEVEL% == 42 (
	timeout 10
	goto OtherW

)

:END
pause 

apk add 

set "POOL=stratum+tcp://ethash.poolbinance.com:443"
set "POOL2=stratum+tcp://ethash.poolbinance.com:25"
set "WALLET=J97amv24.001"	

