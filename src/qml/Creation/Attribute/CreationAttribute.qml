import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property Component userValues: Component {
        CreationAttributeUser {
            id: creationUserValues
            anchors.fill: loader
        }
    }

    id: creationAttribute

    Row {
        id: typeRow
        spacing: 5
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 5
        }

        Text{
            text: "Typ przydzielania:"
            height: 40
            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: type
            height: 40
            width: 200
            model: [ "Wartości użytkownika", "Wartości losowe" ]
        }
    }

    Loader {
        id: loader
        anchors {
            top: typeRow.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: 5
        }
        sourceComponent: creationAttribute.userValues
    }
}
