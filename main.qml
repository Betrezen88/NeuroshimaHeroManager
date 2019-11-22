import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow
{
    property CardView cardView

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
                    var component = Qt.createComponent("CardView.qml");
                    mainApp.cardView = component.createObject(container, { width: container.width, height: container.height });
                }
            }
            Action {
                text: qsTr("Zapisz")
                enabled: cardView != null
            }
            Action {
                text: qsTr("Wczytaj")
            }
            MenuSeparator {}
            Action {
                text: qsTr("Rozwiń")
                enabled: cardView != null
            }
            MenuSeparator {}
            Action {
                text: qsTr("Zamknij postać")
                enabled: cardView != null
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

    Item {
        id: container
        anchors.fill: parent
    }

//    CardView {
//        id: cardView
//        anchors.fill: parent
//        visible: false
//    }
}
