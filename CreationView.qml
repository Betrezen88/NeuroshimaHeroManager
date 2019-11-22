import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: creationView
    anchors.fill: parent

    ScrollView {
        id: upperBar
        height: 50
        anchors {
            top: parent.top
            topMargin: 5
            left: parent.left
            right: parent.right
        }

        Row {
            spacing: 5

            Button { text: "Formularz" }
            Button { text: "Atrybuty" }
            Button { text: "Pochodzenie" }
            Button { text: "Profesja" }
            Button { text: "Choroba" }
            Button { text: "Specjalizacja" }
            Button { text: "Umiejętności" }
        }
    }

    ScrollView {
        id: container

        anchors {
            top: upperBar.bottom
            topMargin: 5
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Loader {
            id: loader
            anchors.fill: parent

            sourceComponent: Rectangle { color: "red"; anchors.fill: parent }
        }
    }
}
