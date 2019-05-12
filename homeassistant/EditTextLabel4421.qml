import QtQuick 2.1
import BasicUIControls 1.0

Item {
	id: editTextLabel

	width: 430
	height: defaultHeight

	property int defaultHeight: 36

	property string leftText
	property string inputText
	property alias inputTextFormat: labelInput.textFormat
	property int leftTextAvailableWidth: 127
	property real leftTextImplicitWidth: labelTitle.implicitWidth + labelTitle.anchors.leftMargin
	property alias labelFontFamily: labelTitle.font.family
	property alias labelFontSize: labelTitle.font.pixelSize
	property string kpiPostfix: leftText ? leftText : "editTextLabel"

	signal clicked()

	StyledRectangle {
		anchors.fill: parent
		color: "#ffffff"
		radius: colors.labelRadius
		leftClickMargin: 10
		topClickMargin: 3
		bottomClickMargin: 3
		onClicked: editTextLabel.clicked()

		Rectangle {
			id: labelField
			color: "#F0F0F0"
			radius: colors.labelRadius
			anchors {
				fill: parent
				leftMargin: leftText == "" ? anchors.rightMargin : leftTextAvailableWidth + labelTitle.anchors.rightMargin
				topMargin: 5
				rightMargin: 5
				bottomMargin: 5
			}
			border {
				width: 1
				color: "#F0F0F0"
			}

			Text {
				id: labelInput
				anchors {
					left: parent.left
					right: parent.right
					leftMargin: 5
					rightMargin: anchors.leftMargin
					verticalCenter: parent.verticalCenter
				}
				font {
					family: qfont.regular.name
					pixelSize: qfont.bodyText
				}
				elide: Text.ElideRight
				text: inputText
				color: "#000000"
			}
		}

		Text {
			id: labelTitle
			anchors {
				verticalCenter: parent.verticalCenter
				left: parent.left
				leftMargin: 10
				right: labelField.left
				rightMargin: 10
			}
			font {
				family: qfont.semiBold.name
				pixelSize: qfont.titleText
			}
			elide: Text.ElideRight
			text: leftText
			color: "#000000"
		}
	}
}
