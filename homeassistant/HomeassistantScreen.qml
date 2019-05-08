import QtQuick 2.1
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

        logRect.visible = false;
        
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

    property alias logR: logRect

    Rectangle {
        id: logRect
        z: 100
        x: 100
        y: 50
        width: 600
        height: 300
        radius: 10
        border.color: "#9e9e9e"
        border.width: 1
        color: "#f5f5f5"

        Text {
            id: logText
            x: 30
            y: 10
            width: 540
            text: app.message
            font.pixelSize: 10
            font.family: qfont.semiBold.name
            color: "#212121"
            wrapMode: Text.WordWrap
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                logRect.visible = false;
                app.message = "";
            }
        }
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
                    app.setSliderObject();
                    app.getAlarmInfo();
                }
            }
        }

        Rectangle {
            id: sensorRect1
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
                text: try { JSON.parse(app.homeAssistantSensor1Info)['attributes']['friendly_name'] } catch(e) { "" }
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: parent.top
                }
            }

            Text {
                id: homeAssistantSensor2Name
                text: try { JSON.parse(app.homeAssistantSensor2Info)['attributes']['friendly_name'] } catch(e) { "" }
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor1Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor3Name
                text: try { JSON.parse(app.homeAssistantSensor3Info)['attributes']['friendly_name'] } catch(e) { "" }
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor2Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor4Name
                text: try { JSON.parse(app.homeAssistantSensor4Info)['attributes']['friendly_name'] } catch(e) { "" }
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
                text: try { (JSON.parse(app.homeAssistantSensor1Info)['state'] + " " + JSON.parse(app.homeAssistantSensor1Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor1Info)['state'] } catch(e) { "" } }
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
                text: try { (JSON.parse(app.homeAssistantSensor2Info)['state'] + " " + JSON.parse(app.homeAssistantSensor2Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor2Info)['state'] } catch(e) { "" } }
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
                text: try { (JSON.parse(app.homeAssistantSensor3Info)['state'] + " " + JSON.parse(app.homeAssistantSensor3Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor3Info)['state'] } catch(e) { "" } } 
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
                text: try { (JSON.parse(app.homeAssistantSensor4Info)['state'] + " " + JSON.parse(app.homeAssistantSensor4Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor4Info)['state'] } catch(e) { "" } }
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
                text: try { JSON.parse(app.homeAssistantSensor5Info)['attributes']['friendly_name'] } catch(e) { "" }
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: parent.top
                }
            }

            Text {
                id: homeAssistantSensor6Name
                text: try { JSON.parse(app.homeAssistantSensor6Info)['attributes']['friendly_name'] } catch(e) { "" }
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor5Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor7Name
                text: try { JSON.parse(app.homeAssistantSensor7Info)['attributes']['friendly_name'] } catch(e) { "" }
                font.pixelSize: 12
                color: "Black" 
                wrapMode: Text.WordWrap
                anchors {
                    top: homeAssistantSensor6Name.bottom
                }
            }

            Text {
                id: homeAssistantSensor8Name
                text: try { JSON.parse(app.homeAssistantSensor8Info)['attributes']['friendly_name'] } catch(e) { "" }
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
                text: try { (JSON.parse(app.homeAssistantSensor5Info)['state'] + " " + JSON.parse(app.homeAssistantSensor5Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor5Info)['state'] } catch(e) { "" } }
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
                text: try { (JSON.parse(app.homeAssistantSensor6Info)['state'] + " " + JSON.parse(app.homeAssistantSensor6Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor6Info)['state'] } catch(e) { "" } }
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
                text: try { (JSON.parse(app.homeAssistantSensor7Info)['state'] + " " + JSON.parse(app.homeAssistantSensor7Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor7Info)['state'] } catch(e) { "" } }
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
                text: try { (JSON.parse(app.homeAssistantSensor8Info)['state'] + " " + JSON.parse(app.homeAssistantSensor8Info)['attributes']['unit_of_measurement']).replace("undefined", "") } catch(e) { try { JSON.parse(app.homeAssistantSensor8Info)['state'] } catch(e) { "" } } 
                font.pixelSize: 12
                color: "Black"
                wrapMode: Text.WordWrap
                anchors {
                        top: homeAssistantSensor7Value.bottom
                        right: homeAssistantSensor7Value.right
                }
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
            text: try { JSON.parse(app.homeAssistantScene1Info)['attributes']['friendly_name'] } catch(e) { "" }
            anchors {
                left: parent.left
                top: parent.top
            }

            bottomClickMargin: 3
            onClicked: {
                app.setHomeAssistant(app.homeAssistantScene1);
            }
        }

        IconButton {
            id: homeAssistantScene2Button
            width: 120
            height: 75
            text: try { JSON.parse(app.homeAssistantScene2Info)['attributes']['friendly_name'] } catch(e) { "" }

            anchors {
                left: homeAssistantScene1Button.left
                top: homeAssistantScene1Button.bottom
                topMargin: 5
            }

            bottomClickMargin: 3
            onClicked: {
                app.setHomeAssistant(app.homeAssistantScene2);
            }
        }

        IconButton {
            id: homeAssistantScene3Button
            width: 120
            height: 75
            text: try { JSON.parse(app.homeAssistantScene3Info)['attributes']['friendly_name'] } catch(e) { "" }

            anchors {
                left: homeAssistantScene1Button.right
                top: homeAssistantScene1Button.top
                leftMargin: 5
            }

            bottomClickMargin: 3
            onClicked: {
                        app.setHomeAssistant(app.homeAssistantScene3);
            }
        }

        IconButton {
            id: homeAssistantScene4Button
            width: 120
            height: 75
            text: try { JSON.parse(app.homeAssistantScene4Info)['attributes']['friendly_name'] } catch(e) { "" }
 
            anchors {
                left: homeAssistantScene3Button.left
                top: homeAssistantScene3Button.bottom
                topMargin: 5
            }

            bottomClickMargin: 3
            onClicked: {
                app.setHomeAssistant(app.homeAssistantScene4);
            }
        }
    }

    property alias sliderA: sliderArea

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
            text: try { JSON.parse(app.homeAssistantSlider1Info)['attributes']['friendly_name'] } catch(e) { "" }
            font.pixelSize: 16
            font.family: qfont.semiBold.name
            color: "Black"
            wrapMode: Text.WordWrap
            anchors {
                top: parent.top
                left: parent.left
            }
        }

        property alias sliderR: sliderRect

        Rectangle {
            id: sliderRect
            width: 245
            height: 40
            color: "transparent"
            anchors {
                top: sliderTitle.bottom
                left: parent.left
            }

            property alias sliderR1: sliderRect1

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

                property bool on: false

                Image {
                    id: homeAssistantSlider1Selection
                    width: parent.width
                    height: parent.height
                    source: "./drawables/notselected.png"
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (app.connected) {
                                parent.source = "./drawables/selected.png"
                                homeAssistantSlider2Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider3Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider4Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider5Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider6Selection.source = "./drawables/notselected.png"
                                app.setHomeAssistant(app.homeAssistantSlider1, sliderOption1Label.text);
                            } else {
                                app.logText("Unable to send command. Please verify connection settings.");
                            }
                        }
                    }
                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: homeAssistantSlider1Selection; source: "./drawables/selected.png" }
                        PropertyChanges { target: sliderRect1; on: true }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: homeAssistantSlider1Selection; source: "./drawables/notselected.png" }
                        PropertyChanges { target: sliderRect1; on: false }
                    }
                ]
            }

            property alias sliderR2: sliderRect2

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

                property bool on: false

                Image {
                    id: homeAssistantSlider2Selection
                    width: parent.width
                    height: parent.height
                    source: "./drawables/notselected.png"
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (app.connected) {
                                parent.source = "./drawables/selected.png"
                                homeAssistantSlider1Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider3Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider4Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider5Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider6Selection.source = "./drawables/notselected.png"
                                app.setHomeAssistant(app.homeAssistantSlider1, sliderOption2Label.text);
                            } else {
                                app.logText("Unable to send command. Please verify connection settings.");
                            }
                        }
                    }
                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: homeAssistantSlider2Selection; source: "./drawables/selected.png" }
                        PropertyChanges { target: sliderRect2; on: true }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: homeAssistantSlider2Selection; source: "./drawables/notselected.png" }
                        PropertyChanges { target: sliderRect2; on: false }
                    }
                ]
            }

            property alias sliderR3: sliderRect3

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

                property bool on: false

                Image {
                    id: homeAssistantSlider3Selection
                    width: parent.width
                    height: parent.height
                    source: "./drawables/notselected.png"
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (app.connected) {
                                parent.source = "./drawables/selected.png"
                                homeAssistantSlider1Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider2Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider4Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider5Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider6Selection.source = "./drawables/notselected.png"
                                app.setHomeAssistant(app.homeAssistantSlider1, sliderOption3Label.text);
                            } else {
                                app.logText("Unable to send command. Please verify connection settings.");
                            }
                        }
                    }
                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: homeAssistantSlider3Selection; source: "./drawables/selected.png" }
                        PropertyChanges { target: sliderRect3; on: true }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: homeAssistantSlider3Selection; source: "./drawables/notselected.png" }
                        PropertyChanges { target: sliderRect3; on: false }
                    }
                ]
            }

            property alias sliderR4: sliderRect4

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

                property bool on: false

                Image {
                    id: homeAssistantSlider4Selection
                    width: parent.width
                    height: parent.height
                    source: "./drawables/notselected.png"
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (app.connected) {
                                parent.source = "./drawables/selected.png"
                                homeAssistantSlider1Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider2Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider3Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider5Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider6Selection.source = "./drawables/notselected.png"
                                app.setHomeAssistant(app.homeAssistantSlider1, sliderOption4Label.text);
                            } else {
                                app.logText("Unable to send command. Please verify connection settings.");
                            }
                        }
                    }
                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: homeAssistantSlider4Selection; source: "./drawables/selected.png" }
                        PropertyChanges { target: sliderRect4; on: true }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: homeAssistantSlider4Selection; source: "./drawables/notselected.png" }
                        PropertyChanges { target: sliderRect4; on: false }
                    }
                ]
            }

            property alias sliderR5: sliderRect5

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

                property bool on: false

                Image {
                    id: homeAssistantSlider5Selection
                    width: parent.width
                    height: parent.height
                    source: "./drawables/notselected.png"
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (app.connected) {
                                parent.source = "./drawables/selected.png"
                                homeAssistantSlider1Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider2Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider3Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider4Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider6Selection.source = "./drawables/notselected.png"
                                app.setHomeAssistant(app.homeAssistantSlider1, sliderOption5Label.text);
                            } else {
                                app.logText("Unable to send command. Please verify connection settings.");
                            }
                        }
                    }
                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: homeAssistantSlider5Selection; source: "./drawables/selected.png" }
                        PropertyChanges { target: sliderRect5; on: true }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: homeAssistantSlider5Selection; source: "./drawables/notselected.png" }
                        PropertyChanges { target: sliderRect5; on: false }
                    }
                ]
            }

            property alias sliderR6: sliderRect6

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

                property bool on: false

                Image {
                    id: homeAssistantSlider6Selection
                    width: parent.width
                    height: parent.height
                    source: "./drawables/notselected.png"
                    smooth: true
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (app.connected) {
                                parent.source = "./drawables/selected.png"
                                homeAssistantSlider1Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider2Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider3Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider4Selection.source = "./drawables/notselected.png"
                                homeAssistantSlider5Selection.source = "./drawables/notselected.png"
                                app.setHomeAssistant(app.homeAssistantSlider1, sliderOption6Label.text);
                            } else {
                                app.logText("Unable to send command. Please verify connection settings.");
                            }
                        }
                    }
                }

                states: [
                    State {
                        name: "on"
                        PropertyChanges { target: homeAssistantSlider6Selection; source: "./drawables/selected.png" }
                        PropertyChanges { target: sliderRect6; on: true }
                    },
                    State {
                        name: "off"
                        PropertyChanges { target: homeAssistantSlider6Selection; source: "./drawables/notselected.png" }
                        PropertyChanges { target: sliderRect6; on: false }
                    }
                ]
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

    property alias switch1R: switchRect1

    Rectangle {
        id: switchRect1
        width: 250
        color: "transparent"
        anchors {
            top: switchTitle.bottom
            left: switchTitle.left
            topMargin: 0
        }

        Text {
            id: homeAssistantSwitch1Name
            width: 200
            text: try { JSON.parse(app.homeAssistantSwitch1Info)['attributes']['friendly_name'] } catch(e) { "" }
            font.pixelSize: 12
            color: "Black" 
            wrapMode: Text.WordWrap
            anchors {
                verticalCenter: switchRect1.verticalCenter
            }
        }

        property alias switch1: toggleSwitch1

        Item {
            id: toggleSwitch1
            width: 54
            height: 36
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            
            property bool on: false

            Image {
                id: homeAssistantSwitch1Button
                x: 0; y: 0
                width: 54
                height: 36
                source: "./drawables/backgroundOff.png"
                smooth: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch1.state == "on") {
                                parent.source = "./drawables/backgroundOff.png"
                                knob.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch1, 0);
                            } else {
                                parent.source = "./drawables/backgroundOn.png"
                                knob.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch1, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            Image {
                id: knob
                x: 1; y: 0
                width: 32
                height: 36
                source: "./drawables/knob.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch1.state == "on") {
                                homeAssistantSwitch1Button.source = "./drawables/backgroundOff.png"
                                parent.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch1, 0);
                            } else {
                                homeAssistantSwitch1Button.source = "./drawables/backgroundOn.png"
                                parent.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch1, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            states: [
                State {
                    name: "on"
                    PropertyChanges { target: knob; x: 22 }
                    PropertyChanges { target: homeAssistantSwitch1Button; source: "./drawables/backgroundOn.png" }
                    PropertyChanges { target: toggleSwitch1; on: true }
                },
                State {
                    name: "off"
                    PropertyChanges { target: knob; x: 1 }
                    PropertyChanges { target: homeAssistantSwitch1Button; source: "./drawables/backgroundOff.png" }
                    PropertyChanges { target: toggleSwitch1; on: false }
                }
            ]
        }
    }

    property alias switch2R: switchRect2

    Rectangle {
        id: switchRect2
        anchors.top: switchRect1.bottom
        anchors.left: switchRect1.left
        width: 250 
        color: "transparent"

        Text {
            id: homeAssistantSwitch2Name
            width: 200
            text: try { JSON.parse(app.homeAssistantSwitch2Info)['attributes']['friendly_name'] } catch(e) { "" }
            font.pixelSize: 12
            color: "Black" 
            wrapMode: Text.WordWrap
            anchors {
                verticalCenter: switchRect2.verticalCenter
            }
        }

        property alias switch2: toggleSwitch2

        Item {
            id: toggleSwitch2
            width: 54
            height: 36
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            
            property bool on: false

            Image {
                id: homeAssistantSwitch2Button
                x: 0; y: 0
                width: 54
                height: 36
                source: "./drawables/backgroundOff.png"
                smooth: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch2.state == "on") {
                                parent.source = "./drawables/backgroundOff.png"
                                knob2.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch2, 0);
                            } else {
                                parent.source = "./drawables/backgroundOn.png"
                                knob2.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch2, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            Image {
                id: knob2
                x: 1; y: 0
                width: 32
                height: 36
                source: "./drawables/knob.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch2.state == "on") {
                                homeAssistantSwitch2Button.source = "./drawables/backgroundOff.png"
                                parent.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch2, 0);
                            } else {
                                homeAssistantSwitch2Button.source = "./drawables/backgroundOn.png"
                                parent.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch2, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            states: [
                State {
                    name: "on"
                    PropertyChanges { target: knob2; x: 22 }
                    PropertyChanges { target: homeAssistantSwitch2Button; source: "./drawables/backgroundOn.png" }
                    PropertyChanges { target: toggleSwitch2; on: true }
                },
                State {
                    name: "off"
                    PropertyChanges { target: knob2; x: 1 }
                    PropertyChanges { target: homeAssistantSwitch2Button; source: "./drawables/backgroundOff.png" }
                    PropertyChanges { target: toggleSwitch2; on: false }
                }
            ]
        }
    }

    property alias switch3R: switchRect3

    Rectangle {
        id: switchRect3
        anchors.top: switchRect2.bottom
        anchors.left: switchRect2.left
        width: 250 
        color: "transparent"

        Text {
            id: homeAssistantSwitch3Name
            width: 200
            text: try { JSON.parse(app.homeAssistantSwitch3Info)['attributes']['friendly_name'] } catch(e) { "" }
            font.pixelSize: 12
            color: "Black" 
            wrapMode: Text.WordWrap
            anchors {
                verticalCenter: switchRect3.verticalCenter
            }
        }

        property alias switch3: toggleSwitch3

        Item {
            id: toggleSwitch3
            width: 54
            height: 36
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            
            property bool on: false

            Image {
                id: homeAssistantSwitch3Button
                x: 0; y: 0
                width: 54
                height: 36
                source: "./drawables/backgroundOff.png"
                smooth: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch3.state == "on") {
                                parent.source = "./drawables/backgroundOff.png"
                                knob3.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch3, 0);
                            } else {
                                parent.source = "./drawables/backgroundOn.png"
                                knob3.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch3, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            Image {
                id: knob3
                x: 1; y: 0
                width: 32
                height: 36
                source: "./drawables/knob.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch3.state == "on") {
                                homeAssistantSwitch3Button.source = "./drawables/backgroundOff.png"
                                parent.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch3, 0);
                            } else {
                                homeAssistantSwitch3Button.source = "./drawables/backgroundOn.png"
                                parent.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch3, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            states: [
                State {
                    name: "on"
                    PropertyChanges { target: knob3; x: 22 }
                    PropertyChanges { target: homeAssistantSwitch3Button; source: "./drawables/backgroundOn.png" }
                    PropertyChanges { target: toggleSwitch3; on: true }
                },
                State {
                    name: "off"
                    PropertyChanges { target: knob3; x: 1 }
                    PropertyChanges { target: homeAssistantSwitch3Button; source: "./drawables/backgroundOff.png" }
                    PropertyChanges { target: toggleSwitch3; on: false }
                }
            ]
        }
    }

    property alias switch4R: switchRect4

    Rectangle {
        id: switchRect4
        anchors.top: switchRect3.bottom
        anchors.left: switchRect3.left
        width: 250 
        color: "transparent"

        Text {
            id: homeAssistantSwitch4Name
            width: 200
            text: try { JSON.parse(app.homeAssistantSwitch4Info)['attributes']['friendly_name'] } catch(e) { "" }
            font.pixelSize: 12
            color: "Black" 
            wrapMode: Text.WordWrap
            anchors {
                verticalCenter: switchRect4.verticalCenter
            }
        }

        property alias switch4: toggleSwitch4

        Item {
            id: toggleSwitch4
            width: 54
            height: 36
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            
            property bool on: false

            Image {
                id: homeAssistantSwitch4Button
                x: 0; y: 0
                width: 54
                height: 36
                source: "./drawables/backgroundOff.png"
                smooth: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch4.state == "on") {
                                parent.source = "./drawables/backgroundOff.png"
                                knob4.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch4, 0);
                            } else {
                                parent.source = "./drawables/backgroundOn.png"
                                knob4.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch4, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            Image {
                id: knob4
                x: 1; y: 0
                width: 32
                height: 36
                source: "./drawables/knob.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch4.state == "on") {
                                homeAssistantSwitch4Button.source = "./drawables/backgroundOff.png"
                                parent.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch4, 0);
                            } else {
                                homeAssistantSwitch4Button.source = "./drawables/backgroundOn.png"
                                parent.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch4, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            states: [
                State {
                    name: "on"
                    PropertyChanges { target: knob4; x: 22 }
                    PropertyChanges { target: homeAssistantSwitch4Button; source: "./drawables/backgroundOn.png" }
                    PropertyChanges { target: toggleSwitch4; on: true }
                },
                State {
                    name: "off"
                    PropertyChanges { target: knob4; x: 1 }
                    PropertyChanges { target: homeAssistantSwitch4Button; source: "./drawables/backgroundOff.png" }
                    PropertyChanges { target: toggleSwitch4; on: false }
                }
            ]
        }
    }

    property alias switch5R: switchRect5

    Rectangle {
        id: switchRect5
        anchors.top: switchRect4.bottom
        anchors.left: switchRect4.left
        width: 250 
        color: "transparent"

        Text {
            id: homeAssistantSwitch5Name
            width: 200
            text: try { JSON.parse(app.homeAssistantSwitch5Info)['attributes']['friendly_name'] } catch(e) { "" }
            font.pixelSize: 12
            color: "Black" 
            wrapMode: Text.WordWrap
            anchors {
                verticalCenter: switchRect5.verticalCenter
            }
        }

        property alias switch5: toggleSwitch5

        Item {
            id: toggleSwitch5
            width: 54
            height: 36
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            
            property bool on: false

            Image {
                id: homeAssistantSwitch5Button
                x: 0; y: 0
                width: 54
                height: 36
                source: "./drawables/backgroundOff.png"
                smooth: true

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch5.state == "on") {
                                parent.source = "./drawables/backgroundOff.png"
                                knob5.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch5, 0);
                            } else {
                                parent.source = "./drawables/backgroundOn.png"
                                knob5.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch5, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            Image {
                id: knob5
                x: 1; y: 0
                width: 32
                height: 36
                source: "./drawables/knob.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (app.connected) {
                            if (toggleSwitch5.state == "on") {
                                homeAssistantSwitch5Button.source = "./drawables/backgroundOff.png"
                                parent.x = 1;
                                app.setHomeAssistant(app.homeAssistantSwitch5, 0);
                            } else {
                                homeAssistantSwitch5Button.source = "./drawables/backgroundOn.png"
                                parent.x = 22;
                                app.setHomeAssistant(app.homeAssistantSwitch5, 1);
                            }
                        } else {
                            app.logText("Unable to send command. Please verify connection settings.");
                        }
                    }
                }
            }

            states: [
                State {
                    name: "on"
                    PropertyChanges { target: knob5; x: 22 }
                    PropertyChanges { target: homeAssistantSwitch5Button; source: "./drawables/backgroundOn.png" }
                    PropertyChanges { target: toggleSwitch5; on: true }
                },
                State {
                    name: "off"
                    PropertyChanges { target: knob5; x: 1 }
                    PropertyChanges { target: homeAssistantSwitch5Button; source: "./drawables/backgroundOff.png" }
                    PropertyChanges { target: toggleSwitch5; on: false }
                }
            ]
        }
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

    property alias alarmR: alarmRect

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

        property alias alarmREnter: alarmRectEnter

        Rectangle {
            id: alarmRectEnter
            height: 50
            width: 65
            color: "transparent"
            anchors {
                top: alarmRect0.top
                left: alarmRect0.right
            }

            property bool on: false

            Image {
                id: alarmRectEnterButton;
                width: 50
                height: 50
                source: "./drawables/dialpadUnlocked.png"
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

                    if (app.connected) {
                        if (app.homeAssistantAlarmCode.length > 0 && alarmRectEnter.state == "on") {
                            alarmRectEnterButton.source = "./drawables/dialpadUnlocked.png"
                            app.setHomeAssistant(app.homeAssistantAlarm1, 0);
                        } else {
                            alarmRectEnterButton.source = "./drawables/dialpadLocked.png"
                            app.setHomeAssistant(app.homeAssistantAlarm1, 1);
                        }
                    } else {
                        app.logText("Unable to send command. Please verify connection settings.");
                    }
                }
            }

            states: [
                State {
                    name: "on"
                    PropertyChanges { target: alarmRectEnterButton; source: "./drawables/dialpadLocked.png" }
                    PropertyChanges { target: alarmRectEnter; on: true }
                },
                State {
                    name: "off"
                    PropertyChanges { target: alarmRectEnterButton; source: "./drawables/dialpadUnlocked.png" }
                    PropertyChanges { target: alarmRectEnter; on: false }
                }
            ]
        }
    }
}