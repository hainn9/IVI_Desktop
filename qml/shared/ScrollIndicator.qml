import QtQuick 2.0

Item {
    id: scrollInd

    property real position: 0.5
    property real zoom: 0.5
    property bool shown: false

    function getY(position) {
        if (zoom == 1 || position < 0)
            return 0;
        else if (position > 1-zoom)
            return scrollInd.height-scroll_knob.height;
        else
            return position / (1-zoom) *(scrollInd.height - scroll_knob.height);
    }

    width: scroll_knob.width

    // Background
    Rectangle {
        id: scroll_bar

        y: scroll_knob.height / 2
        x: scroll_knob.width / 2 - width /2
        color: "black"
        border.color:"white"
        border.width: 2
        width: 6
        height: parent.height - scroll_knob.height
        radius: 2
        opacity: 0
    }

    // Knob
    Image {
        id: scroll_knob

        source: "../images/scroll_indicator.png"
        y: getY(position)
        opacity: 0
    }

    states:
        State {
            name: "shown"
            when: shown
            PropertyChanges{ target: scroll_knob; opacity: 1 }
            PropertyChanges{ target: scroll_bar; opacity: 0.2 }
        }

    transitions:
        Transition {
            NumberAnimation{ properties: "opacity"; easing.type: "InOutQuad"; duration: 400 }
        }
}
