import QtQuick 2.0
import "../shared"
import "time.js" as Time

Item {
    id: currentLog

    // Properties
    property int rowHeight: 34
    property alias log_title : logName.input
    property alias log_starttime : startDateTime.text
    property alias log_endtime : stopDateTime.text
    property alias fromLocation: from.input
    property alias toLocation: to.input

    Rectangle {
        id: background
        color: "black"
        width:currentLog.width
        height:  currentLog.height
        radius: 15
        opacity: 0.7
    }

    Column {
        id: logList

        anchors.top : parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.topMargin: 15
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        spacing: 5

        LabelInputBox {
            id: logName
            width: parent.width
            height: rowHeight
            label: "Trip Title"
            helpText: "Enter trip title"
        }

        LabelInputBox {
            id: from
            width: parent.width
            height: rowHeight
            label: "From"
            helpText: "Enter start location"
        }

        LabelInputBox {
            id: to
            width: parent.width
            height: rowHeight
            label: "To"
            helpText: "Enter end location"
        }

        Row {
            id: startTimeItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: currentLog.rowHeight
            opacity: 0

            Text {
                 id: startLabel
                 font.bold: true
                 font.pixelSize: 18
                 text: "Start time"
                 color: 'white'
                 width: 120
            }

            Rectangle {
                id: starttimeInput
                width: startTimeItem.width - startLabel.width
                height: 30
                radius: 8
                color: "#323232"
                border.color: "#d5d5d5"
                border.width: 1
                Text {
                    id: startDateTime
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.pixelSize: 18
                    color: "white"
                    text: Time.getTimeStr(true)
                }
            }

        }

        Row {
            id: stopTimeItem
            anchors.left: parent.left
            anchors.right: parent.right
            height: currentLog.rowHeight
            opacity: 0

            Text {
                 id: stopLabel
                 font.bold: true
                 font.pixelSize: 18
                 text: "Stop time"
                 color: 'white'
                 width: 120
            }

            Rectangle {
                id: stoptimeInput
                width: stopTimeItem.width - stopLabel.width
                height: 30
                radius: 8
                color: "#323232"
                border.color: "#d5d5d5"
                border.width: 1
                Text {
                    id: stopDateTime
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    font.pixelSize: 18
                    color: "white"
                    text: Time.getTimeStr(true)
                }
            }
        }
    }

    states: [
        State {
            name: "started"
            PropertyChanges {target: startTimeItem; opacity: 1 }
            StateChangeScript {
                name: 'timeUpdate'
                script: startDateTime.text = Time.getTimeStr(true)
            }
        },

        State {
            name: "stopped"
            PropertyChanges {target: startTimeItem; opacity: 1 }
            PropertyChanges {target: stopTimeItem; opacity: 1 }
            StateChangeScript {
                name: 'timeUpdate'
                script: stopDateTime.text = Time.getTimeStr(true)
            }
        },

        State {
            name: "new"
            PropertyChanges {target: logName; input: "" }
            PropertyChanges {target: from; input: "" }
            PropertyChanges {target: to; input: "" }
        }

    ]

    transitions:
        Transition {
            NumberAnimation { properties: "opacity"; duration: 200 }
        }
}
