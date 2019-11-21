import QtQuick 2.0

Rectangle {
    property string name
    property variant specializations
    property variant skills

    id: skillpackView

    width: 250
    radius: 20
    border.width: 2

    Text {
        id: skillpackName
        text: skillpackView.name + " " + specs()
        verticalAlignment: Text.AlignVCenter
        height: 30
        anchors {
            top: parent.top
            topMargin: 5
            left: parent.left
            leftMargin: 20
            right: parent.right
        }
        font.bold: true
        font.pointSize: 10
        font.family: "Verdana"
        horizontalAlignment: Text.AlignLeft
    }

    Column {
        id: skillsView
        spacing: 5
        anchors {
            top: skillpackName.bottom
            bottom: skillpackView.bottom
            left: skillpackView.left
            right: skillpackView.right
        }
    }

    Component.onCompleted: {
        addSkills();
        skillpackView.height += skillpackName.height + 5
    }

    function addSkills() {
        for ( var i in skillpackView.skills ) {
            var component = Qt.createComponent("SkillView.qml");
            var skillView = component.createObject(
                        skillsView,
                        {
                            name: skillpackView.skills[i].name,
                            value: skillpackView.skills[i].value,
                            width: skillpackView.width
                        });
            skillpackView.height += skillView.height + 5;
        }
    }

    function specs() {
        var specText = "(";
        for ( var i in skillpackView.specializations ) {
            specText += skillpackView.specializations[i].charAt(0);
            if ( parseInt(i) !== skillpackView.specializations.length-1 ) {
                specText += ", ";
            }
        }
        specText += ")";
        return specText;
    }
}
