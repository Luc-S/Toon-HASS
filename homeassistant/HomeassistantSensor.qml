Rectangle {
        id: switchRect
        width: 250
        color: "transparent"
        anchors {
            top: switchTitle.bottom
            left: switchTitle.left
            topMargin: 0
        }

        Text {
            id: homeAssistantSwitch
            width: 200
            font.pixelSize: 12
            color: "Black" 
            wrapMode: Text.WordWrap
            anchors {
                top: parent.top
                topMargin: 13
            }
        }

        Image {
            id: homeAssistantSwitchButton
            width: 50
            height: 36
            smooth: true
            anchors {
                right: switchRect.right
                verticalCenter: switchRect1.verticalCenter
            }

            MouseArea {
				id: homeAssistantSwitchMouseArea
                anchors.fill: parent
            }
        }
    }