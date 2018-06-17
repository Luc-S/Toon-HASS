import QtQuick 1.1
//import qb.base 1.0
import qb.components 1.0

Tile {
	id: homeAssistantTile

	function init() {}

	onClicked: {
		if (app.homeAssistantScreen)
			app.homeAssistantScreen.show();
	}

	Image {
		id: homeAssistantIconSmall
		source: "./drawables/homeAssistantIconSmall.png"
		anchors {
			baseline: parent.top
			baselineOffset: 64
			horizontalCenter: parent.horizontalCenter
		}
		cache: false
	}

	Text {
		id: txtHomeAssistantBig
		text: "Home Assistant"
		anchors {
			baseline: parent.top
			baselineOffset: 36
			horizontalCenter: parent.horizontalCenter
		}
		font {
			family: qfont.bold.name
			pixelSize: 20
		}
		color: colors.waTileTextColor
       		visible: !dimState
	}

}
