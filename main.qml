import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow
{
    id: mainApp
    visible: true
    width: 640
    height: 480
    title: qsTr("Neuroshima Hero Manager")

    menuBar: MenuBar {
        id: menuBar

        Menu {
            title: qsTr("Postać")
            Action {
                text: qsTr("Stwórz")
                onTriggered: {
                    cardView.visible = true;
                }
            }
            Action {
                text: qsTr("Zapisz")
                enabled: cardView.visible
            }
            Action {
                text: qsTr("Wczytaj")
            }
            MenuSeparator {}
            Action {
                text: qsTr("Rozwiń")
                enabled: cardView.visible
            }
            MenuSeparator {}
            Action {
                text: qsTr("Zamknij postać")
                enabled: cardView.visible
            }
            Action {
                text: qsTr("Zamknij")
                onTriggered: mainApp.close()
            }
        }

        Menu {
            title: "Pomoc"
            Action { text: qsTr("O programie") }
        }
    }

    CardView {
        id: cardView
        anchors.fill: parent
        visible: false
    }
}
