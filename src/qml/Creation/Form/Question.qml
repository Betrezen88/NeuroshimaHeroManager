import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property alias question: question.text
    property alias description: description.text
    property alias answer: answer.text

    id: creationFormQuestion

    height: question.height + description.height + 60 + 4

    Column {
        spacing: 2
        anchors.fill: parent

        Text {
            id: question
            width: parent.width
            wrapMode: Text.WordWrap
            font {
                bold: true
                pointSize: 8
            }
        }

        Text {
            id: description
            width: parent.width
            wrapMode: Text.WordWrap
            font {
                italic: true
                pointSize: 8
            }
        }

        ScrollView {
            width: parent.width
            height: 60

            TextArea {
                id: answer
                width: parent.width
                height: parent.height
                wrapMode: TextArea.WordWrap
                background: Rectangle {
                        border.color: "#000"
                        radius: 10
                        anchors.fill: parent
                    }
            }
        }
    }
}
