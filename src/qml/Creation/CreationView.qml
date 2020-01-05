import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

import "Form"
import "Attribute"
import "Origin"
import "Profession"
import "Specialization"
import "Disease"

Item {
    property Component form: Component {
        Form {
            id: creationForm
            anchors.fill: loader
        }
    }
    property Component attributes: Component {
        CreationAttribute{
            id: creationAttribute
            anchors.fill: loader
        }
    }
    property Component origin: Component {
        OriginView{
            id: creationOrigin
            anchors.fill: loader
            onSendOriginFeature: {
                handleFeature(creationView.originFeature, featureData);
                originFeature = featureData;
            }
        }
    }
    property Component profession: Component {
        ProfessionView {
            id: professionView
            anchors.fill: loader
            onSendProfessionFeature: {
                handleFeature(creationView.professionFeature, featureData);
                professionFeature = featureData;
            }
        }
    }
    property Component specialization: Component {
        SpecializationView {
            id: specializationView
            anchors.fill: loader
            onSpecializationChanged: {
                console.log("Current specialization:", specialization.name);
            }
        }
    }
    property Component disease: Component {
        DiseasesView {
            id: diseaseView
            anchors.fill: loader
        }
    }

    property var originFeature
    property var professionFeature

    signal addSkillpack(var selected, var value)
    signal removeSkillpack(var selected, var value);

    id: creationView
    anchors.fill: parent

    ScrollView {
        id: upperBar
        height: 50
        anchors {
            top: parent.top
            topMargin: 5
            left: parent.left
            right: parent.right
        }

        Row {
            spacing: 5

            Button {
                text: "Formularz"
                onClicked: loader.sourceComponent = creationView.form
            }
            Button {
                text: "Pochodzenie"
                onClicked: loader.sourceComponent = creationView.origin
            }
            Button {
                text: "Profesja"
                onClicked: loader.sourceComponent = creationView.profession
            }
            Button {
                text: "Atrybuty"
                onClicked: loader.sourceComponent = creationView.attributes
            }
            Button {
                text: "Specjalizacja"
                onClicked: loader.sourceComponent = creationView.specialization
            }
            Button {
                text: "Choroba"
                onClicked: loader.sourceComponent = creationView.disease
            }
            Button { text: "Umiejętności" }
        }
    }

    Loader {
        id: loader
        anchors {
            top: upperBar.bottom
            topMargin: 5
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        sourceComponent: creationView.form
    }

    onAddSkillpack: { console.log("Adding skillpack", selected, value); }
    onRemoveSkillpack: { console.log("Removing skillpack", selected, value); }

    function isFeatureEqual(current, other) {
        if ( current === undefined || other === undefined )
            return false;
        if ( Object.keys(current).length !== Object.keys(other).length )
            return false;

        for ( var i in Object.keys(current) ) {
            var key = Object.keys(current)[i];
            if ( !other.hasOwnProperty(key) )
                return false;
            if ( current[key] !== other[key] )
                return false;
        }
        return true;
    }

    function addBonus(feature) {
        var type = feature["type"];
        if ( type === "Skillpack" )
            addSkillpack(feature["selected"], feature["value"]);
    }

    function removeBonus(feature) {
        var type = feature["type"];
        if ( type === "Skillpack" )
            removeSkillpack(feature["selected"], feature["value"]);
    }

    function handleFeature(current, other) {
        if ( isFeatureEqual(current, other) )
            return;

        if ( current !== undefined )
            removeBonus(current);
        addBonus(other);
    }
}
