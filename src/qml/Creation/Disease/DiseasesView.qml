import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

ScrollView {
    property var objects: []

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

        GroupBox {
            label: Button{
                id: diseaseBtn
                text: "Losuj chorobę"
                onClicked: diseaseThrow();
            }

            anchors {
                left: parent.left
                right: parent.right
            }

            Column {
                id: diseasesList
                anchors.fill: parent
                spacing: 5
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

    function dice() {
        return Math.floor(Math.random() * (diseases.diseases.length));
    }

    function diseaseThrow() {
        if ( 0 < objects.length ) clear();

        var results = [];
        while ( results.length < 3 ) {
            var value = dice();
            if ( !results.includes(value) ) results.push(value);
        }
        for (var i in results) {
            var tDisease = diseases.diseases[results[i]];
            var component = Qt.createComponent("DiseaseSelector.qml");
            var radioButton = component.createObject(
                            diseasesList, {
                            disease: tDisease
                        });
            radioButton.onChange.connect(setDisease);
            radioButton.checked = (0 === parseInt(i));
            objects.push(radioButton);
        }
    }

    function clear() {
        for (var i in objects)
            objects[i].destroy();
        objects = [];
    }

    function setDisease(disease) {
        description.text = disease.description;
        cure.text = disease.cure;
        symptoms.symptoms = disease.symptoms;
    }
}
