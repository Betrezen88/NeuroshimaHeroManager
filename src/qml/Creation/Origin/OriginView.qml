import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

import "../Feature"

ScrollView {
    id: creationOriginView

    clip: true

    Origins {
        id: origins
        Component.onCompleted: origins.loadOrigins(":/json/Resources/json/Origins.json");
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
                text: "Pochodzenie"
                height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            ComboBox {
                id: origin
                height: 40
                width: 200
                model: origins.originsNames
                onCurrentIndexChanged: {
                    var tOrigin = origins.origins[origin.currentIndex];
                    originDescription.text = tOrigin.description;
                    originImage.source = "qrc:/Resources/Images/origins/"+tOrigin.image;
                    attributeBonus.bonus = tOrigin.bonus;
                    featuresView.features = tOrigin.features;
                }
            }
            AttributeBonusView {
                id: attributeBonus
                height: 40
            }
        }

        Text {
            id: originDescription
            width: creationOriginView.width - 10
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignJustify
        }

        Row {
            anchors.topMargin: 10
            spacing: 5
            width: parent.width
            onWidthChanged: {
                featuresView.width = parent.width - 10 - originImage.width;
            }

            FeaturesView {
                id: featuresView
                width: parent.width - 10 - originImage.width
            }
            Image {
                id: originImage
                width: creationOriginView.width * 0.4
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
