import QtQuick 2.0
import "../shared"

// LocateView
Item {
    id: locateView

    property alias locationText : editLocation.text

    Column {
        anchors.centerIn: parent
        spacing:15

        Text {
            id: locationText
            text: "Location:"
            font.pixelSize: 20
            font.bold: true
            color: "white"
        }

        InputBox {
            id: editLocation
            width: locateView.width - 150
            height: 40
            pixelSize: 18
            label: "Location"
            text: "Munich Airport"
        }
   }
}


