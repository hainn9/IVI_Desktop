import QtQuick 2.0
import QtWebView 1.1
import "../shared"

Item {
    id: wrapper

    // Zoom value when zooming with double click
    property real doubleClickZF: 2.0
    property alias browserEngine: browserEngine
    property alias contentWidth: browserView.contentWidth
    property alias contentHeight: browserView.contentHeight
    property alias contentX: browserView.contentX
    property alias contentY: browserView.contentY

    function openUrl(url) {
        browserEngine.url = url;
    }

    Flickable {
        id: browserView

        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: parent.height
        // Black background for the browserView
        Rectangle  {
            id: browserBackground
            anchors.fill: parent
            color: 'black'
        }

        // The actual web page content
        WebView {
            id: browserEngine
            anchors.fill: parent
        }
    }
}
