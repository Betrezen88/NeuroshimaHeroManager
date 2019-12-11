import QtQuick 2.0

import neuroshima.data 1.0

Item {
    property AttributeBonus bonus

    id: attributeBonusView
    width: attributeName.width + attributeValue.width

    Row {
        spacing: 5
        anchors.fill: parent

        Text {
            id: attributeValue
            height: attributeBonusView.height
            text: "+"+attributeBonusView.bonus.value
            font { bold: true; pointSize: 10 }
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: attributeName
            height: attributeBonusView.height
            text: attributeBonusView.bonus.name
            font { bold: true; pointSize: 10 }
            verticalAlignment: Text.AlignVCenter
        }
    }
}
