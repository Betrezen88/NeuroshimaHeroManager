import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

TabView {
    id: heroCardContainer

    style: TabViewStyle {
        property color frameColor: "#999"
        property color fillColor: "#eee"
        frameOverlap: 1

        frame: Rectangle {
            color: fillColor
            border.color: frameColor
        }

        tab: Rectangle {
            color: styleData.selected ? fillColor : frameColor
            implicitWidth: Math.max(tabTitle.width + 10 + tabCloseBtn.width + 5, 150)
            implicitHeight: 50

            // Tab title frames
            Rectangle { height: 1 ; width: parent.width ; color: frameColor}
            Rectangle { height: parent.height ; width: 1; color: frameColor}
            Rectangle { x: parent.width -1; height: parent.height ; width: 1; color: frameColor}

            // Tab title
            Text {
                id: tabTitle
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                text: styleData.title
                color: styleData.selected ? "black" : "white"
                font.pointSize: 10
            }

            Button {
                id: tabCloseBtn
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 4
                height: 30
                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 30
                        implicitHeight: 30
                        radius: width/2
                        color: control.hovered ? "#a9a9a9": "#d80e0e"
                        border.color: "#000"
                        Text {text: "X" ; anchors.centerIn: parent ; color: "#fff"}
                    }
                }
                onClicked: heroCardContainer.removeTab(styleData.index)
            }
        }
    }
}
