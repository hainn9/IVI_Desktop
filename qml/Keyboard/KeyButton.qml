import QtQuick 2.0
import "keyboard.js" as Js

// Button used in OnScreenKeyboard.qml
Rectangle {
    id: button

    property string operation
    property bool toggable : false
    property bool toggled : false

    width: 60
    height: 40
    border.color: palette.mid
    radius: 5
    // Use gradient backround for the keyboard text
    gradient: Gradient {
        GradientStop {
            id: g1
            position: 0.0
            color: palette.button
        }
        GradientStop {
            id: g2
            position: 1.0
            color: Qt.darker(palette.button)
        }
    }

    // Use system palette to get
    // standard colors for the keyboard components
    SystemPalette { id: palette }

    Text {
        anchors.centerIn: parent
        font.bold: true
        text: operation
        font.pixelSize:18
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Js.handleOpCode(operation);
            // Toggle button state
            if (button.toggable)
                button.toggled ? button.toggled = false : button.toggled = true
        }
    }

    // A key can be pressed or not pressed, and it can be toggled on/off
    states: [
        State {
            name: "Pressed"
            when: clickRegion.pressed === true
            PropertyChanges { target: g1; color: palette.dark }
            PropertyChanges { target: g2; color: palette.button }
        },
        State {
            name: "Toggled"
            when: button.toggled == true
            PropertyChanges { target: g1; color: palette.dark }
            PropertyChanges { target: g2; color: palette.button }
        }
    ]
}
