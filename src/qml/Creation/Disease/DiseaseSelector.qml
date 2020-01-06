import QtQuick 2.0
import QtQuick.Controls 2.5

import neuroshima.data 1.0

RadioButton {
    property var disease

    signal change(var disease)

    id: diseaseSelector

    text: disease.name

    onCheckedChanged: change(disease)
}
