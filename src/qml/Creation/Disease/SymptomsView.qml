import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Item {
    property var symptoms
    property var objects: []

    id: symptomsView

    Text {
        id: label
        text: "Symptomy"
        horizontalAlignment: Text.AlignHCenter
        height: 20
        anchors {
            left: symptomsView.left
            right: symptomsView.right
        }
        font {
            bold: true
            pixelSize: 12
        }
    }

    Column {
        id: symptomsList
        anchors {
            top: label.bottom
            left: symptomsView.left
            right: symptomsView.right
        }
        spacing: 5
        onWidthChanged: {
            for (var i in objects) {
                objects[i].width = symptomsList.width;
            }
        }
    }

    onSymptomsChanged: {
        symptomsView.height = 0;
        if ( 0 < objects.length ) clear();
        for (var i in symptomsView.symptoms) {
            var compoent = Qt.createComponent("SymptomView.qml");
            var object = compoent.createObject(
                            symptomsList, {
                                symptom: symptomsView.symptoms[i],
                                width: symptomsList.width - 10
                        });
            objects.push(object);
            symptomsView.height += object.height+5;
        }
        symptomsView.height += label.height + 50;
    }

    function clear() {
        for (var i in objects)
            objects[i].destroy();
        objects = [];
    }
}
