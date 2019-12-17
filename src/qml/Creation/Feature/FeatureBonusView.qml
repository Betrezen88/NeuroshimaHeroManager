import QtQuick 2.0
import QtQuick.Controls 2.5
import neuroshima.data 1.0

Item {
    property FeatureBonus bonus
    property var bonusData

    signal sendBonusData(var bonusData)

    signal addBonus(var bonusData)
    signal removeBonus(var bonusData)

    id: featureBonusView
    height: 40

    Row {
        anchors.fill: parent
        spacing: 5
        Text {
            text: "Pakiet:"
            height: parent.height
            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: selectedValue
            height: parent.height
            onCurrentTextChanged: {
                featureBonusView.bonusData = {
                    type: bonus.get("type"),
                    selected: currentText,
                    value: bonus.get("value")
                };
                console.log("sending feature bonus data from FeatureBonuView on current text changed.")
                sendBonusData(bonusData);
            }
        }
    }

    onEnabledChanged: {
        if ( enabled ) {
            featureBonusView.bonusData = {
                type: bonus.get("type"),
                selected: selectedValue.currentText,
                value: bonus.get("value")
            };
            console.log("sending feature bonus data from FeatureBonuView on enabled changed.")
            sendBonusData(bonusData);
        }
    }

    onBonusChanged: {
        selectedValue.model = bonus.get("list");
    }
}
