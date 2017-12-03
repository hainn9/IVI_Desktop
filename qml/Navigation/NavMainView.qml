import QtQuick 2.0
import "../shared"

Item {
    id: mainView

    property bool offline: true
    // Property values to contain route and location information
    property string routeFrom: "Heathrown airport"
    property string routeTo: "Paddington train station"
    property string location: "Greenwich"
    property double lat: 51.477809906
    property double lon: -0.001507401466

    // Current zoom factor of the map view
    property int currentZoom: 10

    function setContext() {
        switch (state) {
        case "Map":
            setToolbarModel(buttonsMain);
            transparentControls = true;
            break;
        case "Route":
            setToolbarModel(buttonsRoute);
            transparentControls = false;
            break;
        case "Locate":
            setToolbarModel(buttonsLocation);
            transparentControls = false;
            break;
        }
    }

    // Change between Map, Route and Locate views
    function changeView(view) {
        switch (view) {
        case "Map":
            transparentControls = true;
            break;
        case "Route":
            transparentControls = false;
            //TODO: add marker removal
            break;
        case "Locate":
            transparentControls = false;
            //TODO: add marker removal
            break;
        }
        mainView.state = view;
        setContext();
    }

    // Handle toolbar button events
    function handleToolbarEvent(event) {
        if (event === "Nearby") {
            if (!offline) {
                //TODO add marker drawing here
            }
        }
        else if (event === "showLocation"){
            location = locateView.locationText;
            changeView("Map");
        }
        else if (event === "showRoute") {
            setToolbarModel(app.buttonsMain);
            mainView.routeTo = routeView.routeTo;
            mainView.routeFrom = routeView.routeFrom;
            changeView("Map");
        }
        else if (event === "back")
            changeView("Map");
        else if (event === "Locate")
            mainView.changeView("Locate");
        else if (event === "Route")
            mainView.changeView("Route");
        else if (event === "ZoomOut") {
            if (currentZoom !== mapView.item.minZoom)
                currentZoom--;
            mapView.item.setMapZoom(currentZoom)
        }
        else if (event === "ZoomIn") {
            if (currentZoom < mapView.item.maxZoom)
                currentZoom++;
            mapView.item.setMapZoom(currentZoom)
        }
    }

    OfflineView {
        id: offlineView
        width: mainView.width
        height: mainView.height
        visible: offline
    }


    Loader {
        id: mapView
        source: "MapView.qml"
        x: app.width
        y: -110 // TODO: This is quick hack for placing the map also under TopNav
        width: document.width
        height: document.height

        onLoaded: {
            progressIndicator.state = "hidden";
            mainView.offline = false;
            changeView("Map");
            mapView.item.setLocation(mainView.lat, mainView.lon);
            mapView.item.setMapZoom(currentZoom)
        }
    }


    RouteView {
        id: routeView
        x: mainView.width
        width: mainView.width
        height: mainView.height
        routeTo: mainView.routeTo
        routeFrom: mainView.routeFrom
    }

    LocateView {
        id: locateView
        x:  mainView.width
        width: mainView.width
        height: mainView.height
        locationText: mainView.location
    }

    // ProgressIndicator is displayed when map is loading
    ProgressIndicator {
        id: progressIndicator
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        progress: mapView.progress
    }

    states: [
        State {
            name: "Route"
            PropertyChanges { target: routeView; x: 0 }
        },
        State {
            name: "Map"
            PropertyChanges { target: mapView; x: mainView.mapFromItem(null, app.x, 0.0).x }
        },
        State {
            name: "Offline"
            PropertyChanges { target: mainView; offline: true }
        },
        State {
            name: "Locate"
            PropertyChanges { target: locateView; x: 0 }
        }
    ]

    transitions:
        Transition {
        NumberAnimation { properties: "x"; easing.type: "InOutQuad"; duration: 500 }
    }
}
