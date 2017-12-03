import QtQuick 2.0

// Toolbar buttons for RouteView
ListModel {
    ListElement {
       buttonText: "BACK"
       event: "back"
       iconImage: "../images/icons/icon_back.png"
       buttonEnabled: true
       blink: false
    }
    ListElement {
       buttonText: "SHOW"
       event: "showRoute"
       iconImage: "../images/icons/icon_locate.png"
       buttonEnabled:  true
       blink: false
    }
}
