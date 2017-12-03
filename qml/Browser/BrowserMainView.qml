import QtQuick 2.0

// Browser main view
Item {
    id: mainView

    // Properties
    property alias bookmarkMode: bookmarkView.state  // "gridview" or "listview"
    property alias browserEngine: browserView.browserEngine

    // Function
    function handleToolbarEvent(event) {
        switch (event) {
        case "gridview":    // Fall through
        case "listview":
            if (mainView.state == "bookmarks" &&
                    bookmarkMode === event &&
                    browserEngine.url != "")
            {
                mainView.state = "browser";
            }
            else {
                mainView.state = "bookmarks";
                bookmarkMode = event;
            }
            app.urlInput.visible = false;
            break;
        case "back":
            browserEngine.goBack();
            break;
        case "forward":
            browserEngine.goForward();
            break;
        case "reload":
            browserEngine.reload();
            break;
        case "enterurl":
            urlInput.state = (urlInput.state == "hidden")?"visible":"hidden";

            break;
        }
    }

    function openUrl(url) {
        mainView.state = "browser";
        browserView.openUrl(url);
    }

    // View which displays the browser
    BrowserView {
        id: browserView
        anchors.fill: parent
        clip: true
    }

    // Bookmark view
    BookmarkView {
        id: bookmarkView
        anchors.fill: parent
        state: "gridview"
        onBookmarkSelected: {
            browserView.openUrl(url);
            mainView.state = "browser"
        }
    }

    states: [
        State {
            name: "bookmarks"
            PropertyChanges{
                target: bookmarkView
                y: 0
                visible: true
            }
            PropertyChanges {
                target: browserView
                height: 0
                visible: false
            }
            StateChangeScript { script: setToolbarModel(toolbarBtnsBookmarks) }
//            StateChangeScript { script: resetCounter() }
        },

        State {
            name: "browser"
            PropertyChanges{
                target: bookmarkView
                y: parent.height
                visible: false
            }
            PropertyChanges {
                target: browserView
                height: mainView.height
                visible: true
            }
            StateChangeScript { script: setToolbarModel(toolbarBtnsBrowser) }
//            StateChangeScript { script: resetCounter() }
        }
    ]

    transitions: [
        Transition {
            to: "browser"
            reversible: true
            NumberAnimation { properties: "y,height,visible"; easing.type: "InOutQuad"; duration: 500 }
        },
        Transition {
            to: "bookmarks"
            reversible: true
            SequentialAnimation {
                NumberAnimation { properties: "y,height"; easing.type: "InOutQuad" ; duration: 500 }
                PauseAnimation { duration: 100 }
                NumberAnimation { properties: "visible"; easing.type: "OutSine"; duration: 500 }
            }
        }
    ]
}
