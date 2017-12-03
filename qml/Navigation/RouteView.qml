import QtQuick 2.0
import "../shared"

// RouteView
Item {
     id: routeView

    property alias routeTo: editRouteTo.text
    property alias routeFrom: editRouteFrom.text

    Column {
        anchors.centerIn: parent
        spacing:15

        // Title for route start location input field
        Text {
            id: routeFromText
            text: "Route from:"
            font.pixelSize: 20
            font.bold: true
            color: "white"
        }

        // Arrange start location icon and input field in row
        Row {
            id: routeFrom
            height: editRouteFrom.height
            spacing: 15

            // 'A' icon
            Image {
                id: iconA
                source: "../images/icons/icon_routepoint.png"

                Text {
                    text: "A"
                    anchors.bottom: iconA.bottom
                    anchors.bottomMargin: 10
                    anchors.left: iconA.left
                    anchors.leftMargin: 25
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                }
            }

            // Input field for the start location
            InputBox {
                id: editRouteFrom

                anchors.verticalCenter: parent.verticalCenter
                width:routeView.width - iconB.width - 150
                height:40
                pixelSize: 18
                label: "Route from"
                text: ""
            }
        }

        // Title for route end location input field
        Text {
            id: routeToText
            text: "Route to:"
            font.pixelSize: 20
            font.bold: true
            color: "white"
        }

        // Arrange end location icon and input field in row
        Row {
            id: routeTo
            height: editRouteTo.height
            spacing: 15

            // Icon 'B'
            Image {
                id: iconB
                source: "../images/icons/icon_routepoint.png"
                Text {
                    text: "B"
                    anchors.left: iconB.left
                    anchors.leftMargin: 25
                    anchors.bottom: iconB.bottom
                    anchors.bottomMargin: 9
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                }
            }

            // Input field for the end location
            InputBox {
                id: editRouteTo

                anchors.verticalCenter: iconB.verticalCenter
                width:routeView.width - iconB.width -150
                height:40
                pixelSize: 18
                label: "Route to"
                text: ""
            }
        }
    }
}
