import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

Item {
    property var symptom

    id: symptomView
    height: description.height + penalty.height + 10

    Column {
        anchors.fill: parent
        spacing: 5

        Text {
            id: description
            width: symptomView.width
            wrapMode: Text.WordWrap
            font.pixelSize: 12
        }

        Text {
            id: penalty
            width: symptomView.width
            wrapMode: Text.WordWrap
            font.pixelSize: 12
            visible: 0 < symptom.penalties.length
        }
    }

    onSymptomChanged: {
        description.text = "<b>"+symptom.name+" -</b> " + symptom.description;
        if ( 0 < symptom.penalties.length ) {
            penalty.text = "<b>Kary:</b> ";
            for ( var i in symptom.penalties ) {
                var tPenalty = symptom.penalties[i];
                penalty.text += tPenalty.name + " ";
                if ( "Attribute" === tPenalty.type )
                    penalty.text += tPenalty.value;
                else
                    penalty.text += tPenalty.value+"%";
                if ( i !== symptom.penalties.length-1 )
                    penalty.text += ",";
            }
        }
    }
}
