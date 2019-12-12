import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Rectangle {
    property var feature
    property bool checked: featureName.checked
    property ButtonGroup group

    signal chosed(string text);
    signal unchosed(string text);

    id: featureView
    height: featureName.height + featureDescription.height

    Column {
        id: column
        spacing: 5
        anchors.fill: parent

        RadioButton {
            id: featureName
            text: feature.name
            font { bold: true; pointSize: 8 }
            checked: featureView.checked
            ButtonGroup.group: featureView.group
            onCheckedChanged: {
                if ( checked )
                    chosed(featureName.text);
                else
                    unchosed(featureName.text);
            }
        }

        Text {
            id: featureDescription
            text: feature.description
            width: featureView.width
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
        }
    }

    Component.onCompleted: {
        if ( feature.bonus.get("type") !== "text" ) {
            var component = Qt.createComponent("FeatureBonusView.qml");
            var bonus = component.createObject(column, {
                                                   bonus: feature.bonus,
                                                   width: parent.width
                                               });
            featureView.height += bonus.height;
        }
    }
}
