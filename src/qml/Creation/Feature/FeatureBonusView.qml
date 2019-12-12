import QtQuick 2.0
import QtQuick.Controls 2.5
import neuroshima.data 1.0

Item {
    property FeatureBonus bonus

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
        }
    }

    Component.onCompleted: {
        selectedValue.model = bonus.get("list");
    }
}
