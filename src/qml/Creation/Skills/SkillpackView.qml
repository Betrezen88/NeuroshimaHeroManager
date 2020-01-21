import QtQuick 2.0

import neuroshima.data 1.0

Rectangle {
    property var skillpack

    id: skillpackView

    height: name.height + 10

    color: "#fff"

    border {
        width: 2
        color: "#000"
    }

    Text {
        id: name
        text: skillpack.name
        height: 20
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Column {
        id: skillsList
        anchors {
            topMargin: 5
            top: name.top
            left: parent.left
            right: parent.right
        }
        spacing: 5
    }
}
