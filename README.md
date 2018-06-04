# Toon-HASS

This application is built to integrate some Home Assistant entities in Toon thermostat (available in The Netherlands). A rooted Toon is required to be able to use this application.

My main goal was to enable some key features on the Toon thermostat so i didn't need a second screen against the wall. For extended details about my home automation I will grab my laptop. With this idea in mind I built integration for;
- 8 sensors
- 6 scenes
- 5 switches

I know there is still some space left but I'm going to create a little numpad to control my alarm system. As this alarm system is pretty uncommon I didn't include it in this github (also I haven't built it yet :) )

How to install:
1. Copy the homeAssistant folder to Toon directory "/HCBv2/qml/apps/"
2. Edit file "/HCBv2/qml/qb/base/Globals.qml"; Add ""homeAssistant"," to the list of apps to load