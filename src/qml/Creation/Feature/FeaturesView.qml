import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Item {
    property var features: []
    property var objects: []

    signal sendFeature(var featureData)

    id: featuresView

    Column {
        id: featuresList
        spacing: 10
        anchors.fill: parent

        ButtonGroup { id: featuresGroup }

        Text {
            id: label
            text: "Cechy (wybierz jedną z nich):"
            font {
                bold: true
                pointSize: 10
            }
        }
    }

    onFeaturesChanged: {
        featuresView.height = label.height + 50;
        if ( 0 < objects.length )
            clear();
        for (var i in features) {
            var object = createFeature(features[i], parseInt(i)===0);
            object.checked = parseInt(i) === 0;
            objects.push( object );
        }
    }

    onWidthChanged: {
        featuresView.height = label.height + 50;
        for (var i in objects) {
            objects[i].width = featuresView.width;
            featuresView.height += objects[i].height;
        }
    }

    function createFeature(feature, checked) {
        var component = Qt.createComponent("FeatureView.qml");
        var object = component.createObject(
                    featuresList, {
                        width: featuresList.width,
                        group: featuresGroup
                    });
        object.sendFeature.connect(sendFeature);
        object.feature = feature;
        featuresView.height += object.height + 10
        return object;
    }

    function clear() {
        for (var i in objects)
            objects[i].destroy();
        objects = [];
    }
}
