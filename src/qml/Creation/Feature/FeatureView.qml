import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Rectangle {
    property var feature
    property bool checked: featureName.checked
    property FeatureBonusView featureBonus
    property ButtonGroup group

    signal featureDataChanged(var featureData)

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
                var typeIsText = feature.bonus.get("type") === "text";
                if ( typeIsText ) {
                    var featureData = {
                        type: feature.bonus.get("type")
                    };
                    console.log( "Sending feature "+featureName.text );
                    featureDataChanged(featureData);
                }

                if ( featureBonus !== null )
                    featureBonus.enabled = featureName.checked;
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

    onFeatureChanged: {
        if ( feature.bonus.get("type") !== "text" ) {
            var component = Qt.createComponent("FeatureBonusView.qml");
            featureBonus = component.createObject(column, {
                                                   width: parent.width,
                                                   enabled: featureView.checked
                                               });
            featureBonus.bonusDataChanged.connect(featureDataChanged);
            featureBonus.bonus = feature.bonus;
            featureView.height += featureBonus.height + 40;
        }
    }
}
