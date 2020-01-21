import QtQuick 2.0

import neuroshima.data 1.0

Rectangle {
    property var difficulty
    property int attributeValue

    id: attributeValueView

    radius: 5
    border.color: "#000"
    border.width: 2

    height: name.height + value.height
    width: height - 5

    Text {
        id: name
        height: 10
        text: difficulty.shortName
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 8
        anchors {
            margins: 2
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Text {
        id: value
        text: attributeValue - difficulty.value
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        height: 30
        font {
            bold: true
            pointSize: 10
        }
        anchors {
            top: name.bottom
            left: parent.left
            right: parent.right
        }
    }
}
