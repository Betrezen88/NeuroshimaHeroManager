import QtQuick 2.12
import QtQuick.Controls 2.3

Item {
    id: heroCard
    ScrollView {
        id: buttons
        width: 40
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        Column {
            width: 40
            anchors.rightMargin: 60
            anchors.fill: parent
            spacing: 65

            Button {
                id: stats
                text: qsTr("Statystyki")
                transformOrigin: Item.BottomLeft
                rotation: 90
            }

            Button {
                id: inventory
                text: qsTr("Ekwipunek")
                rotation: 90
                transformOrigin: Item.BottomLeft
            }

            Button {
                id: notes
                text: qsTr("Notatki")
                rotation: 90
                transformOrigin: Item.BottomLeft
            }

            Button {
                id: friends
                text: qsTr("Znajomości")
                rotation: 90
                transformOrigin: Item.BottomLeft
            }

            Button {
                id: vehicles
                text: qsTr("Pojazd")
                rotation: 90
                transformOrigin: Item.BottomLeft
            }

            Button {
                id: beasts
                text: qsTr("Bestia")
                rotation: 90
                transformOrigin: Item.BottomLeft
            }

            Rectangle {
                width: 40
                height: 100
                opacity: 0
            }
        }
    }

    Loader {
        id: pageLoader
        x: 40
        anchors {
            top: heroCard.top
            bottom: heroCard.bottom
            left: buttons.right
            right: heroCard.right
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
