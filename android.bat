:: Script Author: Juanjo Rubio (juanjopuntcat) - https://www.linkedin.com/in/juanjopuntcat/
:: Script version: 1.0

:: RUN THIS SCRIPT UNDER YOUR RESPONSABILITY. I HAVE USED SEVERAL TIMES SUCCESSFULLY, THAT'S THE REASON OF SHARING IT ON GITHUB.
:: ALWAYS BACK UP THE IMPORTANT DATA. THIS SCRIPT IS PROVIDED "AS IS". Contributions are welcome, enjoy!

:: Step 00: Download Android Developer Bridge (ADB) from this source (https://developer.android.com/studio/releases/platform-tools) and install it.

:: Step 01: Enable Developer Options on Android.
::			 This process may be different depending on the device, refer to your device's manufacturer website or manual.

:: Step 02: Enable USB Debugging inside Developer Options on Android.

:: Step 03: Connect the device via USB to the PC.

:: Step 04: Android will prompt a message with a token and will ask if you want to enable USB Debugging. Tap on "Allow".

:: Step 05: Open your PC console (eg. CMD, PowerShell, Windows Terminal...) and cd to the folder where you've installed ADB.

:: Step 06: Write the following command: .\adb.exe tcpip 5555 (5555 is the port where we'll run ADB, you can change it if you want).

:: Step 07: ADB will be restarted. The console will prompt a message saying: "restarting in TCP mode port: <your_port>".
::		     Your Android device will prompt again a message with a token and will ask if you want to enable USB Debugging. Tap on "Allow".

:: Step 08: Open the file Android.bat with Notepad or your favourite code editor (eg. Notepad++, Sublime Text, Visual Studio Code...)

:: Step 09: Write the IP of your Android device on the variable "deviceip"

:: Step 10: Write the ADB Port (5555 or the port you've set on Step 6) on the variable "adbport"

:: Step 11: The variable "filestring" is what will tell the script what we want to push from the Android device to the PC. 
:: 		 By default, WhatsApp stores the media under "IMG-<year><month><day>-WA<number>.JPG".
::          On the example given, the script will push the WhatsApp images from Android whose name starts with "IMG-201912"

:: Step 12: On the console, write the following command: .\android.bat
::			 This will start executing the script.


@echo off

set deviceip=192.168.1.42
set adbport=5555

set appname=WhatsApp
set filetype=IMG
set filestring=IMG-202001*

chcp 65001

echo L'script per començar la còpia dels fitxers des del dispositiu Android ha començat la seva execució.
echo[
echo Aplicació d'origen: %appname%
echo Tipus de fitxers: %filetype%
echo Data: %filestring%
echo[

rem .\adb.exe tcpip %adbport%
rem .\adb.exe connect %deviceip%

echo IP del dispositiu Android: %deviceip%
echo Port d'execució d'ADB: %adbport%
echo[

.\adb.exe shell ls "/sdcard/WhatsApp/Media/*/%filestring%" >_temp

setlocal EnableDelayedExpansion
for /f "delims=" %%i in (_temp) do (
    echo %%i>_temp
    set /p file=<_temp
    echo Copiant fitxer: !file!
    .\adb.exe pull "!file!"
)
setlocal DisableDelayedExpansion
del _temp

echo Els fitxers s'han copiat al dispositiu.

.\adb.exe shell rm "/sdcard/WhatsApp/Media/*/%filestring%"

echo Els fitxers han estat eliminats del dispositiu Android.