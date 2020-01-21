import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import neuroshima.data 1.0

import "../Attribute"

ScrollView {
    id: skillView
    clip: true

    Difficulties { id: difficulties }

    Attributes {
        id: attributes
        Component.onCompleted: {
            difficulties.loadDifficulties(":/json/Resources/json/Difficulties.json");
            attributes.loadAttributes(":/json/Resources/json/Attributes.json");

            for (var i in attributes.attributes) {
                var attribute = attributes.attributes[i];
                var component = Qt.createComponent("../Attribute/AttributeView.qml");
                var attributeView = component.createObject(column(parseInt(i)), {
                                        difficulties: difficulties.difficulties,
                                        attribute: attribute
                                    });
                for (var j in attribute.skillpacks) {
                    component = Qt.createComponent("SkillpackView.qml");
                    var skillpackView = component.createObject(
                                column(parseInt(i)),{
                                   skillpack: attribute.skillpacks[j],
                                   width: attributeView.width
                               });
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5

        Column {
            id: first
            objectName: "first"
            spacing: 5
        }
        Column {
            id: second
            objectName: "second"
            spacing: 5
        }
        Column {
            id: third
            objectName: "third"
            spacing: 5
        }
    }

    function column(i) {
        if ( i <= 1 )
            return first;
        else if ( i <= 3 )
            return second;
        else
            return third;
    }
}
