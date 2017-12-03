import QtQuick 2.0
import "../shared"

Item {
    function appendlogHistory() {
        var tempTitle = currentLog.log_title;
        if (tempTitle === "")
            tempTitle = currentLog.log_starttime +": Go from "+currentLog.fromLocation+" to "+currentLog.toLocation;
        else
            tempTitle = currentLog.log_starttime+": "+currentLog.log_title;

        history.model.append({
                                 "log_title": tempTitle,
                                 "log_starttime": currentLog.log_starttime,
                                 "log_endtime": currentLog.log_endtime
                             });
    }

    // Draw list history
    Component {
        id: listDrawer

        Item {
            id: wrapper

            width: history.width
            height: 60

            BorderImage {
                id: background
                anchors.fill: parent
                border.left: 22; border.top: 2
                border.right: 22; border.bottom: 2
                horizontalTileMode: BorderImage.Repeat
                source: "../images/bars/listbar_log.png"
            }

            Row {
                anchors.leftMargin: 15
                anchors.left: wrapper.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10

                Text {
                    id: title
                    text: log_title
                    font.bold: true
                    font.pixelSize: 16
                    color: "white"
                }
            }
        }
    }

    // List of the log entries
    ListView {
        id: history

        width: parent.width-scroller.width
        height: parent.height
        spacing: 5
        model: ListModel {}
        delegate: listDrawer
    }

    // Scroll indicator
    ScrollIndicator {

        id: scroller
        anchors.left: history.right
        anchors.top: history.top
        anchors.bottom: history.bottom
        position: history.visibleArea.yPosition
        zoom: history.visibleArea.heightRatio
        shown: history.moving
    }
}
