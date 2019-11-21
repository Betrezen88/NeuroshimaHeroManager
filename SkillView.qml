import QtQuick 2.0

Item {
    property string name
    property int value

    id: skillView
    height: 20
    anchors {
        left: parent.left
        right: parent.right
    }

    Text {
        id: skillName
        text: skillView.name
        font.pointSize: 10
        font.family: "Verdana"
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: skillView.top
            bottom: skillView.bottom
            left: skillView.left
            leftMargin: 10
        }
    }

    Text {
        id: skillValue
        text: skillView.value
        font.pointSize: 10
        font.family: "Verdana"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: skillView.top
            bottom: skillView.bottom
            left: skillName.right
            leftMargin: 5
            right: skillView.right
            rightMargin: 15
        }
    }
}
