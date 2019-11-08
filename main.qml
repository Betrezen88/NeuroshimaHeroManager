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
            Action { text: qsTr("Stwórz") }
            Action {
                text: qsTr("Zapisz")
                enabled: false
            }
            Action {
                text: qsTr("Wczytaj")
                enabled: false
            }
            MenuSeparator {}
            Action {
                text: qsTr("Rozwiń")
                enabled: false
            }
            MenuSeparator {}
            Action {
                text: qsTr("Zamknij postać")
                enabled: false
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
}
