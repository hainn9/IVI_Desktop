import QtQuick 2.0

Row {
    property int textSize: 18
    property alias label: label.text
    property alias labelWidth: label.width
    property alias labelColor: label.color

    property alias inputBox: input
    property alias input: input.text
    property alias helpText: input.label
    property alias bgColor: input.backgroundColor

    Text {
        id: label
        font.bold: true
        font.pixelSize: textSize
        color: "white"
        width: 120
        text: ""
    }

    InputBox {
        id: input
        pixelSize: textSize
        text: ""
        label: ""
        width: parent.width - labelWidth - parent.spacing
     }
}
