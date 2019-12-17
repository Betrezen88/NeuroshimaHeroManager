import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Rectangle {
    property var feature
    property bool checked: featureName.checked
    property FeatureBonusView featureBonus
    property ButtonGroup group

    signal sendFeature(var featureData)

    id: featureView
    height: featureName.height + featureDescription.height

    Column {
        id: column
        spacing: 5
        anchors.fill: parent

        RadioButton {
            id: featureName
            font { bold: true; pointSize: 8 }
            checked: featureView.checked
            ButtonGroup.group: featureView.group
            onCheckedChanged: {
                if ( checked && feature.bonus.get("type") === "text" ) {
                    var featureData = {
                        type: feature.bonus.get("type")
                    };
                    console.log("sending feature data from FeatureView.");
                    sendFeature(featureData);
                }

                if ( featureBonus !== null )
                    featureBonus.enabled = featureName.checked;
            }
        }

        Text {
            id: featureDescription
            width: featureView.width
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
        }
    }

    onFeatureChanged: {
        featureName.text = feature.name;
        featureDescription.text = feature.description;
        if ( feature.bonus.get("type") !== "text" ) {
            var component = Qt.createComponent("FeatureBonusView.qml");
            featureBonus = component.createObject(column, {
                                                   width: parent.width,
                                                   enabled: featureView.checked
                                               });
            featureBonus.sendBonusData.connect(sendFeature);
            featureBonus.bonus = feature.bonus;
            featureView.height += featureBonus.height + 40;
        }
    }
}
