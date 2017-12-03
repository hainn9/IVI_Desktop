import QtQuick 2.0
import "./AppFW"
import "./Keyboard"

Item {
    id: document
    property alias properties: properties

    QtObject {
        id: properties
        property int width: 800
        property int height: 480

        property alias keyboard: onscreenKeyboard
    }

    width: properties.width
    height: properties.height

    Rectangle {
        id: blackBG
        anchors.fill: parent
        color: "black"
    }

    Flipable {
        id:mainScreen
        anchors.fill: parent

        front: AppFramework {
            id: appFw
            anchors.fill: parent
            configuration: activeConfiguration
        }

        back: OnscreenKeyboard {
            id: onscreenKeyboard
            property bool show: false
            width: properties.width
            height: properties.height

        }

        transform: Rotation {
            id: rotator
            origin.x: properties.width/2
            origin.y: properties.height/2
            axis.x: 1
            axis.y: 0
            axis.z: 0
            angle: 0
        }

        states: State {
            name: "keyboard"
            when: onscreenKeyboard.show
            PropertyChanges {target: rotator; angle: 180}
        }

        transitions: Transition {
            NumberAnimation {properties: "angle"; duration: 500}
        }
    }
}
