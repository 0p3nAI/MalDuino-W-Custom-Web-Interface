# MalDuino W | Custom Web Interface

Customize the **Web Interface** from your **Malduino W** just the way you want it!

- Change -> Page Title
- Change -> Menu Title
- Change -> IP Address
- Change -> WiFi SSID
- Change -> WiFi Password
- Change -> Hostname
- Change -> URL

And much more!


### Example: 
![](https://i.ibb.co/m4vTh2D/My-USB-EXAMPLE.png)

## Edit Web Files

If you would like to modify the web interface, you can!
The `web/` folder contains all `.html`, `.css`, `.js` files.

You can edit and modify every page just like how you want it!

To get the new files onto the ESP8266, run `python3 webconverter.py` in the
repository folder. It gzips all files inside `web/`, converts them into a hex array
and saves it in `esp_duck/webfiles.h`.

OR

#### Auto Update Config 
I have created a bash script that will do it automatically for you :wink:
Just execute: `bash updateconfig.sh` in the repository folder.

Now you just need to **FLASH** the **ESP8266** again.



------------



## Install Arduino & ESP8266 Board

1. Download and install the [Arduino IDE](https://www.arduino.cc/en/main/software).
2. Start the Arduino IDE, go to `File` > `Preferences`.
3. At *Additional Board Manager ULRs* enter `https://raw.githubusercontent.com/SpacehuhnTech/arduino/main/package_spacehuhn_index.json`. You can add multiple URLs, separating them with commas.
4. Go to `Tools` > `Board` > `Board Manager`, search for `wifi duck` and install  `WiFiDuck ESP8266 Boards`.

If you can't find the COM port of ESP8266 board, then you're probably missing the right drivers.
Here are links to drivers of the 2 most used UART chips on ESP8266 development boards:
- :floppy_disk: [CP2102](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)
- :floppy_disk: [CH340](https://sparks.gogo.co.nz/ch340.html)

## Flash ESP8266

1. Open `esp_duck/esp_duck.ino` with the Arduino IDE.
2. Under `Tools` > `Board` in the `Malduino W (ESP8266)` section, select your board.
3. Connect the **Malduino W ** by holding the **A** button via USB then select its port under `Tools` > `Port`.
5. Press Upload.

**Done**: You just flashed your **Malduino W**  with your customized pages :smirk:
