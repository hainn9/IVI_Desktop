import QtQuick 2.0

Item {
    id: container

    // Properties
    property int count: 0
    property int bottomMargin: 4
    property alias model: buttons.model

    // Signal
    signal btnClicked(string event)

    // Set a button highlighted
    function activateButton(index) {
        buttons.currentItem.selected=false;
        buttons.currentIndex = index;
        buttons.currentItem.selected=true;
    }

    // back ground
    Rectangle {
        id: background
        border.width: 2
        color: "black"
        border.color:"white"
        width:  parent.width
        height: parent.height-bottomMargin
        radius: 15
        opacity: 0.5
    }

    // Toolbar item drawer is implemented as a list drawer
    Component {
        id: btnDrawer
        ToolbarButton {
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (buttonEnabled) {
                        activateButton(index);
                        container.btnClicked(event);
//                        if(event == "enterurl")
//                            count++;
//                        console.log(count)
//                        if((count%2 == 0)&&(buttons.currentIndex == index)&&(buttons.currentItem.selected === true)) {
//                            buttons.currentItem.selected = false;
//                        }
                    }
                }
            }
        }
    }

    ListView {
        id: buttons
        x: 20
        model: {}
        delegate: btnDrawer
        orientation: "Horizontal"
        width: container.width
        height: container.height
        spacing: 15
        interactive: false
    }
}
