import QtQuick 2.0

Item {
    id: volumeBar
    state: "Off"

    Rectangle {
        id: bg
        color: "black"
        border.color:"white"
        border.width: 2
        anchors.fill: parent
        radius: 15
        opacity: appFw.transparentControls ? 0.2 : 0.0
    }

    Item  {
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height

        BorderImage {
            id: groove
            border.left: 2; border.top: 24
            border.right: 2; border.bottom: 20
            height: parent.height - muteBtnBg.height
            source: "../images/volume/volume_slider_back.png"
            verticalTileMode: BorderImage.Repeat
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: muteBtnBg
            anchors.top: groove.bottom
            source: "../images/volume/mute_button.png"
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: speakerImage
                source: "../images/icons/icon_mute_speaker.png"
                anchors.centerIn: parent
            }

            Image {
                id: muteOnIcon
                source: "../images/icons/icon_unmute.png"
                anchors.centerIn: parent
            }

            Image {
                id: muteOffIcon
                source: "../images/icons/icon_mute_bigger.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (volumeBar.state == "On")
                        volumeBar.state = "Off";
                    else
                        volumeBar.state = "On";
                }
            }
        }
    }

    Image {
        id: knob
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../images/volume/volume_slider_button.png"
        y: groove.height - knob.height

        MouseArea {
            id: region
            anchors.fill: knob
            // Allow dragging the knob along Y axis
            drag.target: knob
            drag.axis: "YAxis"
            drag.minimumY: 0
            drag.maximumY: groove.height - knob.height
        }
    }

    states: [
        State {
            name: "On"
            PropertyChanges { target: muteOnIcon; opacity: 1 }
            PropertyChanges { target: muteOffIcon; opacity: 0 }
        },
        State {
            name: "Off"
            PropertyChanges { target: muteOnIcon; opacity: 0 }
            PropertyChanges { target: muteOffIcon; opacity: 1 }
        }
    ]

    transitions:
        Transition {
            NumberAnimation { properties: "opacity"; easing.type: "InQuad"; duration: 200 }
        }
}
