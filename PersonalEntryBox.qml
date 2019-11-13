import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
    id: personalBox
    property string title
    property string value
    property string tooltip

    height: 60
    radius: 10
    border.width: 2

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        Text {
            id: value
            text: "<b>"+personalBox.title +": </b>"+ personalBox.value
            font.family: "Verdana"
            wrapMode: Text.WordWrap
            elide: Text.ElideNone
            font.pointSize: 10
            anchors.fill: parent
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignLeft
            anchors.margins: 5
        }

        ToolTip {
            id: boxTooltip
            parent: mouseArea
            timeout: 100 * 60 * 10
            text: personalBox.tooltip
        }

        onClicked: {
            if ( personalBox.tooltip !== "" ) {
                if ( !boxTooltip.visible )
                    boxTooltip.show(boxTooltip.text);
                else
                    boxTooltip.hide();
            }
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:100;anchors_width:100}
}
##^##*/
