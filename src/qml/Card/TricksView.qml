import QtQuick 2.12

Rectangle {
    id: tricksView
    height: 300
    radius: 10
    border.width: 2

    Rectangle {
        id: label
        height: 40
        color: "#000000"
        radius: 10
        anchors {
            left: parent.left
            right: parent.right
        }

        Text {
            id: labelText
            color: "#fbfbfb"
            text: qsTr("Sztuczki")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.bold: true
            font.family: "Verdana"
            font.pointSize: 14
        }
    }

    ListView {
        id: tricksList
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: label.bottom
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

/*##^##
Designer {
    D{i:3;anchors_height:160;anchors_width:110;anchors_x:0;anchors_y:0}
}
##^##*/
