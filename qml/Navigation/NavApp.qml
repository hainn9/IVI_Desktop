import QtQuick 2.0
import "../AppFW"

// Navigation application
DynamicApp {
    id: app

    // Properties
    toolbarHandler: mainView
    x: 2*document.width

    NavMainView {
        id: mainView
        anchors.fill: parent
    }

    // Used toolbar button sets
    DetailsButtonsMain{ id: buttonsMain }
    DetailsButtonsRoute { id: buttonsRoute }
    DetailsButtonsLocation { id: buttonsLocation }

    states:
        State {
            name: "current"
            when: activeApp
            StateChangeScript { script: refresh() }
            PropertyChanges { target:app; x:0 }
            StateChangeScript { script: {mainView.setContext() } }
        }

    transitions: [
        Transition {
           to: "current"
           NumberAnimation { properties: "x"; easing.type: "InOutQuad"; duration: 500 }
        },
        Transition {
           from: "current"
           NumberAnimation { properties: "x"; easing.type: "InOutQuad"; duration: 500 }
           ScriptAction { script: { transparentControls = false; } }
        }
    ]
}
