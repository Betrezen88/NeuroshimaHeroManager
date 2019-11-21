import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: testView

    ScrollView {
        id: sideScroll
        width: 47
        height: parent.height
        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        Column {
            spacing: 100
            anchors.fill: parent

            Rectangle {
                color: "red"
                width: 40
                height: 100
            }

            Rectangle {
                color: "red"
                width: 40
                height: 100
            }

            Rectangle {
                color: "red"
                width: 40
                height: 100
            }
        }
    }

    ScrollView {
        id: content
        width: parent.width - sideScroll.width
        height: parent.height
        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        anchors {
            top: parent.top
//            bottom: parent.bottom
            left: sideScroll.right
//            right: parent.right
        }

        Column {
            anchors.fill: parent

            Rectangle {
                color: "blue"
                width: 500
                height: 500
            }
        }

        Component.onCompleted: console.log( content.height )
    }
}
