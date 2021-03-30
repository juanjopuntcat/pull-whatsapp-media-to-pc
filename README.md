# Pull WhatsApp Media from Android to a Windows PC
This little BAT script will help you pulling your WhatsApp images and videos from Android to a Windows PC. I've writed this script because I receive many media I want to save, but the memory on my mobile phone is limited and connecting the device via MTP can be a nightmare.

This script connects to Android via TCP-IP with ADB and pushes the media to the PC via wifi.

## Instructions

Step 00: Download Android Developer Bridge (ADB) from this source (https://developer.android.com/studio/releases/platform-tools) and install it.

Step 01: Enable Developer Options on Android. This process may be different depending on the device, refer to your device's manufacturer website or manual.

Step 02: Enable USB Debugging inside Developer Options on Android.

Step 03: Connect the device via USB to the PC.

Step 04: Android will prompt a message with a token and will ask if you want to enable USB Debugging. Tap on "Allow".

Step 05: Open your PC console (eg. CMD, PowerShell, Windows Terminal...) and cd to the folder where you've installed ADB.

Step 06: Write the following command: .\adb.exe tcpip 5555 (5555 is the port where we'll run ADB, you can change it if you want).

Step 07: ADB will be restarted. The console will prompt a message saying: "restarting in TCP mode port: <your_port>". Your Android device will prompt again a message with a token and will ask if you want to enable USB Debugging. Tap on "Allow".

Step 08: Open the file Android.bat with Notepad or your favourite code editor (eg. Notepad++, Sublime Text, Visual Studio Code...)

Step 09: Write the IP of your Android device on the variable "deviceip"

Step 10: Write the ADB Port (5555 or the port you've set on Step 6) on the variable "adbport"

Step 11: The variable "filestring" is what will tell the script what we want to push from the Android device to the PC.  By default, WhatsApp stores the media under "IMG-<year><month><day>-WA<number>.JPG". On the example given, the script will push the WhatsApp images from Android whose name starts with "IMG-201912"

Step 12: On the console, write the following command: .\android.bat. This will start executing the script.
