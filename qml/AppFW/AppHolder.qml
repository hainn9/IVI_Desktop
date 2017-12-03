import QtQuick 2.0
import "../Home"

Item {
    id: appHolder

    // Properties
    property variant currentApp
    property bool transparentControls: appFw.transparentControls

    // Function
    function changeApp(appName) {
        var app = null;
        if (appName === "Home")
            app = homeApp;
        else {
            for (var i=0; i < appHolder.children.length && !app; i++) {
                // Set the desired application source property the associated Loader
                if (appHolder.children[i].appName === appName &&
                    appHolder.children[i].application) {
                    appHolder.children[i].source = appHolder.children[i].tempSource;
                    app = appHolder.children[i];
                }
            }
        }
        if (app) {
            if (appHolder.currentApp)
                appHolder.currentApp.activeApp = false;
            app.activeApp = true;
            appHolder.currentApp = app;
        appHolder.currentApp.focus = true
        applicationActive(appName);
        }
    }

    // Home app is always available
    HomeApp {
        id: homeApp
        property bool activeApp: false

//        Connections {
//            target: userSelector
//            onUserChanged: homeApp.resetContent();
//        }
    }

    Repeater {
        model: configuration
        Loader {
            property bool application: true
            property string appName: name
            property bool activeApp: false
            property string tempSource: appSource
            source: ""
        }
    }
}
