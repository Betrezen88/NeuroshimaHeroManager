import QtQuick 2.0

Rectangle {
    id: cardsViewerTab

    height: 50

    MouseArea {
        id: mouseArea
        anchors.right: closeBtn.left
        anchors {
            top: cardsViewerTab.top
            bottom: cardsViewerTab.bottom
            left: cardsViewerTab.left
        }

       Text {
            id: name
            text: "Hero Name"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
       }
    }

    Rectangle {
        id: closeBtn
        width: 40
        height: 40
        color: "#fc1515"
        radius: 20
        border.color: "#fc1515"
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        border.width: 1
        anchors.right: cardsViewerTab.right

        MouseArea {
            anchors.fill: parent

            Text {
                id: btnText
                text: "X"
                font.pointSize: 12
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
            }
        }
    }
}
