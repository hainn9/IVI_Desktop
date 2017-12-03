import QtQuick 2.0

Item {
    id: container

    // Relative progress value  between 0-1
    property real progress: 0

    signal stopped

    // Position sybcomponents within the backeround component
    Rectangle {
        anchors.fill: parent
        // Use gradient fill in the background
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.5, 0.5, 0.5, 0.8) }
            GradientStop { position: 1.0; color: Qt.rgba(0.1, 0.1, 0.1, 0.8) }
        }

        // Progress bar that expands according to the progress property
        Rectangle {
            width: (parent.width-stopButton.width)*container.progress
            height: parent.height-parent.radius
            y: parent.radius/2
            x: 0
            radius: parent.radius/2
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(0.0, 0.8, 0.0, 0.8) }
                GradientStop { position: 1.0; color: Qt.rgba(0.0, 0.3, 0.0, 0.8) }
            }
        }

        // Textual presentation of the progress (in per cent)
        Text {
            width: 100
            anchors.centerIn: parent
            text: Math.floor(container.progress * 100) + " %"
            font.pixelSize: 14
            font.bold: true
            color: "lightgrey"
        }

        // Stop button is placed at the right end of the progress indicator
        Rectangle {
            id: stopButton

            width: 80
            height: parent.height
            anchors.right: parent.right
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(0.8, 0.0, 0.0, 0.8) }
                GradientStop { position: 1.0; color: Qt.rgba(0.3, 0.0, 0.0, 0.8) }
            }

            Text {
                text: "Stop"
                font.pixelSize: 14
                font.bold: true
                color: "lightgrey"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: stopped()
            }
        }
    }

    states:
        State {
            name: "hidden"
            PropertyChanges{ target: container; opacity: 0 }
       }

    transitions: [
        Transition {
            to: "hidden"
            reversible: true
            NumberAnimation { properties: "opacity"; easing.type: "InOutQuad"; duration: 500 }
        }
    ]
}
