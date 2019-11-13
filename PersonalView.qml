import QtQuick 2.0

Item {
    id: personalView
    width: portraitFrame.width

    Column {
        id: column
        width: 200
        height: 400
        spacing: 5

        Rectangle {
            id: portraitFrame
            width: 200
            height: 200
            color: "#ffffff"
            radius: 10
            border.width: 2

            Image {
                id: portrait
                x: 5
                y: 5
                anchors.margins: 5
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/qtquickplugin/images/template_image.png"
            }
        }

        Rectangle {
            id: label
            height: 40
            color: "#000000"
            radius: 10
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0

            Text {
                id: labelText
                color: "#fbfbfb"
                text: qsTr("POSTAĆ")
                font.bold: true
                anchors.fill: parent
                font.pointSize: 14
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        PersonalEntryBox {
            id: name
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Imię"
        }

        PersonalEntryBox {
            id: origin
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Pochodzenie"
        }

        PersonalEntryBox {
            id: profession
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Profesja"
        }

        PersonalEntryBox {
            id: specialization
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Specjalizacja"
        }

        PersonalEntryBox {
            id: illness
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Chorba"
        }

        PersonalEntryBox {
            id: originFeature
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            tooltip: "Cecha z pochodzenia daje dodatkową mechanikę."
            title: "Cecha z pochodzenia"
        }

        PersonalEntryBox {
            id: professionFeature
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Cecha z profesji"
        }

        PersonalEntryBox {
            id: reputation
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Reputacja"
        }

        PersonalEntryBox {
            id: fame
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            title: "Sława"
        }




















    }


}

/*##^##
Designer {
    D{i:3;anchors_height:100;anchors_width:100}D{i:2;anchors_height:100;anchors_width:100}
}
##^##*/
