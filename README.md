# Toon-HASS

This application is built to integrate some Home Assistant functionalities in Toon thermostat (available in The Netherlands).

> [!NOTE]
>**A rooted Toon is required to be able to use this application**

>[!TIP]
>*An easy rooting method, by software with a USB stick: [Root A Toon USB Stick](https://github.com/ToonSoftwareCollective/Root-A-Toon-USB-Stick)*
>
>*An easy rooting method, by software with a Raspberry Pi: [Root A Toon](https://github.com/ToonSoftwareCollective/Root-A-Toon)*
>
>*An alternative rooting method, by hardware with a Raspberry Pi or USB Blaster: [ToonRooter](https://github.com/martenjacobs/ToonRooter)*

<br>

### Description

This application enable some basic key features on the Toon thermostat.  
These integrations can be used;

* 8 sensors
* 4 scenes
* 5 switches/input_booleans/lights
* 1 input_number (max 6 options)
* 1 custom alarm


 *The HomeAssistant tile on your Toon will show the first 3 configured sensors. If you don't enter an alarm object in the tile, this space will be left empty.*

<br>

## How to install

SSH to Toon:
    *(change [IP TOON] to the IP adress of your Toon)*

```
ssh -oHostKeyAlgorithms=+ssh-rsa root@[IP TOON]
```


Type the following command at the terminal prompt, to download the HomeAssistant app on your Toon, and then press Enter:
```
cd /HCBv2/qml/apps/
```
```
wget https://github.com/markbasgitaar/Toon-HASS/archive/refs/heads/master.zip
```
```
unzip master.zip
```
```
mv ./Toon-HASS-master/homeassistant ./
```
```
rm master.zip
```
```
rm -r Toon-HASS-master
```
```
cd
```

<br>

## How to setup

### * Long-Lived Access Token
You need to manually generate a long-lived access token from your HomeAssistant system and add this token to the 'homeassistant.token.txt' file on your Toon. 
This file is located at: 
> /HCBv2/qml/apps/homeassistant/token.txt

To generate a token navigate to your user profile in the HomeAssistant gui and scroll down to the bottom where you see "Long-Lived Access Tokens" (and press generate). 
*The password textbox in the HomeAssistant app in Toon can be left empty.*

Just type the following command at the terminal prompt, and then press Enter:
```
cat > /HCBv2/qml/apps/homeassistant/token.txt
```

After pressing Enter, you are not returned to the terminal prompt. Instead, the cursor is placed on the next line, and you can start pasting your long-lived access token directly into the file. 
When you are done, press Ctrl+D to exit the file and return to the prompt.

### * Legacy pass
If you still use a password to authenticate with Home Assistant choose 'Legacy pass' on the configuration page of the Toon app and enter your password in the textbox.

### * SSL
If you use SSL and Home Assistant version 0.73.0 or higher make sure to set 'ssl_profile: intermediate' in your Home Assistants configuration.yaml 
(in the http section; https://www.home-assistant.io/components/http/). This is not needed when using the Long-Lived Access token authentication.


Restart the GUI of the Toon using TSC Settings, or run this command by SSH to restart Toons user interface

```
killall qt-gui
```

<br>

## How to use

Add the app called "homeassistant" to a new tile

When starting the app for the first time the screen will be pretty much empty, click on "Instellingen" to configure the app
    
On the configuration page enter the Home Assistant connection info and entity_id's you want to be shown (press the left/right arrows to scroll through sensors/scenes/switches)
Press "Opslaan" to save your configuration. If all is well the information will be retrieved from your Home Assistant system

Friendly names configured in your Home Assistant config are used to show the objects on the Toon. So make sure all items you want Toon to show have a friendly name.

All objects are refreshed every minute (because of the sensor info located on the tile)
Upon opening the app, pressing the "Opslaan" button on the configuration screen and by pressing the Home Assistant image on the app home screen (top right).
