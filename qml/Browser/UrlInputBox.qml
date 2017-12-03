import QtQuick 2.0
import "../shared"

Item {
    id: container

    // Properties
    property alias url: urlText.input

    // Signal
    signal urlEntered

    state: "hidden"
    Rectangle {
        radius: 10
        border.width: 1
        border.color: "#d5d5d5"
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#323232"
        height: 60

        LabelInputBox {
            id: urlText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:  parent.left
            anchors.leftMargin: 10
            anchors.right: urlGoButton.left
            anchors.rightMargin: 10
            labelWidth: 50
            label: "URL:"
            helpText: "Enter URL"
            input: "http://"
        }

        Rectangle {
            id: urlGoButton

            color: "#323232"
            radius: 8
            border.color: "#d5d5d5"
            border.width: 1
            width: 40
            height: parent.height
            anchors.right: parent.right

            Text {
                text: "Go"
                anchors.centerIn: parent
                color: 'white'
                font.pixelSize: 18
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    urlText.inputBox.confirm()
                    container.urlEntered()
                }
            }
        }
    }

    states: [
        State {
            name: "visible"
            PropertyChanges {
                target: container
                height: 60
                anchors.bottomMargin: 0
                visible: true
            }
        },

        State {
            name: "hidden"
            PropertyChanges {
                target: container
                height: 0
                anchors.bottomMargin: 0
                visible: false
            }
        }
    ]

    transitions:
        Transition {
            NumberAnimation { properties: "height, bottomMargin, visible";
                              easing.type: "InOutQuad" ; duration: 500 }
        }
}
