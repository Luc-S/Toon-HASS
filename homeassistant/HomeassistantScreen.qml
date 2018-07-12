import QtQuick 1.1
import qb.components 1.0

Screen {
    id: homeAssistantScreen
    screenTitle: "Home Assistant"

    onShown: {
        addCustomTopRightButton("Instellingen");

        app.getSensorInfo();
        app.getSwitchInfo();
        app.getSliderInfo();
        app.getAlarmInfo();
        
		for(var i = 0; i < app.homeAssistantSwitches.length;i++){
			var switchComponent = Qt.createComponent("HomeAssistantSwitch.qml");
			if(switchComponent.status == Component.Ready) {
				switchComponent.switchRect.homeAssistantSwitch.text: JSON.parse(app.homeAssistantSwitchesInfo[i])['attributes']['friendly_name'];
				switchComponent.switchRect.homeAssistantSwitchButton.source: JSON.parse(app.homeAssistantSwitchesInfo[i])['state'] == "on" ? app.imgButtonOn : app.imgButtonOff;
				switchComponent.switchRect.homeAssistantSwitchMouseArea.onClicked: {
                    if (JSON.parse(app.homeAssistantSwitchesInfo[i])['state'] == "off") {
                        app.setHomeAssistant("switch", app.homeAssistantSwitches[i], 1);
                    } else if (JSON.parse(app.homeAssistantSwitchesInfo[i])['state'] == "on") {
                        app.setHomeAssistant("switch", app.homeAssistantSwitches[i], 0);
                    }
                }
			}
		}
		
		for(var i = 0; i < app.homeAssistantSensors.length;i++){
			var switchComponent = Qt.createComponent("HomeAssistantSwitch.qml");
			if(switchComponent.status == Component.Ready) {
				switchComponent.switchRect.homeAssistantSwitch.text: JSON.parse(app.homeAssistantSwitchesInfo[i])['attributes']['friendly_name'];
				switchComponent.switchRect.homeAssistantSwitchButton.source: JSON.parse(app.homeAssistantSwitchesInfo[i])['state'] == "on" ? app.imgButtonOn : app.imgButtonOff;
				switchComponent.switchRect.homeAssistantSwitchMouseArea.onClicked: {
                    if (JSON.parse(app.homeAssistantSwitchesInfo[i])['state'] == "off") {
                        app.setHomeAssistant("switch", app.homeAssistantSwitches[i], 1);
                    } else if (JSON.parse(app.homeAssistantSwitchesInfo[i])['state'] == "on") {
                        app.setHomeAssistant("switch", app.homeAssistantSwitches[i], 0);
                    }
                }
			}
		}
		
        if (app.homeAssistantSensor1) {
            homeAssistantSensor1Name.visible = true;
            homeAssistantSensor1Value.visible = true;
        } else {
            homeAssistantSensor1Name.visible = false;
            homeAssistantSensor1Value.visible = false;
        }

        if (app.homeAssistantSensor2) {
            homeAssistantSensor2Name.visible = true;
            homeAssistantSensor2Value.visible = true;
        } else {
            homeAssistantSensor2Name.visible = false;
            homeAssistantSensor2Value.visible = false;
        }

        if (app.homeAssistantSensor3) {
            homeAssistantSensor3Name.visible = true;
            homeAssistantSensor3Value.visible = true;
        } else {
            homeAssistantSensor3Name.visible = false;
            homeAssistantSensor3Value.visible = false;
        }

        if (app.homeAssistantSensor4) {
            homeAssistantSensor4Name.visible = true;
            homeAssistantSensor4Value.visible = true;
        } else {
            homeAssistantSensor4Name.visible = false;
            homeAssistantSensor4Value.visible = false;
        }

        if (app.homeAssistantSensor5) {
            homeAssistantSensor5Name.visible = true;
            homeAssistantSensor5Value.visible = true;
        } else {
            homeAssistantSensor5Name.visible = false;
            homeAssistantSensor5Value.visible = false;
        }

        if (app.homeAssistantSensor6) {
            homeAssistantSensor6Name.visible = true;
            homeAssistantSensor6Value.visible = true;
        } else {
            homeAssistantSensor6Name.visible = false;
            homeAssistantSensor6Value.visible = false;
        }

        if (app.homeAssistantSensor7) {
            homeAssistantSensor7Name.visible = true;
            homeAssistantSensor7Value.visible = true;
        } else {
            homeAssistantSensor7Name.visible = false;
            homeAssistantSensor7Value.visible = false;
        }

        if (app.homeAssistantSensor8) {
            homeAssistantSensor8Name.visible = true;
            homeAssistantSensor8Value.visible = true;
        } else {
            homeAssistantSensor8Name.visible = false;
            homeAssistantSensor8Value.visible = false;
        }

        if (app.homeAssistantScene1) {
            homeAssistantScene1Button.height = 75;
            homeAssistantScene1Button.visible = true;
        } else {
            homeAssistantScene1Button.visible = false;
            homeAssistantScene1Button.height = 0;
        }

        if (app.homeAssistantScene2) {
            homeAssistantScene2Button.height = 75;
            homeAssistantScene2Button.visible = true;
        } else {
            homeAssistantScene2Button.visible = false;
            homeAssistantScene2Button.height = 0;
        }

        if (app.homeAssistantScene3) {
            homeAssistantScene3Button.height = 75;
            homeAssistantScene3Button.visible = true;
        } else {
            homeAssistantScene3Button.visible = false;
            homeAssistantScene3Button.height = 0;
        }

        if (app.homeAssistantScene4) {
            homeAssistantScene4Button.height = 75;
            homeAssistantScene4Button.visible = true; 
        } else {
            homeAssistantScene4Button.visible = false;
            homeAssistantScene4Button.height = 0;
        }

        if (app.homeAssistantSlider1) {
            sliderArea.visible = true;

            if (app.homeAssistantSlider1Options > 0) {
                app.sliderBtnWidth = Math.round(245 / app.homeAssistantSlider1Options);
            }
        } else {
            sliderArea.visible = false;
        }

        if (app.homeAssistantSwitch1) {
            switchRect1.height = 50;
            switchRect1.visible = true;
        } else {
            switchRect1.visible = false;
            switchRect1.height = 0;
        }

        if (app.homeAssistantSwitch2) {
            switchRect2.height = 50;
            switchRect2.visible = true;
        } else {
            switchRect2.visible = false;
            switchRect2.height = 0;
        }

        if (app.homeAssistantSwitch3) {
            switchRect3.height = 50;
            switchRect3.visible = true;
        } else {
            switchRect3.visible = false;
            switchRect3.height = 0;
        }

        if (app.homeAssistantSwitch4) {
            switchRect4.height = 50;
            switchRect4.visible = true;
        } else {
            switchRect4.visible = false;
            switchRect4.height = 0;
        }

        if (app.homeAssistantSwitch5) {
            switchRect5.height = 50;
            switchRect5.visible = true;
        } else {
            switchRect5.visible = false;
            switchRect5.height = 0;
        }

        if (app.homeAssistantAlarm1) {
            alarmTitle.visible = true;
            alarmRect.visible = true;
        } else {
            alarmTitle.visible = false;
            alarmRect.visible = false;
        }

    }

    onCustomButtonClicked: {
        if (app.homeAssistantConfigurationScreen) {
            app.homeAssistantConfigurationScreen.show();
        }
    }

    hasBackButton : true

    Text {
        id: title
        x: 30
        y: 0
        width: 740
        text: app.message
        font.pixelSize: 10
        font.family: qfont.semiBold.name
        color: "red"
        wrapMode: Text.WordWrap
    }

    //Top section
    Rectangle {
        id: sensorRect
        x: 30
        y: 15
        width: 740
        height: 100
        radius: 10
        color: "#e8e8e8"

        Image {
            id: homeAssistantIconMain
            source: "./drawables/homeAssistantIconBig.png"
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            cache: false
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.getSensorInfo();
                    app.getSwitchInfo();
                    app.getSliderInfo();
                    app.getAlarmInfo();
                }
            }
        }

        Rectangle {
            id: sensorRectNames
            width: 150
            color: "transparent"
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 15
                leftMargin: 30
            }

            Text {
                id: homeAssistantSensor1Name
                text: JSON.parse(app.homeAssistantSensor1Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: parent.top
                }
            }

            Text {
                id: homeAssistantSensor2Name
                text: JSON.parse(app.homeAssistantSensor2Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor1Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor3Name
                text: JSON.parse(app.homeAssistantSensor3Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor2Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor4Name
                text: JSON.parse(app.homeAssistantSensor4Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor3Name.bottom
                }
            }
        }

        Rectangle {
            id: sensorRect2
            width: 100
            color: "transparent"
            anchors {
                top: sensorRect1.top
                left: sensorRect1.right
            } 

            Text {
                id: homeAssistantSensor1Value;
                text: JSON.parse(app.homeAssistantSensor1Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor1Info)['state'] + " " + JSON.parse(app.homeAssistantSensor1Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor1Info)['state']
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: sensorRect2.top  
                    right: sensorRect2.right
                    rightMargin: 20
                }
            } 

            Text {
                id: homeAssistantSensor2Value;
                text: JSON.parse(app.homeAssistantSensor2Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor2Info)['state'] + " " + JSON.parse(app.homeAssistantSensor2Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor2Info)['state']
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap 
                anchors {
                    top: homeAssistantSensor1Value.bottom
                    right: homeAssistantSensor1Value.right
                }
            }

            Text {
                id: homeAssistantSensor3Value;
                text: JSON.parse(app.homeAssistantSensor3Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor3Info)['state'] + " " + JSON.parse(app.homeAssistantSensor3Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor3Info)['state'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor2Value.bottom  
                    right: homeAssistantSensor2Value.right
                }
            }

            Text {
                id: homeAssistantSensor4Value;
                text: JSON.parse(app.homeAssistantSensor4Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor4Info)['state'] + " " + JSON.parse(app.homeAssistantSensor4Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor4Info)['state']
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor3Value.bottom
                    right: homeAssistantSensor3Value.right
                }
            }
        }

        Rectangle {
            id: sensorRect3
            width: 150
            color: "transparent"
            anchors {
                top: parent.top
                left: sensorRect2.right
                topMargin: 15
                leftMargin: 100
            } 

            Text {
                id: homeAssistantSensor5Name
                text: JSON.parse(app.homeAssistantSensor5Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: parent.top
                }
            }

            Text {
                id: homeAssistantSensor6Name
                text: JSON.parse(app.homeAssistantSensor6Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor5Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor7Name
                text: JSON.parse(app.homeAssistantSensor7Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor6Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor8Name
                text: JSON.parse(app.homeAssistantSensor8Info)['attributes']['friendly_name'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor7Name.bottom
                }
            }
        }

        Rectangle {
            id: sensorRect4
            width: 100
            color: "transparent"
            anchors {
                top: sensorRect3.top
                left: sensorRect3.right
            }

            Text {
                id: homeAssistantSensor5Value;
                text: JSON.parse(app.homeAssistantSensor5Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor5Info)['state'] + " " + JSON.parse(app.homeAssistantSensor5Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor5Info)['state'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: sensorRect4.top  
                    right: sensorRect4.right
                    rightMargin: 20
                }
            }

            Text {
                id: homeAssistantSensor6Value;
                text: JSON.parse(app.homeAssistantSensor6Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor6Info)['state'] + " " + JSON.parse(app.homeAssistantSensor6Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor6Info)['state'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap 
                anchors {
                        top: homeAssistantSensor5Value.bottom
                        right: homeAssistantSensor5Value.right
                }
            }

            Text {
                id: homeAssistantSensor7Value;
                text: JSON.parse(app.homeAssistantSensor7Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor7Info)['state'] + " " + JSON.parse(app.homeAssistantSensor7Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor7Info)['state'] 
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                        top: homeAssistantSensor6Value.bottom
                        right: homeAssistantSensor6Value.right
                }
            }

            Text {
                id: homeAssistantSensor8Value;
                anchors {
                        top: homeAssistantSensor7Value.bottom
                        right: homeAssistantSensor7Value.right
                }
                text: JSON.parse(app.homeAssistantSensor8Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor8Info)['state'] + " " + JSON.parse(app.homeAssistantSensor8Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor8Info)['state'] 
                font.pixelSize: 12
                color: "Black"
                wrapMode: Text.WordWrap
            }
        }
    }

    //Scene section
    Text {
        id: sceneTitle
        x: 30
        y: 130
        width: 245
        text: "Scenes"
        font.pixelSize: 16
        font.family: qfont.semiBold.name
        color: "Black"
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: sceneRect
        anchors {
            top: sceneTitle.bottom
            left: sceneTitle.left
            topMargin: 5
        }
        width: 245
        height: 160
        color: "transparent"

        IconButton {
            id: homeAssistantScene1Button
            width: 120
            height: 75
            text: JSON.parse(app.homeAssistantScene1Info)['attributes']['friendly_name']
            anchors {
                left: parent.left
                top: parent.top
            }

            bottomClickMargin: 3
            onClicked: {
                app.setHomeAssistant("scene", app.homeAssistantScene1);
            }
        }

        IconButton {
            id: homeAssistantScene2Button
            width: 120
            height: 75
            text: JSON.parse(app.homeAssistantScene2Info)['attributes']['friendly_name']

            anchors {
                left: homeAssistantScene1Button.left
                top: homeAssistantScene1Button.bottom
                topMargin: 5
            }

            bottomClickMargin: 3
            onClicked: {
                app.setHomeAssistant("scene", app.homeAssistantScene2);
            }
        }

        IconButton {
            id: homeAssistantScene3Button
            width: 120
            height: 75
            text: JSON.parse(app.homeAssistantScene3Info)['attributes']['friendly_name']

            anchors {
                left: homeAssistantScene1Button.right
                top: homeAssistantScene1Button.top
                leftMargin: 5
            }

            bottomClickMargin: 3
            onClicked: {
                        app.setHomeAssistant("scene", app.homeAssistantScene3);
            }
        }

        IconButton {
            id: homeAssistantScene4Button
            width: 120
            height: 75
            text: JSON.parse(app.homeAssistantScene4Info)['attributes']['friendly_name']
 
            anchors {
                left: homeAssistantScene3Button.left
                top: homeAssistantScene3Button.bottom
                topMargin: 5
            }

            bottomClickMargin: 3
            onClicked: {
                app.setHomeAssistant("scene", app.homeAssistantScene4);
            }
        }
    }

    //Slider section
    Rectangle {
        id: sliderArea
        width: 245
        height: 85
        color: "transparent"
        anchors {
            top: sceneRect.bottom
            left: sceneRect.left
            topMargin: 10
        }

        Text {
            id: sliderTitle
            width: 245
            height: 27
            text: JSON.parse(app.homeAssistantSlider1Info)['attributes']['friendly_name']
            font.pixelSize: 16
            font.family: qfont.semiBold.name
            color: "Black"
            wrapMode: Text.WordWrap
            anchors {
                top: parent.top
                left: parent.left
            }
        }

        Rectangle {
            id: sliderRect
            width: 245
            height: 40
            color: "transparent"
            anchors {
                top: sliderTitle.bottom
                left: parent.left
            }

            Rectangle {
                id: sliderRect1
                width: app.sliderBtnWidth
                height: parent.height
                color: "transparent"
                anchors {
                    left: parent.left
                }

                Text {
                    id: sliderOption1Label
                    text: app.homeAssistantSlider1Min
                    font.pixelSize: 10
                    color: "Black"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Image {
                    id: homeAssistantSlider1Selection
                    width: parent.width
                    height: parent.height
                    source: JSON.parse(app.homeAssistantSlider1Info)['state'] == app.homeAssistantSlider1Min ? app.imgSelected : app.imgNotSelected
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.setHomeAssistant("slider", app.homeAssistantSlider1, sliderOption1Label.text);
                        }
                    }
                }
            }

            Rectangle {
                id: sliderRect2
                width: app.sliderBtnWidth
                height: parent.height
                color: "transparent"
                anchors {
                    left: sliderRect1.right
                }

                Text {
                    id: sliderOption2Label
                    text: app.homeAssistantSlider1Min + app.homeAssistantSlider1Step
                    font.pixelSize: 10
                    color: "Black"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Image {
                    id: homeAssistantSlider2Selection
                    width: parent.width
                    height: parent.height
                    source: JSON.parse(app.homeAssistantSlider1Info)['state'] == (app.homeAssistantSlider1Min + app.homeAssistantSlider1Step) ? app.imgSelected : app.imgNotSelected
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.setHomeAssistant("slider", app.homeAssistantSlider1, sliderOption2Label.text);
                        }
                    }
                }
            }

            Rectangle {
                id: sliderRect3
                width: app.sliderBtnWidth
                height: parent.height
                color: "transparent"
                anchors {
                    left: sliderRect2.right
                }

                Text {
                    id: sliderOption3Label
                    text: app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 2)
                    font.pixelSize: 10
                    color: "Black"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Image {
                    id: homeAssistantSlider3Selection
                    width: parent.width
                    height: parent.height
                    source: JSON.parse(app.homeAssistantSlider1Info)['state'] == (app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 2)) ? app.imgSelected : app.imgNotSelected
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.setHomeAssistant("slider", app.homeAssistantSlider1, sliderOption3Label.text);
                        }
                    }
                }
            }

            Rectangle {
                id: sliderRect4
                width: app.sliderBtnWidth
                height: parent.height
                color: "transparent"
                anchors {
                    left: sliderRect3.right
                }

                Text {
                    id: sliderOption4Label
                    text: app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 3)
                    font.pixelSize: 10
                    color: "Black"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Image {
                    id: homeAssistantSlider4Selection
                    width: parent.width
                    height: parent.height
                    source: JSON.parse(app.homeAssistantSlider1Info)['state'] == (app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 3)) ? app.imgSelected : app.imgNotSelected
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.setHomeAssistant("slider", app.homeAssistantSlider1, sliderOption4Label.text);
                        }
                    }
                }
            }

            Rectangle {
                id: sliderRect5
                width: app.sliderBtnWidth
                height: parent.height
                color: "transparent"
                anchors {
                    left: sliderRect4.right
                }

                Text {
                    id: sliderOption5Label
                    text: app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 4)
                    font.pixelSize: 10
                    color: "Black"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Image {
                    id: homeAssistantSlider5Selection
                    width: parent.width
                    height: parent.height
                    source: JSON.parse(app.homeAssistantSlider1Info)['state'] == (app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 4)) ? app.imgSelected : app.imgNotSelected
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.setHomeAssistant("slider", app.homeAssistantSlider1, sliderOption5Label.text);
                        }
                    }
                }
            }

            Rectangle {
                id: sliderRect6
                width: app.sliderBtnWidth
                height: parent.height
                color: "transparent"
                anchors {
                    left: sliderRect5.right
                }

                Text {
                    id: sliderOption6Label
                    text: app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 5)
                    font.pixelSize: 10
                    color: "Black"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Image {
                    id: homeAssistantSlider6Selection
                    width: parent.width
                    height: parent.height
                    source: JSON.parse(app.homeAssistantSlider1Info)['state'] == (app.homeAssistantSlider1Min + (app.homeAssistantSlider1Step * 5)) ? app.imgSelected : app.imgNotSelected
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.setHomeAssistant("slider", app.homeAssistantSlider1, sliderOption6Label.text);
                        }
                    }
                }
            }
        }
    }

    // Switch section
    Text {
        id: switchTitle
        x: 300
        y: 130
        width: 125
        text: "Schakelaars"
        font.pixelSize: 16
        font.family: qfont.semiBold.name
        color: "Black" 
        wrapMode: Text.WordWrap
    }


    RowLayout{
		id: rowLayoutSwitches
		width: 250
        color: "transparent"
        anchors {
            top: switchTitle.bottom
            left: switchTitle.left
            topMargin: 0
        }
		spacing: 6

    }

    //Alarm section
    Text {
        id: alarmTitle
        x: 590
        y: 130
        width: 125
        text: "Alarm"
        font.pixelSize: 16
        font.family: qfont.semiBold.name
        color: "Black"
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: alarmRect
        width: 195
        height: 240
        color: "transparent"
        anchors {
            top: alarmTitle.bottom
            left: alarmTitle.left
            topMargin: 5
        }
        
        Rectangle {
            id: alarmRectTop
            width: 155
            height: 35
            radius: 10
            color: "#e8e8e8"
            anchors {
                top: alarmRect.top
                right: parent.right
                rightMargin: 20
            }

            Text {
                id: alarmInputLabel
                text: app.homeAssistantAlarmCodeLabel
                font.pixelSize: 10
                font.family: qfont.semiBold.name
                font.capitalization: Font.Capitalize
                color: "Black"
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Rectangle {
            id: alarmRect1
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRectTop.bottom
                left: alarmRect.left
                topMargin: 5
            }

            Image {
                id: alarmRect1Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }

            Text {
                id: alarmRect1Label
                text: "1"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 21
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("1");
                }
            }
        }

        Rectangle {
            id: alarmRect2
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect1.top
                left: alarmRect1.right
            }

            Image {
                id: alarmRect2Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                id: alarmRect2Label
                text: "2"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("2");
                }
            }
        }

        Rectangle {
            id: alarmRect3
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect1.top
                left: alarmRect2.right
            }

            Image {
                id: alarmRect3Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                id: alarmRect3Label
                text: "3"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 21
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("3");
                }
            }
        }

        Rectangle {
            id: alarmRect4
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect1.bottom
                left: alarmRect1.left
            }

            Image {
                id: alarmRect4Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }

            Text {
                id: alarmRect4Label
                text: "4"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 21
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("4");
                }
            }
        }

        Rectangle {
            id: alarmRect5
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect4.top
                left: alarmRect4.right
            }

            Image {
                id: alarmRect5Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                id: alarmRect5Label
                text: "5"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("5");
                }
            }
        }

        Rectangle {
            id: alarmRect6
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect4.top
                left: alarmRect5.right
            }

            Image {
                id: alarmRect6Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                id: alarmRect6Label
                text: "6"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 21
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("6");
                }
            }
        }

        Rectangle {
            id: alarmRect7
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect4.bottom
                left: alarmRect4.left
            }

            Image {
                id: alarmRect7Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }

            Text {
                id: alarmRect7Label
                text: "7"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 21
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("7");
                }
            }
        }

        Rectangle {
            id: alarmRect8
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect7.top
                left: alarmRect7.right
            }

            Image {
                id: alarmRect8Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                id: alarmRect8Label
                text: "8"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("8");
                }
            }
        }

        Rectangle {
            id: alarmRect9
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect7.top
                left: alarmRect8.right
            }

            Image {
                id: alarmRect9Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                id: alarmRect9Label
                text: "9"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 21
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("9");
                }
            }
        }

        Rectangle {
            id: alarmRectReset
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect7.bottom
                left: alarmRect7.left
            }

            Image {
                id: alarmRectResetButton;
                width: 50
                height: 50
                source: "./drawables/dialpadReset.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInputReset();
                }
            }
        }

        Rectangle {
            id: alarmRect0
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRectReset.top
                left: alarmRectReset.right
            }

            Image {
                id: alarmRect0Button;
                width: 50
                height: 50
                source: "./drawables/dialpadButton.png"
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                id: alarmRect0Label
                text: "0"
                font.pixelSize: 14
                color: "#757575"
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.alarmInput("0");
                }
            }
        }

        Rectangle {
            id: alarmRectEnter
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect0.top
                left: alarmRect0.right
            }

            Image {
                id: alarmRectEnterButton;
                width: 50
                height: 50
                source: app.homeAssistantAlarmState == "disarmed" ? app.imgUnlocked : app.imgLocked
                smooth: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.homeAssistantAlarmCodeLabel = "****";

                    if (app.homeAssistantAlarmCode.length > 0) {
                        app.setHomeAssistant("alarm", app.homeAssistantAlarm1, 0);
                    } else {
                        app.setHomeAssistant("alarm", app.homeAssistantAlarm1, 1);
                    }
                }
            }
        }
    }
}

