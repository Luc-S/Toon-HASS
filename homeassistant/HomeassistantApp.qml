import QtQuick 1.1
import qb.components 1.0
import qb.base 1.0;

import FileIO 1.0

App {
    id: homeassistantApp

    property url tileUrl : "HomeassistantTile.qml";
    property url thumbnailIcon: "drawables/homeAssistant.png";

    property HomeassistantConfigurationScreen homeAssistantConfigurationScreen
    property url homeAssistantConfigurationScreenUrl : "HomeassistantConfigurationScreen.qml"

    property HomeassistantScreen homeAssistantScreen 
    property url homeAssistantScreenUrl : "HomeassistantScreen.qml"

    property string message : ""

    property string imgButtonOff : "./drawables/button_off.png"
    property string imgButtonOn : "./drawables/button_on.png"

    property string url : ""
    property string urlPass : ""

    property string homeAssistantServer : ""
    property string homeAssistantSSL : ""
    property string homeAssistantPort : ""
    property string homeAssistantPass : ""

    property variant homeAssistantSettingsJson : {
        'Server': "",
        'SSL': "",
        'Port': "",
        'Pass': ""
    }

    FileIO {
        id: userSettingsFile
        source: "./userSettings.json"
    }

	property string homeAssistantSensors : ["","","","","","","",""]
   
    property variant homeAssistantSensorsJson : {
        'Sensor1': "",
        'Sensor2': "",
        'Sensor3': "",
        'Sensor4': "",
        'Sensor5': "",
        'Sensor6': "",
        'Sensor7': "",
        'Sensor8': "",
    }

    FileIO {
        id: sensorFile
        source: "./sensors.json"
    }
	
	property variant homeAssistantSensorsInfo = [[],[],[],[],[],[],[],[]]
    
    property variant homeAssistantSensorInfoJson : {
        'Sensor1Info': "",
        'Sensor2Info': "",
        'Sensor3Info': "",
        'Sensor4Info': "",
        'Sensor5Info': "",
        'Sensor6Info': "",
        'Sensor7Info': "",
        'Sensor8Info': "",
    }

    FileIO {
        id: sensorInfoFile
        source: "./sensorInfo.json"
    }

    property string homeAssistantScene1 : ""
    property string homeAssistantScene2 : ""
    property string homeAssistantScene3 : ""
    property string homeAssistantScene4 : ""

    property variant homeAssistantScenesJson : {
        'Scene1': "",
        'Scene2': "",
        'Scene3': "",
        'Scene4': "",
    }

    FileIO {
        id: scenesFile
        source: "./scenes.json"
    }

    property variant homeAssistantScene1Info : []
    property variant homeAssistantScene2Info : []
    property variant homeAssistantScene3Info : []
    property variant homeAssistantScene4Info : []

    property variant homeAssistantSceneInfoJson : {
        'Scene1Info': "",
        'Scene2Info': "",
        'Scene3Info': "",
        'Scene4Info': "",
    }

    FileIO {
        id: sceneInfoFile
        source: "./sceneInfo.json"
    }

    property int sliderBtnWidth : 0
    property string homeAssistantSlider1 : ""
    property real homeAssistantSlider1Max : 0.0
    property real homeAssistantSlider1Min : 0.0
    property real homeAssistantSlider1Step : 0.0
    property int homeAssistantSlider1Options : 0
    property string imgNotSelected : "./drawables/notSelected.png"
    property string imgSelected : "./drawables/selected.png"

    property variant homeAssistantSlidersJson : {
        'Slider1': "",
    }

    FileIO {
        id: slidersFile
        source: "./sliders.json"
    }

    property variant homeAssistantSlider1Info : []

    property variant homeAssistantSliderInfoJson : {
        'Slider1Info': "",
    }

    FileIO {
        id: sliderInfoFile
        source: "./sliderInfo.json"
    }

    property string homeAssistantSwitch1 : ""
    property string homeAssistantSwitch2 : ""
    property string homeAssistantSwitch3 : ""
    property string homeAssistantSwitch4 : ""
    property string homeAssistantSwitch5 : ""

    property variant homeAssistantSwitchesJson : {
        'Switch1': "",
        'Switch2': "",
        'Switch3': "",
        'Switch4': "",
        'Switch5': "",
    }

    FileIO {
        id: switchFile
        source: "./switches.json"
    }

    property variant homeAssistantSwitch1Info : []
    property variant homeAssistantSwitch2Info : []
    property variant homeAssistantSwitch3Info : []
    property variant homeAssistantSwitch4Info : []
    property variant homeAssistantSwitch5Info : []

    property variant homeAssistantSwitchInfoJson : {
        'Switch1Info': "",
        'Switch2Info': "",
        'Switch3Info': "",
        'Switch4Info': "",
        'Switch5Info': "",
    }

    FileIO {
        id: switchInfoFile
        source: "./switchInfo.json"
    }

    property string homeAssistantAlarmCodeLabel : ""
    property string homeAssistantAlarmCode : ""
    property string homeAssistantAlarmState : ""
    property string imgLocked : "./drawables/dialpadLocked.png"
    property string imgUnlocked : "./drawables/dialpadUnlocked.png"
    property string homeAssistantAlarm1 : ""
    property string homeAssistantAlarm2 : ""

    property variant homeAssistantAlarmJson : {
        'Alarm1': "",
        'Code' : "",
    }

    FileIO {
        id: alarmFile
        source: "./alarm.json"
    }

    property string timeStr
    property string dateStr
    property int clockTile

    function updateClockInfo() {
        var now = new Date().getTime();
        timeStr = i18n.dateTime(now, i18n.time_yes);
        dateStr = i18n.dateTime(now, i18n.mon_full);
    }

    Timer {
        id: datetimeTimer
        interval: 1000
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: updateClockInfo()
    }

    Timer {
        id: datetimeTimer2
        interval: 60000
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: getSensorInfo()
    }

    //Check if connection to Home Assistant can be made
    function checkConnection() {
        var http = new XMLHttpRequest();
        var checkUrl = ""

        http.onreadystatechange = function() {
            if (http.readyState == 4) {
                if (http.status == 200) {
                    saveHomeAssistantSettingsJson();
                } else {
                    message = "Settings not saved. Could not establish connection. ResponseText: '" + http.responseText + "'";
                    homeAssistantSSL = "no";
                }
            }
        }

        if (homeAssistantSSL == "yes") {
            checkUrl = "https://" + homeAssistantServer + ":" + homeAssistantPort + "/api/states";
        } else {
            checkUrl = "http://" + homeAssistantServer + ":" + homeAssistantPort + "/api/states";
        }

        if (homeAssistantPass) {
            checkUrl = checkUrl + "?api_password=" + homeAssistantPass;
        }

        http.open("GET", checkUrl, true);
        http.send();
    }

    //Store Home Assistant connection settings
    function saveHomeAssistantSettingsJson() {
        var homeAssistantSettingsJson = {
            "Server" : homeAssistantServer,
            "SSL" : homeAssistantSSL,
            "Port" : homeAssistantPort,
            "Pass" : homeAssistantPass,
            "Clock" : clockTile,
        }
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeassistant/userSettings.json");
        doc2.send(JSON.stringify(homeAssistantSettingsJson));

        if (homeAssistantSSL == "yes") {
            url = "https://" + homeAssistantServer + ":" + homeAssistantPort;
        } else {
            url = "http://" + homeAssistantServer + ":" + homeAssistantPort;
        }

        if (homeAssistantPass) {
            urlPass = "?api_password=" + homeAssistantPass;
        }

        saveHomeAssistantSensorsJson();
        saveHomeAssistantScenesJson();
        saveHomeAssistantSlidersJson();
        saveHomeAssistantSwitchesJson();
        saveHomeAssistantAlarmJson();
    }

    //Store sensor settings
    function saveHomeAssistantSensorsJson() {
		
        var homeAssistantSensorsJson = {
			"Sensors" : homeAssistantSensors.length
        }
		
		// Add Sensor items based on the array size
		for(var i = 0; i < homeAssistantSensors.length; i++){
			homeAssistantSensorsJson["Sensor%1".arg(i)] = homeAssistantSensors[i];
		}
		
        var doc3 = new XMLHttpRequest();
        doc3.open("PUT", "file:///HCBv2/qml/apps/homeassistant/sensors.json");
        doc3.send(JSON.stringify(homeAssistantSensorsJson));
        
        getSensorInfo();
    }

    //Retrieve sensor information from Home Assistant
    function getSensorInfo() {
		for(var i = 0; i < homeAssistantSensorsInfo.length; i++){
			getHomeAssistant(homeAssistantSensors["Sensor%1".arg(i)], function(data){
				homeAssistantSensorsInfo[i] = data;
			}
		}
		
		saveHomeAssistantSensorInfoJson();         
    }
    
    //Store sensor information retrieved from Home Assistant
    function saveHomeAssistantSensorInfoJson() {
		var homeAssistantSensorInfoJson = {
			"Sensors" : homeAssistantSensorsInfo.length
        }
		
		// Add Sensor items based on the array size
		for(var i = 0; i < homeAssistantSensors.length; i++){
			homeAssistantSensorsJson["Sensor%1Info".arg(i)] = homeAssistantSensorsInfo[i];
		}
        
        var doc4 = new XMLHttpRequest();
        doc4.open("PUT", "file:///HCBv2/qml/apps/homeassistant/sensorInfo.json");
        doc4.send(JSON.stringify(homeAssistantSensorInfoJson));
    }

    //Store scene settings
    function saveHomeAssistantScenesJson() {
        var homeAssistantScenesJson = {
            "Scene1" : homeAssistantScene1,
            "Scene2" : homeAssistantScene2,
            "Scene3" : homeAssistantScene3,
            "Scene4" : homeAssistantScene4,
        }
        var doc5 = new XMLHttpRequest();
        doc5.open("PUT", "file:///HCBv2/qml/apps/homeassistant/scenes.json");
        doc5.send(JSON.stringify(homeAssistantScenesJson));

        getHomeAssistant(homeAssistantScene1, function(data) {
            homeAssistantScene1Info = data;

            getHomeAssistant(homeAssistantScene2, function(data) {
                homeAssistantScene2Info = data;

                getHomeAssistant(homeAssistantScene3, function(data) {
                    homeAssistantScene3Info = data;

                    getHomeAssistant(homeAssistantScene4, function(data) {
                        homeAssistantScene4Info = data;
                        saveHomeAssistantSceneInfoJson();
                    });
                });
            });
        });
    }

    //Store scene information retrieved from Home Assistant
    function saveHomeAssistantSceneInfoJson() {
        var homeAssistantSceneInfoJson = {
            "Scene1Info" : homeAssistantScene1Info,
            "Scene2Info" : homeAssistantScene2Info,
            "Scene3Info" : homeAssistantScene3Info,
            "Scene4Info" : homeAssistantScene4Info,
        }
        var doc6 = new XMLHttpRequest();
        doc6.open("PUT", "file:///HCBv2/qml/apps/homeassistant/sceneInfo.json");
        doc6.send(JSON.stringify(homeAssistantSceneInfoJson));
    }

    //Store slider settings
    function saveHomeAssistantSlidersJson() {
        var homeAssistantSlidersJson = {
            "Slider1" : homeAssistantSlider1,
        }
        var doc7 = new XMLHttpRequest();
        doc7.open("PUT", "file:///HCBv2/qml/apps/homeassistant/sliders.json");
        doc7.send(JSON.stringify(homeAssistantSlidersJson));

        getSliderInfo();
    }

    function getSliderInfo() {
        getHomeAssistant(homeAssistantSlider1, function(data) {
            homeAssistantSlider1Info = data;
            saveHomeAssistantSliderInfoJson();
        });
    }

    //Store slider information retrieved from Home Assistant
    function saveHomeAssistantSliderInfoJson() {
        var homeAssistantSliderInfoJson = {
            "Slider1Info" : homeAssistantSlider1Info,
        }
        var doc8 = new XMLHttpRequest();
        doc8.open("PUT", "file:///HCBv2/qml/apps/homeassistant/sliderInfo.json");
        doc8.send(JSON.stringify(homeAssistantSliderInfoJson));
        buildSliderObject();
    }

    function buildSliderObject() {
        homeAssistantSlider1Max = (JSON.parse(homeAssistantSlider1Info)['attributes']['max']).toFixed(1);
        homeAssistantSlider1Min = (JSON.parse(homeAssistantSlider1Info)['attributes']['min']).toFixed(1);
        homeAssistantSlider1Step = (JSON.parse(homeAssistantSlider1Info)['attributes']['step']).toFixed(1);

        homeAssistantSlider1Options = Math.round(((homeAssistantSlider1Max - homeAssistantSlider1Min) / homeAssistantSlider1Step) + 1);

        if (homeAssistantSlider1Options > 0) {
            sliderBtnWidth = Math.round(245 / homeAssistantSlider1Options);
        }
    }

    //Store switch settings
    function saveHomeAssistantSwitchesJson() {
        var homeAssistantSwitchesJson = {
            "Switch1" : homeAssistantSwitch1,
            "Switch2" : homeAssistantSwitch2,
            "Switch3" : homeAssistantSwitch3,
            "Switch4" : homeAssistantSwitch4,
            "Switch5" : homeAssistantSwitch5,
        }
        var doc9 = new XMLHttpRequest();
        doc9.open("PUT", "file:///HCBv2/qml/apps/homeassistant/switches.json");
        doc9.send(JSON.stringify(homeAssistantSwitchesJson));
    }

    //Retrieve switch information from Home Assistant
    function getSwitchInfo() {
        getHomeAssistant(homeAssistantSwitch1, function(data) {
            homeAssistantSwitch1Info = data;

            getHomeAssistant(homeAssistantSwitch2, function(data) {
                homeAssistantSwitch2Info = data;

                getHomeAssistant(homeAssistantSwitch3, function(data) {
                    homeAssistantSwitch3Info = data;

                    getHomeAssistant(homeAssistantSwitch4, function(data) {
                        homeAssistantSwitch4Info = data;

                        getHomeAssistant(homeAssistantSwitch5, function(data) {
                            homeAssistantSwitch5Info = data;
                            saveHomeAssistantSwitchInfoJson();
                        });
                    });
                });
            });  
        });
    }

    //Store switch information retrieved from Home Assistant
    function saveHomeAssistantSwitchInfoJson() {
        var homeAssistantSwitchInfoJson = {
            "Switch1Info" : homeAssistantSwitch1Info,
            "Switch2Info" : homeAssistantSwitch2Info,
            "Switch3Info" : homeAssistantSwitch3Info,
            "Switch4Info" : homeAssistantSwitch4Info,
            "Switch5Info" : homeAssistantSwitch5Info,
        }
        var doc10 = new XMLHttpRequest();
        doc10.open("PUT", "file:///HCBv2/qml/apps/homeassistant/switchInfo.json");
        doc10.send(JSON.stringify(homeAssistantSwitchInfoJson));
    }

    //Store alarm settings
    function saveHomeAssistantAlarmJson() {
        var homeAssistantAlarmJson = {
            "Alarm1" : homeAssistantAlarm1,
            "Code" : homeAssistantAlarm2,
        }
        var doc11 = new XMLHttpRequest();
        doc11.open("PUT", "file:///HCBv2/qml/apps/homeassistant/alarm.json");
        doc11.send(JSON.stringify(homeAssistantAlarmJson));
    }

    function getAlarmInfo() {
        getHomeAssistant(homeAssistantAlarm1, function(data) {
            homeAssistantAlarmState = JSON.parse(data)['state'];

            //Don't update alarmcode label when code is being entered
            var alarmLastChar = homeAssistantAlarmCodeLabel.slice(-1);
            if (!(/\d/.test(alarmLastChar))) {
                homeAssistantAlarmCodeLabel = homeAssistantAlarmState;
            }
        });
    }

    function init() {
        registry.registerWidget("tile", tileUrl, this, null, {thumbLabel: qsTr("homeAssistant"), thumbIcon: thumbnailIcon, thumbCategory: "general", thumbWeight: 30, baseTileWeight: 10, baseTileSolarWeight: 10, thumbIconVAlignment: "center"});
        registry.registerWidget("screen", homeAssistantConfigurationScreenUrl, this, "homeAssistantConfigurationScreen");
        registry.registerWidget("screen", homeAssistantScreenUrl, this, "homeAssistantScreen");
    }

    Component.onCompleted: {
        readDefaults();
    }

    function readDefaults() {
        homeAssistantSettingsJson = JSON.parse(userSettingsFile.read());
        homeAssistantScenesJson = JSON.parse(scenesFile.read());
        homeAssistantSceneInfoJson = JSON.parse(sceneInfoFile.read());
        homeAssistantSwitchesJson = JSON.parse(switchFile.read());
        homeAssistantSwitchInfoJson = JSON.parse(switchInfoFile.read());
        homeAssistantSensorsJson = JSON.parse(sensorFile.read());
        homeAssistantSensorInfoJson = JSON.parse(sensorInfoFile.read());
        homeAssistantSlidersJson = JSON.parse(slidersFile.read());
        homeAssistantSliderInfoJson = JSON.parse(sliderInfoFile.read());
        homeAssistantAlarmJson = JSON.parse(alarmFile.read());

        homeAssistantServer = homeAssistantSettingsJson ['Server'];
        homeAssistantSSL = homeAssistantSettingsJson ['SSL'];
        homeAssistantPort = homeAssistantSettingsJson ['Port'];
        homeAssistantPass = homeAssistantSettingsJson ['Pass'];
        clockTile = homeAssistantSettingsJson ['Clock'];
        
        if (homeAssistantSSL == "yes") {
            url = "https://" + homeAssistantServer + ":" + homeAssistantPort;
        } else {
            url = "http://" + homeAssistantServer + ":" + homeAssistantPort;
        }
        
        if (homeAssistantPass) {
            urlPass = "?api_password=" + homeAssistantPass;
        }

        homeAssistantScene1 = homeAssistantScenesJson ['Scene1'];
        homeAssistantScene2 = homeAssistantScenesJson ['Scene2'];
        homeAssistantScene3 = homeAssistantScenesJson ['Scene3'];
        homeAssistantScene4 = homeAssistantScenesJson ['Scene4'];

        homeAssistantScene1Info = homeAssistantSceneInfoJson ['Scene1Info'];
        homeAssistantScene2Info = homeAssistantSceneInfoJson ['Scene2Info'];
        homeAssistantScene3Info = homeAssistantSceneInfoJson ['Scene3Info'];
        homeAssistantScene4Info = homeAssistantSceneInfoJson ['Scene4Info'];

        homeAssistantSlider1 = homeAssistantSlidersJson ['Slider1'];
        homeAssistantSlider1Info = homeAssistantSliderInfoJson ['Slider1Info'];

        if (homeAssistantSlider1Info) {
            buildSliderObject();
        }
        
        homeAssistantSwitch1 = homeAssistantSwitchesJson ['Switch1'];
        homeAssistantSwitch2 = homeAssistantSwitchesJson ['Switch2'];
        homeAssistantSwitch3 = homeAssistantSwitchesJson ['Switch3'];
        homeAssistantSwitch4 = homeAssistantSwitchesJson ['Switch4'];
        homeAssistantSwitch5 = homeAssistantSwitchesJson ['Switch5'];
        
        homeAssistantSwitch1Info = homeAssistantSwitchInfoJson ['Switch1Info'];
        homeAssistantSwitch2Info = homeAssistantSwitchInfoJson ['Switch2Info'];
        homeAssistantSwitch3Info = homeAssistantSwitchInfoJson ['Switch3Info'];
        homeAssistantSwitch4Info = homeAssistantSwitchInfoJson ['Switch4Info'];
        homeAssistantSwitch5Info = homeAssistantSwitchInfoJson ['Switch5Info'];
        
		// Allocate Sensor array
		for(var i = 0; i < homeAssistantSensorsJson["Sensors"]; i++){
			homeAssistantSensors["Sensor%1".arg(i)"] = homeAssistantSensorsJson["Sensor%1".arg(i)"];
		}
		
		
        // Allocate SensorInfo array
		for(var i = 0; i < homeAssistantSensorInfoJson["Sensors"]; i++){
			homeAssistantSensorsInfo["Sensor%1Info".arg(i)"] = homeAssistantSensorInfoJson["Sensor%1Info".arg(i)"];
		}
		
        homeAssistantAlarm1 = homeAssistantAlarmJson ['Alarm1'];
        homeAssistantAlarm2 = homeAssistantAlarmJson ['Code'];

    }

    function getHomeAssistant(entity, callback) {
        var http = new XMLHttpRequest();
        var fullUrl = "";
        var urlExtension = entity ? "/api/states/" + entity : "/api/states";

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                //message = "1: " + http.readyState;
                if (http.status == 200) {
                    //message = "2: " + http.responseText;
                    callback(http.responseText);
                } else {
                    //message = "3: " + http.responseText;
                    callback(http.status);
                }
            }
        }

        fullUrl = url + urlExtension;

        //Only send password is there is one given
        if (homeAssistantPass) {
            fullUrl = fullUrl + urlPass;
        }

        http.open("GET", fullUrl, true);
        http.send();
    }
    
    function setHomeAssistant(type, entity, state) {
        var http = new XMLHttpRequest();
        var fullUrl = "";
        var params = '{"entity_id": "' + entity + '"}';

        switch(type) {
            case "scene":
                fullUrl = url + "/api/services/scene/turn_on";
                break;
            case "switch":
                fullUrl = state ? url + "/api/services/switch/turn_on" : url + "/api/services/switch/turn_off";
                break;
            case "slider":
                params = '{"entity_id": "' + entity + '", "value":"' + state + '"}';
                fullUrl = url + "/api/services/input_number/set_value";
                break;
            case "alarm":
                params = state ? '{"entity_id": "' + entity + '", "code":"' + homeAssistantAlarm2 + '"}' : '{"entity_id": "' + entity + '", "code":"' + homeAssistantAlarmCode + '"}';
                fullUrl = state ? url + "/api/services/alarm_control_panel/alarm_arm_away" : url + "/api/services/alarm_control_panel/alarm_disarm";
                break;
            default:
                pass
        }

        http.onreadystatechange = function(type, entity) { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    return true;
                } else {
                    var error = "Commando mislukt: " + http.status;
                    return error;
                }
            }
            getSwitchInfo();
            getSliderInfo();
            getAlarmInfo();
            alarmInputReset();
        }

        http.open("POST", fullUrl, true);

        //Only send password is there is one given
        if (homeAssistantPass) {
            http.setRequestHeader("x-ha-access", homeAssistantPass);
        }

        http.setRequestHeader("Content-Type", "application/json");  
        http.send(params); 
    
    }

    function alarmInput(num) {
        if (homeAssistantAlarmCode.length < 5) {
            homeAssistantAlarmCode = homeAssistantAlarmCode + num;
            switch(homeAssistantAlarmCode.length) {
                case 1:
                    homeAssistantAlarmCodeLabel = num;
                    break;
                case 2:
                    homeAssistantAlarmCodeLabel = "*" + num;
                    break;
                case 3:
                    homeAssistantAlarmCodeLabel = "**" + num;
                    break;
                case 4:
                    homeAssistantAlarmCodeLabel = "***" + num;
                    break;
                default:
                    pass
            }
        }
    }

    function alarmInputReset() {
        homeAssistantAlarmCode = "";
        homeAssistantAlarmCodeLabel = homeAssistantAlarmState;
    }

}
