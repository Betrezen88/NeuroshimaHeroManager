import QtQuick 2.0

Rectangle {
    property string modName
    property int modValue
    property int attributeValue
    property int minSize: 33

    id: valueBoxView
    radius: 10
    border.width: 1
    width: value.width > minSize ? value.width : minSize
    height: modLabel.height+value.height > minSize
            ? modLabel.height+value.height
            : minSize

    Text {
        id: modLabel
        text: qsTr(valueBoxView.modName)
        font.pointSize: 7
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
    }

    Text {
        id: value
        text: valueBoxView.attributeValue+valueBoxView.modValue > 0
              ? valueBoxView.attributeValue+valueBoxView.modValue
              : "N"
        font.pointSize: 10
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: modLabel.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
}


