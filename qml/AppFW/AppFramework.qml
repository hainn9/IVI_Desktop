import QtQuick 2.0
import "../shared"

Item {
    id: appFw

    // Properties
    property bool transparentControls: false
    property variant configuration

    // Signal
    signal applicationActive(string appName)
    signal appDataChanged(string appName, variant data)

    // Function
    function changeApp(appName) {
        appHolder.changeApp(appName);
    }

    // Container for available applications
    AppHolder{
        id: appHolder

        anchors.left: volumeBar.right
        anchors.right: appFw.right
        anchors.top: topNav.bottom
        anchors.bottom: toolbar.top
    }

    // Navigation pane at the top of the screen
    TopNav {
        id: topNav

        configuration: appFw.configuration
        anchors.left: volumeBar.right
        anchors.right: appFw.right
        height:  110
        onItemClicked: changeApp(appName)
    }

    Toolbar {
        id: toolbar
        height: 70
        anchors.left: volumeBar.right
        anchors.right: appFw.right
        anchors.bottom: appFw.bottom
        anchors.leftMargin: 0
        anchors.rightMargin:10
    }

    VolumeBar {
        id: volumeBar
        anchors.top : topNav.bottom
        anchors.bottom: appFw.bottom
        width:  110
    }
    // User selector
    UserSelector {
        id: userSelector

        width: appFw.width
        height: appFw.height
        onHomeAppDisplayed: changeApp("Home")
    }
}
