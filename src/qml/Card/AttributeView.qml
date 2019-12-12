import QtQuick 2.0

Item {
    property string name
    property int value
    property int mod
    property variant skillpacks

    id: attributeView

    height: 400

    Column {
        id: values
        spacing: 5

        anchors {
            top: attributeView.top
            bottom: attributeView.bottom
            left: attributeView.left
        }
    }

    Rectangle {
        id: header

        height: 40

        color: "#000"
        radius: 10

        anchors {
            top: attributeView.top
            right: attributeView.right
            left: values.right
            leftMargin: 5
        }

        Text {
            id: attributeName
            text: attributeView.name
            font.pointSize: 15
            color: "#fff"
            anchors.fill: header
            anchors {
                topMargin: 5
                bottomMargin: 5
                leftMargin: 10
                rightMargin: 5
            }
        }
    }

    Column {
        id: skillpacksView
        spacing: 5

        anchors {
            top: header.bottom
            bottom: attributeView.bottom
            right: attributeView.right
            left: values.right
            topMargin: 5
            bottomMargin: 5
            leftMargin: 5
        }
    }

    Component.onCompleted: {
        addValues(value, mod);
        addSkillpacks();

    }

    function addValues(value, mod) {
        var mods = [ {name: "Łat.", mod: 2},
                     {name: "Prz.", mod: 0},
                     {name: "Pro.", mod: -2},
                     {name: "Tru.", mod: -5},
                     {name: "B.Tr.", mod: -8},
                     {name: "Ch.T.", mod: -11},
                     {name: "Fuks.", mod: -15}
                ];
        for ( var i in mods ) {
            var component = Qt.createComponent("ValueBoxView.qml");
            var valueBoxView = component.createObject(values,
                                                      { modName: mods[i].name,
                                                        modValue: mods[i].mod,
                                                        attributeValue: value+mod
                                                      });
            width = valueBoxView.width;
        }
    }

    function addSkillpacks() {
        var height = 0;
        var width = 0;
        for ( var i in attributeView.skillpacks ) {
            var component = Qt.createComponent("SkillpackView.qml");
            var skillpackView = component.createObject(
                        skillpacksView,
                        {
                            name: attributeView.skillpacks[i].name,
                            skills: attributeView.skillpacks[i].skills,
                            specializations: attributeView.skillpacks[i].specializations
                        }
            );
            height += skillpackView.height + 5;
            width = skillpackView.width;
        }
        attributeView.height = height + header.height;
        attributeView.width += width;
    }
}
