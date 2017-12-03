import QtQuick 2.0

ListModel {
    ListElement {
        buttonText: "START"
        event: "start"
        iconImage: "../images/icons/icon_stop.png"
        blink: true
        buttonEnabled: true
    }
    ListElement {
        buttonText: "CURRENT"
        event: "active"
        iconImage: "../images/icons/icon_log.png"
        blink: false
        buttonEnabled: true
    }
    ListElement {
        buttonText: "LOG"
        event: "history"
        iconImage: "../images/icons/icon_log.png"
        blink: false
        buttonEnabled: true
    }
}
