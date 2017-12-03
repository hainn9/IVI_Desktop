import QtQuick 2.0

// Model for browser bookmark
ListModel {
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
