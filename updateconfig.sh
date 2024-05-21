#!/bin/bash

echo "░▒▓████████▓▒░▒▓███████▓▒░▒▓███████▓▒░░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░ ";
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░     ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ ";
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░     ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ ";
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░ ";
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░            ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ ";
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░            ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ ";
echo "░▒▓████████▓▒░▒▓█▓▒░     ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ ";
echo "                                                                        ";
echo "                                                                        ";

#https://github.com/0p3nAI/MalDuino-W-Custom-Web-Interface

echo "Give up a new name for the Web Interface:"
read new_title

file_paths=(
  "web/index.html"
  "web/credits.html"
  "web/error404.html"
  "web/settings.html"
  "web/terminal.html"
)

####### UPDATE TITLE, META AND MENU TITLE #######
for file_path in "${file_paths[@]}"; do
  if [[ -f "$file_path" ]]; then
    sed -i "s|<title>.*</title>|<title>$new_title</title>|" "$file_path"
    sed -i "s|<meta name=\"description\" content=\".*\">|<meta name=\"description\" content=\"$new_title\">|" "$file_path"
    sed -i "s|<li><a href=\"index.html\">.*</a></li>|<li><a href=\"index.html\">$new_title</a></li>|" "$file_path"
    echo "Done-> Page and Menu title changed in $file_path"
  else
    echo "File $file_path does not exist."
  fi
done

####### CHANGE IP ADDRESS #######
echo -e "Do you want to change the IP address? (current: 192.168.4.1) (\e[32my\e[0m/\e[31mn\e[0m)"
read change_ip

if [[ "$change_ip" == "yes" || "$change_ip" == "y" ]]; then
  echo "Give the new IP address (format: xxx.xxx.xxx.xxx):"
  read new_ip

  IFS='.' read -r -a ip_array <<< "$new_ip"

  webserver_file="esp_duck/webserver.cpp"

  if [[ -f "$webserver_file" ]]; then
    sed -i "s|IPAddress apIP(.*);|IPAddress apIP(${ip_array[0]}, ${ip_array[1]}, ${ip_array[2]}, ${ip_array[3]});|" "$webserver_file"
    echo "IP address changed to '$new_ip' in $webserver_file"
  else
    echo "File $webserver_file does not exist."
  fi
fi

####### CHANGE WiFi SSID #######
echo -e "Do you want to change the WiFi SSID? (\e[32my\e[0m/\e[31mn\e[0m)"
read change_ssid

if [[ "$change_ssid" == "yes" || "$change_ssid" == "y" ]]; then
  echo "Give the new WiFi SSID:"
  read new_ssid

  config_file="esp_duck/config.h"

  if [[ -f "$config_file" ]]; then
    sed -i "s|#define WIFI_SSID \".*\"|#define WIFI_SSID \"$new_ssid\"|" "$config_file"
    echo "Done-> changed to '$new_ssid' in $config_file"
  else
    echo "File $config_file does not exist."
  fi
fi

####### CHANGE WiFi password #######
echo -e "Do you want to change the WiFi password? (\e[32my\e[0m/\e[31mn\e[0m)"
read change_password

if [[ "$change_password" == "yes" || "$change_password" == "y" ]]; then
  echo "Give the new WiFi password:"
  read new_password

  config_file="esp_duck/config.h"

  if [[ -f "$config_file" ]]; then
    sed -i "s|#define WIFI_PASSWORD \".*\"|#define WIFI_PASSWORD \"$new_password\"|" "$config_file"
    echo "Done-> changed to '$new_password' in $config_file"
  else
    echo "File $config_file does not exist."
  fi
fi

####### CHANGE HOSTNAME #######
echo -e "Do you want to change the HOSTNAME? (\e[32my\e[0m/\e[31mn\e[0m)"
read change_hostname

if [[ "$change_hostname" == "yes" || "$change_hostname" == "y" ]]; then
  echo "Give the new HOSTNAME: (e.q: myusb)"
  read new_hostname

  config_file="esp_duck/config.h"

  if [[ -f "$config_file" ]]; then
    sed -i "s|#define HOSTNAME \".*\"|#define HOSTNAME \"$new_hostname\"|" "$config_file"
    echo "Done-> changed to '$new_hostname' in $config_file"
  else
    echo "File $config_file does not exist."
  fi
fi

####### CHANGE URL #######
echo -e "Do you want to change the URL? (\e[32my\e[0m/\e[31mn\e[0m)"
read change_url

if [[ "$change_url" == "yes" || "$change_url" == "y" ]]; then
  echo "Give the new URL: (e.q: myusb.tools)"
  read new_url

  config_file="esp_duck/config.h"

  if [[ -f "$config_file" ]]; then
    sed -i "s|#define URL \".*\"|#define URL \"$new_url\"|" "$config_file"
    echo "Done-> changed to '$new_url' in $config_file"
  else
    echo "File $config_file does not exist."
  fi
fi

####### EXECUTE WEBCONVERTER.PY #######
chmod +x webconverter.py
python3 webconverter.py

echo ""
####### FINAL MESSAGE #######
echo "python3 webconverter.py -> Executed succesfully!"
echo "Done -> Everything is updated and ready!"

echo ""
echo "Now FLASH the ESP8266"
echo ""

####### INSTRUCTIONS #######
function display_instructions() {
    echo "1. Open esp_duck/esp_duck.ino with the Arduino IDE."
    echo "2. Under Tools > Board in the WiFi Duck ESP8266 section, select your board."
    echo "3. Connect the Malduino W by holding the A button via USB then select its port under Tools > Port."
    echo "4. Press Upload."
}

display_instructions

echo ""

####### EXITING #######
countdown() {
  local seconds=$1
  while [ $seconds -gt 0 ]; do
    echo -ne "Exiting in $seconds \r"
    sleep 1
    seconds=$((seconds - 1))
  done
  echo -ne "Exiting now! \n"
}

countdown 7

exit 0