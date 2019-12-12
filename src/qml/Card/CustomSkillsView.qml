import QtQuick 2.0

Rectangle {
    id: customSkillsView
    radius: 10
    border.width: 2

    Rectangle {
        id: labelBackground
        height: 40
        color: "#000"
        radius: 10
        anchors {
            left: parent.left
            right: parent.right
        }

        Text {
            id: labelText
            text: qsTr("Inne Umiejętności")
            color: "#fbfbfb"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.bold: true
            font.family: "Verdana"
            font.pointSize: 14
        }
    }

    ListView {
        id: skillsList
        height: 200
        anchors {
            top: labelBackground.bottom
            topMargin: 5
            right: parent.right
            left: parent.left
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                spacing: 10
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
