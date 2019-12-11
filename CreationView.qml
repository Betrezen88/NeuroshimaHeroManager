﻿import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Item {
    property Component form: Component {
        CreationForm {
            id: creationForm
            anchors.fill: loader
        }
    }
    property Component attributes: Component {
        CreationAttribute{
            id: creationAttribute
            anchors.fill: loader
        }
    }
    property Component origin: Component {
        CreationOriginView{
            id: creationOrigin
            anchors.fill: loader
        }
    }

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

            Button {
                text: "Formularz"
                onClicked: loader.sourceComponent = creationView.form
            }
            Button {
                text: "Atrybuty"
                onClicked: loader.sourceComponent = creationView.attributes
            }
            Button {
                text: "Pochodzenie"
                onClicked: loader.sourceComponent = creationView.origin
            }
            Button { text: "Profesja" }
            Button { text: "Choroba" }
            Button { text: "Specjalizacja" }
            Button { text: "Umiejętności" }
        }
    }

    Loader {
        id: loader
        anchors {
            top: upperBar.bottom
            topMargin: 5
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        sourceComponent: creationView.form
    }
}
