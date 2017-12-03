import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6

Item {
    // Define min and max zoom values
    property int minZoom: 1
    property int maxZoom: 17
    property int progress: 1

    Map {
        id: map
        x: parent.x
        anchors.fill: parent
        plugin : Plugin {
                            name : "osm"
                        }
    }

    function setLocation (lat, lon)  {
        map.center = QtPositioning.coordinate(lat,lon);
    }

    function setMapZoom (zoom)  {
        map.zoomLevel=zoom;
    }

    MouseArea {
        anchors.fill: parent

        property bool mouseDown : false
        property int lastX : -1
        property int lastY : -1

        onPressed : {
            mouseDown = true
            lastX = mouse.x
            lastY = mouse.y
        }
        onReleased : {
            mouseDown = false
        }


        onPositionChanged: {
            if (mouseDown) {
                var dx = mouse.x - lastX
                var dy = mouse.y - lastY
                map.pan(-dx, -dy)
                lastX = mouse.x
                lastY = mouse.y
            }
        }

    }
}
