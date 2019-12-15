import QtQuick 2.0
import QtQuick.Controls 2.5
import neuroshima.data 1.0

Item {
    property FeatureBonus bonus
    property var bonusData

    signal bonusDataChanged(var bonusData)

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
                console.log("FeatureBonusView.selectedValue.onCurrentTextChanged()");
                featureBonusView.bonusData = {
                    type: bonus.get("type"),
                    selected: currentText,
                    value: bonus.get("value")
                };
//                bonusDataChanged(bonusData);
            }
        }
    }

    onBonusChanged: {
        selectedValue.model = bonus.get("list");
    }
}
