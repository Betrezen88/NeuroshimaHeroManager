import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

ScrollView {
    signal specializationChanged(var specialization)

    id: specializationView
    clip: true

    Specializations {
        id: specializations
        Component.onCompleted: specializations.loadSpecializations(":/json/Resources/json/Specializations.json");
    }

    Column {
        spacing: 5
        anchors.fill: parent
        anchors.margins: 5

        Row {
            spacing: 5
            anchors {
                left: parent.left
                right: parent.right
            }

            Text {
                text: "Specjalizacja"
                height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }

            ComboBox {
                id: specialization
                height: 40
                width: 200
                model: specializations.specializationsNames
                onCurrentIndexChanged: {
                    var tSpecialization = specializations.specializations[currentIndex];
                    description.text = tSpecialization.description;
                    specializationChanged(tSpecialization);
                }
            }
        }

        Text {
            id: description
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
            width: specializationView.width - 10
        }

        Text {
            text: "Na zakupienie Umiejętności związanych z daną specjalizacją masz dodatkowe 30 punktów. Każdy pakiet umiejętności podsiada informację do której specjalizacji należą. Dodatkowo rozwój umiejętności za punkty doświadczenia jest o 20% tańszy."
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
            width: specializationView.width - 10
        }
    }
}
