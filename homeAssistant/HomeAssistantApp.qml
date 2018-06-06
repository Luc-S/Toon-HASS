import QtQuick 1.1
import qb.components 1.0
import qb.base 1.0;

import FileIO 1.0

App {
    id: homeAssistantApp

    property url tileUrl : "HomeAssistantTile.qml";
    property url thumbnailIcon: "drawables/homeAssistant.png";

    property HomeAssistantConfigurationScreen homeAssistantConfigurationScreen
    property url homeAssistantConfigurationScreenUrl : "HomeAssistantConfigurationScreen.qml"

    property HomeAssistantScreen homeAssistantScreen 
    property url homeAssistantScreenUrl : "HomeAssistantScreen.qml"

    property string message : ""

    property string imgButtonOff : "./drawables/button_off.png"
    property string imgButtonOn : "./drawables/button_on.png"

    property string url : ""
    property string urlPass : ""

    property string homeAssistantServer : ""
    property string homeAssistantPort : ""
    property string homeAssistantPass : ""

    property variant homeAssistantSettingsJson : {
        'Server': "",
        'Port': "",
        'Pass': ""
    }

    FileIO {
        id: userSettingsFile
        source: "./userSettings.json"
    }

    property string homeAssistantSensor1 : ""
    property string homeAssistantSensor2 : ""
    property string homeAssistantSensor3 : ""
    property string homeAssistantSensor4 : ""
    property string homeAssistantSensor5 : ""
    property string homeAssistantSensor6 : ""
    property string homeAssistantSensor7 : ""
    property string homeAssistantSensor8 : ""

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

    property variant homeAssistantSensor1Info : []
    property variant homeAssistantSensor2Info : []
    property variant homeAssistantSensor3Info : []
    property variant homeAssistantSensor4Info : []
    property variant homeAssistantSensor5Info : []
    property variant homeAssistantSensor6Info : []
    property variant homeAssistantSensor7Info : []
    property variant homeAssistantSensor8Info : []

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
    property string homeAssistantScene5 : ""
    property string homeAssistantScene6 : ""

    property variant homeAssistantScenesJson : {
        'Scene1': "",
        'Scene2': "",
        'Scene3': "",
        'Scene4': "",
        'Scene5': "",
        'Scene6': "",
    }

    FileIO {
        id: scenesFile
        source: "./scenes.json"
    }

    property variant homeAssistantScene1Info : []
    property variant homeAssistantScene2Info : []
    property variant homeAssistantScene3Info : []
    property variant homeAssistantScene4Info : []
    property variant homeAssistantScene5Info : []
    property variant homeAssistantScene6Info : []

    property variant homeAssistantSceneInfoJson : {
        'Scene1Info': "",
        'Scene2Info': "",
        'Scene3Info': "",
        'Scene4Info': "",
        'Scene5Info': "",
        'Scene6Info': "",
    }

    FileIO {
        id: sceneInfoFile
        source: "./sceneInfo.json"
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

    //Store Home Assistant connection settings
    function saveHomeAssistantSettingsJson() {
        var homeAssistantSettingsJson = {
            "Server" : homeAssistantServer,
            "Port" : homeAssistantPort,
            "Pass" : homeAssistantPass,
        }
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/userSettings.json");
        doc2.send(JSON.stringify(homeAssistantSettingsJson));

        url = "http://" + homeAssistantServer + ":" + homeAssistantPort;

        if (homeAssistantPass) {
            urlPass = "?api_password=" + homeAssistantPass;
        }

        saveHomeAssistantSensorsJson();
        saveHomeAssistantScenesJson();
        saveHomeAssistantSwitchesJson();
    }

    //Store sensor settings
    function saveHomeAssistantSensorsJson() {
        var homeAssistantSensorsJson = {
            "Sensor1" : homeAssistantSensor1,
            "Sensor2" : homeAssistantSensor2,
            "Sensor3" : homeAssistantSensor3,
            "Sensor4" : homeAssistantSensor4,
            "Sensor5" : homeAssistantSensor5,
            "Sensor6" : homeAssistantSensor6,
            "Sensor7" : homeAssistantSensor7,
            "Sensor8" : homeAssistantSensor8,
        }
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/sensors.json");
        doc2.send(JSON.stringify(homeAssistantSensorsJson));
        
        getSensorInfo();
    }

    //Retrieve sensor information from Home Assistant
    function getSensorInfo() {
        getHomeAssistant(homeAssistantSensor1, function(data) {
            homeAssistantSensor1Info = data;

            getHomeAssistant(homeAssistantSensor2, function(data) {
                homeAssistantSensor2Info = data;

                getHomeAssistant(homeAssistantSensor3, function(data) {
                    homeAssistantSensor3Info = data;

                    getHomeAssistant(homeAssistantSensor4, function(data) {
                        homeAssistantSensor4Info = data;

                        getHomeAssistant(homeAssistantSensor5, function(data) {
                            homeAssistantSensor5Info = data;

                            getHomeAssistant(homeAssistantSensor6, function(data) {
                                homeAssistantSensor6Info = data;

                                getHomeAssistant(homeAssistantSensor7, function(data) {
                                    homeAssistantSensor7Info = data;

                                    getHomeAssistant(homeAssistantSensor8, function(data) {
                                        homeAssistantSensor8Info = data;
                                        saveHomeAssistantSensorInfoJson();
                                    });
                                });
                            });
                        });
                    });
                });
            });  
        }); 
    }
    
    //Store sensor information retrieved from Home Assistant
    function saveHomeAssistantSensorInfoJson() {
        var homeAssistantSensorInfoJson = {
            "Sensor1Info" : homeAssistantSensor1Info,
            "Sensor2Info" : homeAssistantSensor2Info,
            "Sensor3Info" : homeAssistantSensor3Info,
            "Sensor4Info" : homeAssistantSensor4Info,
            "Sensor5Info" : homeAssistantSensor5Info,
            "Sensor6Info" : homeAssistantSensor6Info,
            "Sensor7Info" : homeAssistantSensor7Info,
            "Sensor8Info" : homeAssistantSensor8Info,
        }
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/sensorInfo.json");
        doc2.send(JSON.stringify(homeAssistantSensorInfoJson));
    }

    //Store scene settings
    function saveHomeAssistantScenesJson() {
        var homeAssistantScenesJson = {
            "Scene1" : homeAssistantScene1,
            "Scene2" : homeAssistantScene2,
            "Scene3" : homeAssistantScene3,
            "Scene4" : homeAssistantScene4,
            "Scene5" : homeAssistantScene5,
            "Scene6" : homeAssistantScene6,
        }
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/scenes.json");
        doc2.send(JSON.stringify(homeAssistantScenesJson));

        getHomeAssistant(homeAssistantScene1, function(data) {
            homeAssistantScene1Info = data;

            getHomeAssistant(homeAssistantScene2, function(data) {
                homeAssistantScene2Info = data;

                getHomeAssistant(homeAssistantScene3, function(data) {
                    homeAssistantScene3Info = data;

                    getHomeAssistant(homeAssistantScene4, function(data) {
                        homeAssistantScene4Info = data;
                        
                        getHomeAssistant(homeAssistantScene5, function(data) {
                            homeAssistantScene5Info = data;
                            
                            getHomeAssistant(homeAssistantScene6, function(data) {
                                homeAssistantScene6Info = data;
                                saveHomeAssistantSceneInfoJson();
                            });
                        });
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
            "Scene5Info" : homeAssistantScene5Info,
            "Scene6Info" : homeAssistantScene6Info,
        }
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/sceneInfo.json");
        doc2.send(JSON.stringify(homeAssistantSceneInfoJson));
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
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/switches.json");
        doc2.send(JSON.stringify(homeAssistantSwitchesJson));
        
        getSwitchInfo();
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
        var doc2 = new XMLHttpRequest();
        doc2.open("PUT", "file:///HCBv2/qml/apps/homeAssistant/switchInfo.json");
        doc2.send(JSON.stringify(homeAssistantSwitchInfoJson));
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

        homeAssistantServer = homeAssistantSettingsJson ['Server'];
        homeAssistantPort = homeAssistantSettingsJson ['Port'];
        homeAssistantPass = homeAssistantSettingsJson ['Pass'];
        
        url = "http://" + homeAssistantServer + ":" + homeAssistantPort;
        
        if (homeAssistantPass) {
            urlPass = "?api_password=" + homeAssistantPass;
        }

        homeAssistantScene1 = homeAssistantScenesJson ['Scene1'];
        homeAssistantScene2 = homeAssistantScenesJson ['Scene2'];
        homeAssistantScene3 = homeAssistantScenesJson ['Scene3'];
        homeAssistantScene4 = homeAssistantScenesJson ['Scene4'];
        homeAssistantScene5 = homeAssistantScenesJson ['Scene5'];
        homeAssistantScene6 = homeAssistantScenesJson ['Scene6'];

        homeAssistantScene1Info = homeAssistantSceneInfoJson ['Scene1Info'];
        homeAssistantScene2Info = homeAssistantSceneInfoJson ['Scene2Info'];
        homeAssistantScene3Info = homeAssistantSceneInfoJson ['Scene3Info'];
        homeAssistantScene4Info = homeAssistantSceneInfoJson ['Scene4Info'];
        homeAssistantScene5Info = homeAssistantSceneInfoJson ['Scene5Info'];
        homeAssistantScene6Info = homeAssistantSceneInfoJson ['Scene6Info'];
        
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
        
        homeAssistantSensor1 = homeAssistantSensorsJson ['Sensor1'];
        homeAssistantSensor2 = homeAssistantSensorsJson ['Sensor2'];
        homeAssistantSensor3 = homeAssistantSensorsJson ['Sensor3'];
        homeAssistantSensor4 = homeAssistantSensorsJson ['Sensor4'];
        homeAssistantSensor5 = homeAssistantSensorsJson ['Sensor5'];
        homeAssistantSensor6 = homeAssistantSensorsJson ['Sensor6'];
        homeAssistantSensor7 = homeAssistantSensorsJson ['Sensor7'];
        homeAssistantSensor8 = homeAssistantSensorsJson ['Sensor8'];
        
        homeAssistantSensor1Info = homeAssistantSensorInfoJson ['Sensor1Info'];
        homeAssistantSensor2Info = homeAssistantSensorInfoJson ['Sensor2Info'];
        homeAssistantSensor3Info = homeAssistantSensorInfoJson ['Sensor3Info'];
        homeAssistantSensor4Info = homeAssistantSensorInfoJson ['Sensor4Info'];
        homeAssistantSensor5Info = homeAssistantSensorInfoJson ['Sensor5Info'];
        homeAssistantSensor6Info = homeAssistantSensorInfoJson ['Sensor6Info'];
        homeAssistantSensor7Info = homeAssistantSensorInfoJson ['Sensor7Info'];
        homeAssistantSensor8Info = homeAssistantSensorInfoJson ['Sensor8Info'];
    }

    function getHomeAssistant(entity, callback) {
        var http = new XMLHttpRequest();
        var fullUrl = "";
        var urlExtension = "/api/states/" + entity;

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    callback(http.responseText);
                } else {
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
                fullUrl = state ? url + "/api/services/switch/turn_on" : url + "/api/services/switch/turn_off"
                break;
            default:
                pass
        }

        http.onreadystatechange = function() { // Call a function when the state changes.
            if (http.readyState == 4) {
                if (http.status == 200) {
                    return true;
                } else {
                    var error = "Commando mislukt: " + http.status;
                    return error;
                }
            }
            getSwitchInfo();
        }

        http.open("POST", fullUrl, true);

        //Only send password is there is one given
        if (homeAssistantPass) {
            http.setRequestHeader("x-ha-access", homeAssistantPass);
        }

        http.setRequestHeader("Content-Type", "application/json");  
        http.send(params); 
    
    }

}