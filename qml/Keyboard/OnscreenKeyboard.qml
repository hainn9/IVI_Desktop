import QtQuick 2.0
import "../shared"

Item {
    id: keybMainWindow

    property int leftmargin: 5
    property int topmargin: 50
    property int frame: 10
    property string label: ""
    // Initial value for the text field
    property alias initText: curText.text

    // Signal
    signal textEntered(string kbdText)
    signal enterWebView(string webUrlText)

    // Background for the keyboard
    Rectangle {
        id: bg
        color: "black"
        width: parent.width - 2 * frame
        height: layout.height + 30
        border.width: 4
        border.color:"white"
        radius: 15
        opacity: 0.8
        x: frame
        y:topmargin
    }

    Column{
        id: layout

        y: bg.y + 15
        anchors.left: bg.left
        anchors.right: bg.right
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        spacing: 20

        Text {
            id: labelText

            anchors.leftMargin: leftmargin
            text: keybMainWindow.label + ": "
            font.bold: true
            font.pixelSize: 26
            color: "white"
        }

        // Framed text field for the input text
        Rectangle {
            id: textFrame

            radius: 8
            anchors.left: parent.left
            anchors.right: parent.right
            height: 40
            color:  "#323232"
            border.color: "#d5d5d5"
            border.width: 1

            Text {
                id: curText

                anchors.left: parent.left
                anchors.leftMargin: frame
                anchors.verticalCenter: parent.verticalCenter
                text: keybMainWindow.initText
                font.bold: true
                font.pixelSize: 26
                color: "white"
            }
        }

        // Draw keypads
        Grid {
            id: numKeypad
            spacing: 2
            columns: 12

            KeyButton { operation: "1" }
            KeyButton { operation: "2" }
            KeyButton { operation: "3" }
            KeyButton { operation: "4" }
            KeyButton { operation: "5" }
            KeyButton { operation: "6" }
            KeyButton { operation: "7" }
            KeyButton { operation: "8" }
            KeyButton { operation: "9" }
            KeyButton { operation: "0" }
            KeyButton { operation: "+" }
            KeyButton { operation: "Del"; width: 68;}

            KeyButton { operation: "Q" }
            KeyButton { operation: "W" }
            KeyButton { operation: "E" }
            KeyButton { operation: "R" }
            KeyButton { operation: "T" }
            KeyButton { operation: "Y" }
            KeyButton { operation: "U" }
            KeyButton { operation: "I" }
            KeyButton { operation: "O" }
            KeyButton { operation: "P" }
            KeyButton { operation: "" }
            KeyButton { operation: "Enter"; width: 68; }

            KeyButton { operation: "A" }
            KeyButton { operation: "S" }
            KeyButton { operation: "D" }
            KeyButton { operation: "F" }
            KeyButton { operation: "G" }
            KeyButton { operation: "H" }
            KeyButton { operation: "J" }
            KeyButton { operation: "K" }
            KeyButton { operation: "L" }
            KeyButton { operation: "" }
            KeyButton { operation: "" }
            KeyButton { operation: "Clear"; width: 68; }

            KeyButton { operation: "Z" }
            KeyButton { operation: "X" }
            KeyButton { operation: "C" }
            KeyButton { operation: "V" }
            KeyButton { operation: "B" }
            KeyButton { operation: "N" }
            KeyButton { operation: "M" }
            KeyButton { operation: "," }
            KeyButton { operation: "." }
            KeyButton { operation: "-" }
            KeyButton { operation: "" }
            KeyButton { operation: "Go"; width: 68; }
        }
        // Space key
        KeyButton {
            anchors.horizontalCenter: numKeypad.horizontalCenter
            width: 270
            operation: "Space"
        }
    }
}
