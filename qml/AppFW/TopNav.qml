import QtQuick 2.0
import "../Home"

Item {
    id: container

    // Properties
    property alias configuration: navButtons.model

    // Signal
    signal itemClicked(string appName)

    // Listen for a change in active application and activate the associated button
    Connections {
        target: appFw
        onApplicationActive: {
            var found = -1;
            for (var i=0; i < configuration.count; i++) {
                if (configuration.get(i).name === appName) {
                    found = i;
                    break;
                }
             }
            if (found > -1)
                navButtons.currentIndex = found;
        }
    }

    // When TopNav is loaded, add Home button to it
    Component.onCompleted: {
        var component = Qt.createComponent("../Home/TopNavItemHome.qml");
        if (component.status === Component.Ready) {
            var button = component.createObject(null);
            configuration.insert(0, button);
        }
    }

    // List item drawer for buttons
    Component {
        id: buttonDrawer

        Item {
            id: wrapper
            width: normalImage.width
            height: normalImage.height

            // Images for normal and selected buttons
            Image {
                id: normalImage
                source: "../images/buttons/"+topNavImage+"_passive.png"
                scale: 0.8
            }

            Image {
                id: normalImageActive
                source: "../images/buttons/"+topNavImage+"_active.png"
                scale: 0.8
                opacity: 0
            }

            MouseArea {
                id: delegateRegion
                anchors.fill: parent
                onClicked:  {
                    console.log(name)
                    container.itemClicked(name)
                }
            }

            states:
                State {
                    name: "Current"
                    when: wrapper.ListView.isCurrentItem
                    PropertyChanges {
                        target: normalImageActive
                        opacity: 1
                    }
            }

            transitions:
                Transition {
                    to: "Current"
                    reversible: true
                    NumberAnimation {properties: "opacity"; easing.type: "InQuad"; duration: 300}
            }
        }
    }

    // The list of application shortcuts
    ListView {
        id: navButtons
        model: ""
        delegate: buttonDrawer
        focus: true
        orientation: "Horizontal"
        anchors.fill: parent
        interactive: false
        spacing: (parent.width - currentItem.width*count) / (count + 1)
    }
}
