import QtQuick 2.0

ListModel {
    ListElement {
        name: "Music"
        appSource: "../Music/MusicApp.qml"
        topNavImage: "music"
    }
    ListElement {
        name: "Navigation"
        appSource: "../Navigation/NavApp.qml"
        topNavImage: "nav"
    }
    ListElement {
        name: "Log"
        appSource: "../Log/LogApp.qml"
        topNavImage: "log"
    }
    ListElement {
        name: "Phone"
        appSource: "../Phone/PhoneApp.qml"
        topNavImage: "phone"
    }
    ListElement {
        name: "Browser"
        appSource: "../Browser/BrowserApp.qml"
        topNavImage: "web"
    }
}

