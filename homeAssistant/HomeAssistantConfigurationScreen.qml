import QtQuick 1.1
import qb.components 1.0

Screen {
    id: homeAssistantConfigurationScreen

    screenTitle: "Home Assistant Configuratie"

    //Function to store Home Assistant server IP to application variable
    function saveHomeAssistantServer(text) {
        app.homeAssistantServer = text;
        homeAssistantServerLabel.inputText = app.homeAssistantServer;
    }

    //Function to store Home Assistant IP to application variable
    function saveHomeAssistantPort(text) {
        app.homeAssistantPort = text;
        homeAssistantPortLabel.inputText = app.homeAssistantPort;
    }

    //Function to store Home Assistant password to application variable
    function saveHomeAssistantPass(text) {
        app.homeAssistantPass = text;
        homeAssistantPassLabel.inputText = "*****";
    }

    //Function to store entity_id of first sensor to application variable
    function saveHomeAssistantSensor1(text) {
        app.homeAssistantSensor1 = text;
        homeAssistantSensor1Label.inputText = app.homeAssistantSensor1;
    }

    //Function to store entity_id of second sensor to application variable
    function saveHomeAssistantSensor2(text) {
        app.homeAssistantSensor2 = text;
        homeAssistantSensor2Label.inputText = app.homeAssistantSensor2;
    }

    //Function to store entity_id of third sensor to application variable
    function saveHomeAssistantSensor3(text) {
        app.homeAssistantSensor3 = text;
        homeAssistantSensor3Label.inputText = app.homeAssistantSensor3;
    }

    //Function to store entity_id of fourth sensor to application variable
    function saveHomeAssistantSensor4(text) {
        app.homeAssistantSensor4 = text;
        homeAssistantSensor4Label.inputText = app.homeAssistantSensor4;
    }

    //Function to store entity_id of fifth sensor to application variable
    function saveHomeAssistantSensor5(text) {
        app.homeAssistantSensor5 = text;
        homeAssistantSensor5Label.inputText = app.homeAssistantSensor5;
    }

    //Function to store entity_id of sixth sensor to application variable
    function saveHomeAssistantSensor6(text) {
        app.homeAssistantSensor6 = text;
        homeAssistantSensor6Label.inputText = app.homeAssistantSensor6;
    }

    //Function to store entity_id of seventh sensor to application variable
    function saveHomeAssistantSensor7(text) {
        app.homeAssistantSensor7 = text;
        homeAssistantSensor7Label.inputText = app.homeAssistantSensor7;
    }

    //Function to store entity_id of eight sensor to application variable
    function saveHomeAssistantSensor8(text) {
        app.homeAssistantSensor8 = text;
        homeAssistantSensor8Label.inputText = app.homeAssistantSensor8;
    }

    //Function to store entity_id of first scene to application variable
    function saveHomeAssistantScene1(text) {
        app.homeAssistantScene1 = text;
        homeAssistantScene1Label.inputText = app.homeAssistantScene1;
    }

    //Function to store entity_id of second scene to application variable
    function saveHomeAssistantScene2(text) {
        app.homeAssistantScene2 = text;
        homeAssistantScene2Label.inputText = app.homeAssistantScene2;
    }

    //Function to store entity_id of third scene to application variable
    function saveHomeAssistantScene3(text) {
        app.homeAssistantScene3 = text;
        homeAssistantScene3Label.inputText = app.homeAssistantScene3;
    }

    //Function to store entity_id of fourth scene to application variable
    function saveHomeAssistantScene4(text) {
        app.homeAssistantScene4 = text;
        homeAssistantScene4Label.inputText = app.homeAssistantScene4;
    }

    //Function to store entity_id of first slider to application variable
    function saveHomeAssistantSlider1(text) {
        app.homeAssistantSlider1 = text;
        homeAssistantSlider1Label.inputText = app.homeAssistantSlider1;
    }

    //Function to store entity_id of first switch to application variable
    function saveHomeAssistantSwitch1(text) {
        app.homeAssistantSwitch1 = text;
        homeAssistantSwitch1Label.inputText = app.homeAssistantSwitch1;
    }

    //Function to store entity_id of second switch to application variable
    function saveHomeAssistantSwitch2(text) {
        app.homeAssistantSwitch2 = text;
        homeAssistantSwitch2Label.inputText = app.homeAssistantSwitch2;
    }

    //Function to store entity_id of third switch to application variable
    function saveHomeAssistantSwitch3(text) {
        app.homeAssistantSwitch3 = text;
        homeAssistantSwitch3Label.inputText = app.homeAssistantSwitch3;
    }

    //Function to store entity_id of fourth switch to application variable
    function saveHomeAssistantSwitch4(text) {
        app.homeAssistantSwitch4 = text;
        homeAssistantSwitch4Label.inputText = app.homeAssistantSwitch4;
    }

    //Function to store entity_id of fifth switch to application variable
    function saveHomeAssistantSwitch5(text) {
        app.homeAssistantSwitch5 = text;
        homeAssistantSwitch5Label.inputText = app.homeAssistantSwitch5;
    }

    //Function to validate entered Home Assistant PORT number
    function numValidate(text, isFinal) {
        if (isFinal) {
            if (text.match(/^[0-9]*$/)) {
                return null;
            }
            else {
                return {content: "Poortnummer onjuist"};
            }
            return null;
        }
        return null;
    }

    //Function load values into configuration textboxes when the configuration form is shown
    onShown: {
        addCustomTopRightButton("Opslaan");
        homeAssistantServerLabel.inputText = app.homeAssistantServer;
        homeAssistantPortLabel.inputText = app.homeAssistantPort;
        homeAssistantPassLabel.inputText = "*****";
        homeAssistantSensor1Label.inputText = app.homeAssistantSensor1;
        homeAssistantSensor2Label.inputText = app.homeAssistantSensor2;
        homeAssistantSensor3Label.inputText = app.homeAssistantSensor3;
        homeAssistantSensor4Label.inputText = app.homeAssistantSensor4;
        homeAssistantSensor5Label.inputText = app.homeAssistantSensor5;
        homeAssistantSensor6Label.inputText = app.homeAssistantSensor6;
        homeAssistantSensor7Label.inputText = app.homeAssistantSensor7;
        homeAssistantSensor8Label.inputText = app.homeAssistantSensor8;
        homeAssistantScene1Label.inputText = app.homeAssistantScene1;
        homeAssistantScene2Label.inputText = app.homeAssistantScene2; 
        homeAssistantScene3Label.inputText = app.homeAssistantScene3; 
        homeAssistantScene4Label.inputText = app.homeAssistantScene4;
        homeAssistantSlider1Label.inputText = app.homeAssistantSlider1;
        homeAssistantSwitch1Label.inputText = app.homeAssistantSwitch1;
        homeAssistantSwitch2Label.inputText = app.homeAssistantSwitch2;
        homeAssistantSwitch3Label.inputText = app.homeAssistantSwitch3;
        homeAssistantSwitch4Label.inputText = app.homeAssistantSwitch4;
        homeAssistantSwitch5Label.inputText = app.homeAssistantSwitch5;
    }

    //Function to close the configuration form and save the textbox values to the usersettings file
    onCustomButtonClicked: {
        hide();
        app.saveHomeAssistantSettingsJson();
    }

    hasBackButton : true

    //Home Assistant connection textboxes
    Rectangle {
        id: grid1
        x: 20
        y: 20
        width: 760
        height: 140
        color: "transparent"

        EditTextLabel4421 {
            id: homeAssistantServerLabel
            width: 760
            height: 35
            leftTextAvailableWidth: 450
            leftText: "Server IP:"
    
            onClicked: {
                qkeyboard.open("Voer het IP adres van Home Assistant in", homeAssistantServerLabel.inputText, saveHomeAssistantServer)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantPortLabel
            width: 760
            height: 35
            leftTextAvailableWidth: 450
            leftText: "Poort:"
            anchors {
                top: homeAssistantServerLabel.bottom
                topMargin: 6
            }

            onClicked: {
                qnumKeyboard.open("Voer het poort nr. van Home Assistant in", homeAssistantPortLabel.inputText, "", 1, saveHomeAssistantPort, numValidate)
                qnumKeyboard.maxTextLength = 4;
                qnumKeyboard.state = "num_integer_clear_backspace";
            }
        }

        EditTextLabel4421 {
            id: homeAssistantPassLabel
            width: 760
            height: 35
            leftTextAvailableWidth: 450
            leftText: "Pass:"
            anchors {
                top: homeAssistantPortLabel.bottom
                topMargin: 16
            }

            onClicked: {
                homeAssistantPassLabel.inputText = "";
                qkeyboard.open("Voer het wachtwoord voor Home Assistant in", homeAssistantPassLabel.inputText, saveHomeAssistantPass)
            }
        }
    }


    //Sensor settings textboxes
    Rectangle {
        id: gridSensors
        anchors.top: grid1.bottom
        anchors.horizontalCenter: parent.horizontalCenter   
        width: 650
        height: 250
        radius: 10
        color: "#e8e8e8"
        visible: true

        Text {
            id: page1Title
            x: 20
            y: 10
            width: 120
            text: "Sensoren"
            font.pixelSize: 14
            font.family: qfont.semiBold.name
            color: "Black"
            wrapMode: Text.WordWrap
        }

        EditTextLabel4421 {
            id: homeAssistantSensor1Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "1:"
            anchors {
                top: page1Title.bottom
                left: page1Title.left
                topMargin: 10
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in voor sensor 1", homeAssistantSensor1Label.inputText, saveHomeAssistantSensor1)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor2Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "2:"
            anchors {
                top: homeAssistantSensor1Label.bottom
                left: homeAssistantSensor1Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 2", homeAssistantSensor2Label.inputText, saveHomeAssistantSensor2)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor3Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "3:"
            anchors {
                top: homeAssistantSensor2Label.bottom
                left: homeAssistantSensor2Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 3", homeAssistantSensor3Label.inputText, saveHomeAssistantSensor3)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor4Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "4:"
            anchors {
                top: homeAssistantSensor3Label.bottom
                left: homeAssistantSensor3Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 4", homeAssistantSensor4Label.inputText, saveHomeAssistantSensor4)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor5Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "5:"
            anchors {
                top: homeAssistantSensor1Label.top
                left: homeAssistantSensor1Label.right
                leftMargin: 20
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 5", homeAssistantSensor5Label.inputText, saveHomeAssistantSensor5)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor6Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "6:"
            anchors {
                top: homeAssistantSensor5Label.bottom
                left: homeAssistantSensor5Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 6", homeAssistantSensor6Label.inputText, saveHomeAssistantSensor6)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor7Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "7:"
            anchors {
                top: homeAssistantSensor6Label.bottom
                left: homeAssistantSensor6Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 7", homeAssistantSensor7Label.inputText, saveHomeAssistantSensor7)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSensor8Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "8:"
            anchors {
                top: homeAssistantSensor7Label.bottom
                left: homeAssistantSensor7Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de sensor 8", homeAssistantSensor8Label.inputText, saveHomeAssistantSensor8)
            }
        }

        Rectangle {
            width: 150
            height: 35
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "transparent"

            Image {
                id: navLeftButton1
                width: 18
                height: 28
                anchors {
                    right: parent.right
                    rightMargin: 20
                }
                source: "./drawables/navArrow-left.png"
                smooth: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridSensors.visible = false;
                    gridSwitches.visible = true;
                }
            }
        }

        Image {
            id: navPageImage1
            width: 100
            height: 28
            source: "./drawables/page1.png"
            smooth: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 10
            }
        }

        Rectangle {
            width: 150
            height: 35
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "transparent" 

            Image {
                id: navRightButton1
                width: 18
                height: 28
                source: "./drawables/navArrow-right.png"
                smooth: true 
                anchors {
                    left: parent.left
                    leftMargin: 20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridSensors.visible = false;
                    gridScenes.visible = true;
                }
            }
        }
    }


    //Scene & slider settings textboxes
    Rectangle {
        id: gridScenes
        anchors.top: grid1.bottom
        anchors.horizontalCenter: parent.horizontalCenter   
        width: 650
        height: 250
        radius: 10
        color: "#e8e8e8"
        visible: false

        Text {
            id: page2Title
            x: 20
            y: 10
            width: 120
            text: "Scenes"
            font.pixelSize: 14
            font.family: qfont.semiBold.name
            color: "Black"
            wrapMode: Text.WordWrap
        }

        EditTextLabel4421 {
            id: homeAssistantScene1Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "1:"
            anchors {
                top: page2Title.bottom
                left: page2Title.left
                topMargin: 10
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de scene voor knop 1", homeAssistantScene1Label.inputText, saveHomeAssistantScene1)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantScene2Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "2:"

            anchors {
                top: homeAssistantScene1Label.bottom
                left: homeAssistantScene1Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de scene voor knop 2", homeAssistantScene2Label.inputText, saveHomeAssistantScene2)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantScene3Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "3:"

            anchors {
                top: homeAssistantScene2Label.bottom
                left: homeAssistantScene2Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de scene voor knop 3", homeAssistantScene3Label.inputText, saveHomeAssistantScene3)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantScene4Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "4:"

            anchors {
                top: homeAssistantScene3Label.bottom
                left: homeAssistantScene3Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in van de scene voor knop 4", homeAssistantScene4Label.inputText, saveHomeAssistantScene4)
            }
        }

        Text {
            id: page2Title2
            x: 335
            y: 10
            width: 120
            text: "Slider"
            font.pixelSize: 14
            font.family: qfont.semiBold.name
            color: "Black"
            wrapMode: Text.WordWrap
        }

        EditTextLabel4421 {
            id: homeAssistantSlider1Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "1:"
            anchors {
                top: homeAssistantScene1Label.top
                left: homeAssistantScene1Label.right
                leftMargin: 20
            }
            onClicked: {
                qkeyboard.open("Voer het entity_id in voor slider 1", homeAssistantSlider1Label.inputText, saveHomeAssistantSlider1)
            }
        }

        Rectangle {
            width: 150
            height: 35
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "transparent"

            Image {
                id: navLeftButton2
                width: 18
                height: 28
                source: "./drawables/navArrow-left.png"
                smooth: true
                anchors {
                    right: parent.right
                    rightMargin: 20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridScenes.visible = false;
                    gridSensors.visible = true;
                }
            }
        }

        Image {
            id: navPageImage2
            width: 100
            height: 28
            source: "./drawables/page2.png"
            smooth: true
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 10
            }
        }

        Rectangle {
            width: 150
            height: 35
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "transparent" 
           
            Image {
                id: navRightButton2
                width: 18
                height: 28
                source: "./drawables/navArrow-right.png"
                smooth: true 
                anchors {
                    left: parent.left
                    leftMargin: 20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridScenes.visible = false;
                    gridSwitches.visible = true;
                }
            }
        }
    }


    //Switch settings textboxes
    Rectangle {
        id: gridSwitches
        anchors.top: grid1.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 650
        height: 250
        radius: 10
        color: "#e8e8e8"
        visible: false
        
        Text {
            id: page3Title
            x: 20
            y: 10
            width: 120
            text: "Schakelaars"
            font.pixelSize: 14
            font.family: qfont.semiBold.name
            color: "Black"
            wrapMode: Text.WordWrap
        }

        EditTextLabel4421 {
            id: homeAssistantSwitch1Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "1:"
            anchors {
                top: page3Title.bottom
                left: page3Title.left
                topMargin: 10
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in voor schakelaar 1", homeAssistantSwitch1Label.inputText, saveHomeAssistantSwitch1)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSwitch2Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "2:"
            anchors {
                top: homeAssistantSwitch1Label.bottom
                left: homeAssistantSwitch1Label.left
                topMargin: 6
            }
            
            onClicked: {
                qkeyboard.open("Voer het entity_id in voor schakelaar 2", homeAssistantSwitch2Label.inputText, saveHomeAssistantSwitch2)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSwitch3Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "3:"
            anchors {
                top: homeAssistantSwitch2Label.bottom
                left: homeAssistantSwitch2Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in voor schakelaar 3", homeAssistantSwitch3Label.inputText, saveHomeAssistantSwitch3)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSwitch4Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "4:"
            anchors {
                top: homeAssistantSwitch3Label.bottom
                left: homeAssistantSwitch3Label.left
                topMargin: 6
            }

            onClicked: {
                qkeyboard.open("Voer het entity_id in voor schakelaar 4", homeAssistantSwitch4Label.inputText, saveHomeAssistantSwitch4)
            }
        }

        EditTextLabel4421 {
            id: homeAssistantSwitch5Label
            width: 295
            height: 35
            leftTextAvailableWidth: 50
            leftText: "5:"
            anchors {
                top: homeAssistantSwitch1Label.top
                left: homeAssistantSwitch1Label.right
                leftMargin: 20
            }
            onClicked: {
                qkeyboard.open("Voer het entity_id in voor schakelaar 5", homeAssistantSwitch5Label.inputText, saveHomeAssistantSwitch5)
            }
        }

        Rectangle {
            width: 150
            height: 35
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            color: "transparent"

            Image {
                id: navLeftButton3
                width: 18
                height: 28
                source: "./drawables/navArrow-left.png"
                smooth: true
                anchors {
                    right: parent.right
                    rightMargin: 20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridSwitches.visible = false; 
                    gridScenes.visible = true;
                }
            }
        }

        Image {
                id: navPageImage3
                width: 100
                height: 28
                source: "./drawables/page3.png"
                smooth: true 
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 10
                }
        }

        Rectangle {
            width: 150
            height: 35
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "transparent" 

            Image {
                id: navRightButton3
                width: 18
                height: 28
                source: "./drawables/navArrow-right.png"
                smooth: true 
                anchors {
                    left: parent.left
                    leftMargin: 20
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridSwitches.visible = false;
                    gridSensors.visible = true;
                }
            }
        }
    }
}