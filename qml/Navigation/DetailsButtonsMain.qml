import QtQuick 2.0

ListModel {
    ListElement {
       buttonText: "ROUTE"
       event: "Route"
       iconImage: "../images/icons/icon_route.png"
       buttonEnabled: true
       blink: false
    }
    ListElement {
       buttonText: "LOCATE"
       event: "Locate"
       iconImage: "../images/icons/icon_locate.png"
       buttonEnabled:  true
       blink: false
    }
    ListElement {
       buttonText: "NEARBY"
       event: "Nearby"
       iconImage: "../images/icons/icon_nearby.png"
       buttonEnabled: true
       blink: false
    }
    // Add one padding element to create space between elements
    ListElement {buttonText: ""; event: ""; iconImage: ""; buttonEnabled: false; blink: false; shareButtonText: ""}
    ListElement {
       buttonText: "ZOOMIN"
       event: "ZoomIn"
       iconImage: "../images/icons/icon_zoom_in.png"
       buttonEnabled: true
       blink: false
    }
    ListElement {
       buttonText: "ZOOMOUT"
       event: "ZoomOut"
       iconImage: "../images/icons/icon_zoom_out.png"
       buttonEnabled: true
       blink: false
    }
}
