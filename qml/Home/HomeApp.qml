import QtQuick 2.0
import "../AppFW"

DynamicApp {
    id: app

    useToolbar: false
    opacity: 0

    HomeMainView {
        id: mainView
        anchors.fill: parent
        clip: true
    }

    states:
        State {
            name: "current"
            when: activeApp
            StateChangeScript { script: refresh() }
            PropertyChanges { target:app; opacity: 1 }
        }
    transitions:
        Transition {
            to: "current"
            reversible: true
            NumberAnimation { properties: "opacity"; easing.type: "InOutQuad"; duration: 500 }
        }
}
