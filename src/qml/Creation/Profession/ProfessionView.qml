import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

import "../Feature"

ScrollView {
    signal sendProfessionFeature(var featureData)

    id: professionView
    clip: true

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
                model: ["Chemik"]
            }
        }

        Text {
            id: quote
            text: "quote"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors {
                left: parent.left
                right: parent.right
            }
            font {
                italic: true
                pointSize: 8
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
            }

            Image {
                id: picture
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
