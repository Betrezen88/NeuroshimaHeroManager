import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

import "../Feature"

ScrollView {
    signal sendProfessionFeature(var featureData)

    id: professionView
    clip: true

    Professions {
        id: professions
        Component.onCompleted: professions.loadProfessions(":/json/Resources/json/Professions.json");
    }

    Column {
        spacing: 5
        anchors.fill: parent
        anchors.margins: 5

        Flow {
            spacing: 5
            anchors {
                left: parent.left
                right: parent.right
            }

            Text {
                text: "Profesja"
                height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            ComboBox {
                id: profession
                height: 40
                width: 200
                model: professions.professionsNames
                onCurrentIndexChanged: {
                    var tProfession = professions.professions[profession.currentIndex];
                    description.text = tProfession.description;
                    quote.text = tProfession.quote;
                    picture.source = "qrc:/Resources/Images/professions/"+tProfession.image;
                    featuresView.features = tProfession.features;
                }
            }
        }

        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
            }
            color: "#cac6c6"
            radius: 5
            border.width: 2
            height: 40

            Text {
                id: quote
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                font {
                    italic: true
                    pointSize: 8
                }
            }
        }

        Text {
            id: description
            width: professionView.width - 10
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
        }

        Row {
            spacing: 5
            anchors.topMargin: 10
            width: parent.width

            FeaturesView {
                id: featuresView
                width: parent.width - 10 - picture.width
            }

            Image {
                id: picture
                fillMode: Image.PreserveAspectFit
                width: professionView.width * 0.4
            }
        }
    }
}
