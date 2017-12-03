import QtQuick 2.0

Item {
    id: mainView

    // Handle toolbar events
    function handleToolbarEvent(event) {
        switch (event) {
            case "start":
                currentLog.state="started";
                setButtons("stopping");
                break;
            case "stop":
                currentLog.state="stopped";
                logHistoryList.appendlogHistory();
                setButtons("new");
                var title = currentLog.log_title;
                if (!title)
                    title = currentLog.log_endtime;
                appDataChanged(appName,
                              { title: title,
                                status: currentLog.log_triptype,
                                other: currentLog.log_triplength });
                break;
            case "new":
                currentLog.state="new";
                setButtons("starting");
                break;
            default:
                mainView.state = event;
        }
    }

    // change first button in toolbar according app state
    function setButtons(btnState) {
        switch (btnState) {
            case "starting":
                setToolbarButton(0, { buttonText: "START", event: "start" });
                break;
            case "stopping":
                setToolbarButton(0, { buttonText: "STOP", event: "stop" });
                break;
             case "new":
                setToolbarButton(0, { buttonText: "NEW", event: "new" });
                break;
        }
    }

    LogCurrentView {
        id: currentLog
        anchors.fill: parent
    }

    LogHistoryList {
        id: logHistoryList
        width: app.width
        height: app.height
        y: app.height
    }

    states:
        State {
            name: "history"
            PropertyChanges {
                target: currentLog
                y: 0-mainView.height
                opacity:0
            }
            PropertyChanges {
                target: logHistoryList
                y: 0
            }
        }

    transitions:
        Transition {
            NumberAnimation { properties: "y,opacity"; easing.type: "InOutQuad"; duration: 500 }
        }
}
