import QtQuick 2.0

Item {
    id: wrapper
    property bool selected: false

    width: 50
    height:  50
    opacity: buttonEnabled ? 0.5 : 0

    // Button icon
    Image {
        id: icon

        anchors.centerIn: parent
        source: iconImage
        SequentialAnimation {
            loops: Animation.Infinite
            running: blink

            PropertyAnimation {
                target: icon
                property: "opacity"
                from: 1.0; to: 0.0
                duration: 1000
            }
            PropertyAnimation {
                target: icon
                property: "opacity"
                from: 0.0; to: 1.0
                duration: 1000
            }
        }
    }

    // Button text below the icon
    Text {
        id: button

        anchors.horizontalCenter: icon.horizontalCenter
        anchors.horizontalCenterOffset: 0
        anchors.top: icon.bottom
        anchors.topMargin: 5
        text: buttonText
        font.pixelSize: 12
        font.bold: true
        color: "white"
    }

    states:
        State {
            name: "selected"
            when: selected

            PropertyChanges {
                target: wrapper
                opacity: 1

            }
        }

    transitions:
        Transition {
            to: "selected"
            reversible: true

            NumberAnimation { properties: "opacity"; duration: 500 }
        }
}
