import QtQuick 2.0

// Displays offline information
Item {
    id: offlineView
    anchors.fill: parent

    Text {
        anchors.centerIn: parent
        text: "Currently offline.\nNo map content available.\nPlease wait content to load."
        font.pixelSize: 20
        color: 'white'
    }
}
