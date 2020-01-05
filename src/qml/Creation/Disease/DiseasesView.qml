import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

ScrollView {
    id: diseasesView
    clip: true

    Diseases {
        id: diseases
        Component.onCompleted: diseases.loadDiseases(":/json/Resources/json/Diseases.json");
    }

    Column {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5

        Flow{
            spacing: 5

            Text {
                text: "Choroba"
                height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            ComboBox {
                id: disease
                model: diseases.diseasesNames
                onCurrentIndexChanged: {
                    var tDisease = diseases.diseases[disease.currentIndex];
                    description.text = tDisease.description;
                    cure.text = tDisease.cure;
                    symptoms.symptoms = tDisease.symptoms;
                }
            }
        }

        Text {
            text: "Opis"
            horizontalAlignment: Text.AlignHCenter
            width: diseaseView.width - 10
            height: 20
            font {
                bold: true
                pixelSize: 12
            }
        }

        Text {
            id: description
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
            width: diseaseView.width - 10
        }

        Text {
            text: "Lekarstwo"
            horizontalAlignment: Text.AlignHCenter
            width: diseaseView.width - 10
            height: 20
            font {
                bold: true
                pixelSize: 12
            }
        }

        Text {
            id: cure
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
            width: diseaseView.width - 10
        }

        SymptomsView {
            id: symptoms
            width: diseaseView.width - 10
        }
    }
}
