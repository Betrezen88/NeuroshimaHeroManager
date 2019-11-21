import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Rectangle {
    id: main
    anchors.fill: parent

    ScrollView {
        id: buttons

        width: 100

        anchors.top: main.top
        anchors.bottom: main.bottom
        anchors.left: main.left

        ColumnLayout {
            Button { text: "Statystyki" }
            Button { text: "Ekwipunek" }
            Button { text: "Notatki" }
            Button { text: "Znajomi" }
            Button { text: "Samochód" }
            Button { text: "Bestia" }
        }
    }

    Loader {
        id: contentLoader

        anchors.top: main.top
        anchors.bottom: main.bottom
        anchors.left: buttons.right
        anchors.right: main.right

        source: "HeroStatsComponent.qml"
    }
}
