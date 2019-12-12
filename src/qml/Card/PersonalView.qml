import QtQuick 2.0

Item {
    id: personalView
    width: portraitFrame.width
    height: portraitFrame.height + label.height
            + name.height + origin.height
            + profession.height + specialization.height
            + illness.height + originFeature.height
            + professionFeature.height + reputation.height
            + fame.height + 50

    Rectangle {
        id: portraitFrame
        width: 250
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
            source: "qrc:/Resources/Images/Hero_portrait.png"
        }
    }

    Rectangle {
        id: label
        x: 0
        y: 205
        height: 40
        color: "#000000"
        radius: 10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0

        Text {
            id: labelText
            x: 0
            y: 205
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
        x: 0
        y: 250
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Imię"
    }

    PersonalEntryBox {
        id: origin
        x: 0
        y: 315
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Pochodzenie"
    }

    PersonalEntryBox {
        id: profession
        x: 0
        y: 380
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Profesja"
    }

    PersonalEntryBox {
        id: specialization
        x: 0
        y: 445
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Specjalizacja"
    }

    PersonalEntryBox {
        id: illness
        x: 0
        y: 510
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Chorba"
    }

    PersonalEntryBox {
        id: originFeature
        x: 0
        y: 575
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        tooltip: "Cecha z pochodzenia daje dodatkową mechanikę."
        title: "Cecha z pochodzenia"
    }

    PersonalEntryBox {
        id: professionFeature
        x: 0
        y: 640
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Cecha z profesji"
    }

    PersonalEntryBox {
        id: reputation
        x: 0
        y: 705
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Reputacja"
    }

    PersonalEntryBox {
        id: fame
        x: 0
        y: 770
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        title: "Sława"
    }
}

/*##^##
Designer {
    D{i:2;anchors_height:100;anchors_width:100}D{i:1;anchors_height:100;anchors_width:100}
}
##^##*/
