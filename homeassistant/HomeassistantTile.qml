import QtQuick 2.1
//import qb.base 1.0
import qb.components 1.0

Tile {
	id: homeAssistantTile

	function init() {}

	onClicked: {
		if (app.homeAssistantScreen)
			app.homeAssistantScreen.show();
	}

	Text {
		id: txtTimeBig
		text: app.timeStr
		color: colors.clockTileColor
		anchors {
			left: parent.left
			leftMargin: 10
			baseline: parent.top
			baselineOffset: 54
		}
		font.pixelSize: dimState ? qfont.clockFaceText : qfont.timeAndTemperatureText - 4
		font.family: qfont.regular.name
		visible: app.clockTile ? true : false
	}

	Text {
		id: txtDate
		text: app.dateStr
		color: colors.clockTileColor
		anchors {
			left: txtTimeBig.left
			top: txtTimeBig.bottom
			topMargin: -10
		}
		horizontalAlignment: Text.AlignHCenter
		font.pixelSize: qfont.tileTitle - 2
		font.family: qfont.regular.name
		visible: app.clockTile ? !dimState : false
	}

	Image {
		id: homeAssistantIconSmall
		source: "./drawables/homeAssistantIconSmall.png"
		anchors {
			bottom: txtDate.bottom
			right: parent.right
			rightMargin: 10
		}
		cache: false
		visible: app.clockTile ? !dimState : false
	}

	Image {
		id: homeAssistantIconSmallCenter
		source: dimState ? "./drawables/homeAssistantIconSmallDim.png" : "./drawables/homeAssistantIconSmall.png"
		anchors {
			baseline: parent.top
			horizontalCenter: parent.horizontalCenter
			baselineOffset: 15
		}
		cache: false
		visible: app.clockTile ? false : true
	}

	Rectangle {
        id: tileGrid
        color: "transparent"
		width: parent.width - 20
		height: 60
		anchors {
			bottom: parent.bottom
			left: parent.left
			bottomMargin: 10
			leftMargin: 10
		}

		Text {
			id: lblSensor1
			text: app.homeAssistantSensor1 ? JSON.parse(app.homeAssistantSensor1Info)['attributes']['friendly_name'] : ""
			color: colors.clockTileColor
			height: 20
			width: tileGrid.width - 40
			anchors {
				left: parent.left
				top: parent.top
			}
			font.pixelSize: 12
			font.family: qfont.regular.name
			font.bold : true
		}

		Text {
			id: valueSensor1
			text: app.homeAssistantSensor1 ? (JSON.parse(app.homeAssistantSensor1Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor1Info)['state'] + " " + JSON.parse(app.homeAssistantSensor1Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor1Info)['state']) : ""
			color: colors.clockTileColor
			height: 20
			width: 40
			anchors {
				right: parent.right
				top: lblSensor1.top
				rightMargin: 0
			}
			font.pixelSize: 12
			font.family: qfont.regular.name
			font.bold : true
		}

		Text {
			id: lblSensor2
			text: app.homeAssistantSensor2 ? JSON.parse(app.homeAssistantSensor2Info)['attributes']['friendly_name'] : ""
			color: colors.clockTileColor
			height: 20
			width: tileGrid.width - 40
			anchors {
				left: parent.left
				top: lblSensor1.bottom
			}
			font.pixelSize: 12
			font.family: qfont.regular.name
			font.bold : true
		}

		Text {
			id: valueSensor2
			text: app.homeAssistantSensor2 ? (JSON.parse(app.homeAssistantSensor2Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor2Info)['state'] + " " + JSON.parse(app.homeAssistantSensor2Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor2Info)['state']) : ""
			color: colors.clockTileColor
			height: 20
			width: 40
			anchors {
				right: parent.right
				top: lblSensor2.top
			}
			font.pixelSize: 12
			font.family: qfont.regular.name
			font.bold : true
		}

		Text {
			id: lblSensor3
			text: app.homeAssistantSensor3 ? JSON.parse(app.homeAssistantSensor3Info)['attributes']['friendly_name'] : ""
			color: colors.clockTileColor
			height: 20
			width: tileGrid.width - 40
			anchors {
				left: parent.left
				top: lblSensor2.bottom
			}
			font.pixelSize: 12
			font.family: qfont.regular.name
			font.bold : true
		}

		Text {
			id: valueSensor3
			text: app.homeAssistantSensor3 ? (JSON.parse(app.homeAssistantSensor3Info)['attributes']['unit_of_measurement'] ? JSON.parse(app.homeAssistantSensor3Info)['state'] + " " + JSON.parse(app.homeAssistantSensor3Info)['attributes']['unit_of_measurement'] : JSON.parse(app.homeAssistantSensor3Info)['state']) : ""
			color: colors.clockTileColor
			height: 20
			width: 40
			anchors {
				right: parent.right
				top: lblSensor3.top
			}
			font.pixelSize: 12
			font.family: qfont.regular.name
			font.bold : true
		}
	}
}
