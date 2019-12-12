import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: creationAttributeUser

    signal attributeChanged(string name, int value)

    property int minAttributeValue: 6
    property int maxAttributeValue: 20

    Column {
        anchors.fill: parent
        spacing: 5

        Row {
            spacing: 5
            Text {
                text: "Budowa"
                width: 80; height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            SpinBox {
                id: strength
                from: creationAttributeUser.minAttributeValue
                to: creationAttributeUser.maxAttributeValue
                onValueChanged: creationAttributeUser.attributeChanged("Budowa", strength.value);
            }
        }

        Row {
            spacing: 5
            Text {
                text: "Zręczność"
                width: 80; height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            SpinBox {
                id: dexterity
                from: creationAttributeUser.minAttributeValue
                to: creationAttributeUser.maxAttributeValue
                onValueChanged: creationAttributeUser.attributeChanged("Zręczność", dexterity.value);
            }
        }

        Row {
            spacing: 5
            Text {
                text: "Charakter"
                width: 80; height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            SpinBox {
                id: character
                from: creationAttributeUser.minAttributeValue
                to: creationAttributeUser.maxAttributeValue
                onValueChanged: creationAttributeUser.attributeChanged("Charakter", character.value);
            }
        }

        Row {
            spacing: 5
            Text {
                text: "Spryt"
                width: 80; height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            SpinBox {
                id: intelligence
                from: creationAttributeUser.minAttributeValue
                to: creationAttributeUser.maxAttributeValue
                onValueChanged: creationAttributeUser.attributeChanged("Spryt", intelligence.value);
            }
        }

        Row {
            spacing: 5
            Text {
                text: "Percepcja"
                width: 80; height: 40
                verticalAlignment: Text.AlignVCenter
                font {
                    bold: true
                    pointSize: 10
                }
            }
            SpinBox {
                id: perception
                from: creationAttributeUser.minAttributeValue
                to: creationAttributeUser.maxAttributeValue
                onValueChanged: creationAttributeUser.attributeChanged("Percepcja", perception.value);
            }
        }
    }
}
