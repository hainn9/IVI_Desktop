import QtQuick 2.0

// Model for browser view
ListModel {
    ListElement {
        buttonText:"BACK"
        event: "back"
        iconImage: "../images/icons/icon_back.png"
        blink: false
        buttonEnabled: true
    }
    ListElement {
        buttonText: "FORWARD"
        event: "forward"
        iconImage: "../images/icons/icon_forward.png"
        blink: false
        buttonEnabled:  true
    }
    ListElement {
        buttonText: "RELOAD"
        event: "reload"
        iconImage: "../images/icons/icon_reload.png"
        blink: false
        buttonEnabled: true
    }
    ListElement {
        buttonText: "URL"
        event: "enterurl"
        iconImage: "../images/icons/icon_url.png"
        blink: false
        buttonEnabled: true
    }
    ListElement {
        buttonText: "LIST"
        event: "listview"
        iconImage: "../images/icons/icon_bookmarks_list.png"
        reflectionImage: false
        blink: false
        buttonEnabled: true
    }
    ListElement {
        buttonText: "GRID"
        event: "gridview"
        iconImage: "../images/icons/icon_bookmarks_thumbs.png"
        blink: false
        buttonEnabled: true
    }
}
