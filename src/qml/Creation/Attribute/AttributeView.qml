import QtQuick 2.0

import neuroshima.data 1.0

Item {
    property var attribute
    property var difficulties: []

    id: attributeView

    Rectangle {
        id: label
        height: 30
        color: "#000"
        radius: 5
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        Text {
            id: name
            color: "#fff"
            text: attribute.name
            anchors.centerIn: parent
            font {
                bold: true
                pointSize: 12
            }
        }
    }

    Row {
        id: values
        spacing: 2
        anchors {
            topMargin: 5
            top: label.bottom
            left: parent.left
            right: parent.right
        }
    }

    onAttributeChanged: {
        attributeView.width = 0;
        for (var i in difficulties) {
            var tDifficulty = difficulties[i];
            var component = Qt.createComponent("AttributeValueView.qml");
            var valueView = component.createObject(
                        values,{
                           difficulty: tDifficulty,
                           attributeValue: attribute.value
                        });
            attributeView.width += valueView.width + values.spacing
            values.height = valueView.height;
        }
        attributeView.height = label.height + values.height;
    }
}
