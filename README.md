# Toon-HASS

This application is built to integrate some Home Assistant functionalities in Toon thermostat (available in The Netherlands). A rooted Toon is required to be able to use this application. 

If you use SSL and Home Assistant version 0.73.0 or higher make sure to set 'ssl_profile: intermediate' in your Home Assistants configuration.yaml (in the http section; https://www.home-assistant.io/components/http/).

My main goal was to enable some key features on the Toon thermostat so i didn't need a second screen on the wall. For extended details about my home automation I will grab my laptop. With this idea in mind I built integration for;
- 8 sensors
- 4 scenes
- 5 switches/input_booleans
- 1 input_number (max 6 options)
- 1 custom alarm

The tile will show the first 3 configured sensors. If you don't enter an alarm object, this space will be left empty. 

I'm not a developer so I'm sure the code isn't what it should be, if you have any remarks or hints/tips about some pieces of code please let me know.


How to install:
1. Copy the homeassistant folder to Toon directory "/HCBv2/qml/apps/"
2. On firmware before 4.16 edit file "/HCBv2/qml/qb/base/Globals.qml"; Add ""homeassistant"," to the list of apps to load (make sure to save your changes)

![alt text](https://github.com/Luc-S/Toon-HASS/blob/master/README%20images/Globals.qml.png)

3. Run command "killall qt-gui" to restart Toons user interface
4. Add the app called "homeassistant" to a new tile

![alt text](https://github.com/Luc-S/Toon-HASS/blob/master/README%20images/tile.png)

![alt text](https://github.com/Luc-S/Toon-HASS/blob/master/README%20images/tile_dim.png)

5. When starting the app for the first time the screen will be pretty much empty, click on "Instellingen" to configure the app
6. On the configuration page enter the Home Assistant connection info and entity_id's you want to be shown (press the left/right arrows to scroll through sensors/scenes/switches)

![alt text](https://github.com/Luc-S/Toon-HASS/blob/master/README%20images/configuration.png)

7. Press "Opslaan" to save your configuration. If all is well the information will be retrieved from your Home Assistant system

![alt text](https://github.com/Luc-S/Toon-HASS/blob/master/README%20images/configured.png)


Friendly names configured in your Home Assistant config are used to show the objects on the Toon. So make sure all items you want Toon to show have a friendly name. 

All objects are refreshed every minute (because of the sensor info located on the tile), upon opening the app, pressing the "Opslaan" button on the configuration screen and by pressing the Home Assistant image on the app home screen (top right).
