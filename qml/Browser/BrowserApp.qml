import QtQuick 2.0
import "../AppFW"

// Web browser application
DynamicApp {
    id: app

    //Properties
    property alias urlInput: urlInput

    toolbarHandler: mainView

    x: width

    // Create toolbar buttons for Browser
    ButtonsDataBookmarks {
        id: toolbarBtnsBookmarks
    }
    ButtonsDataBrowser { id: toolbarBtnsBrowser }

    BrowserMainView {
        id: mainView
        state: "bookmarks"
        anchors.fill: parent
    }

    // Url input
    UrlInputBox {
        id: urlInput
        anchors.left: app.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 10
        onUrlEntered: {
            urlInput.state = "hidden"
            mainView.openUrl(urlInput.url);

        }
    }

    states:
        State {
        name: "current"
        when: activeApp
        StateChangeScript { script: refresh() }
        PropertyChanges { target:app; x: 0 }
        StateChangeScript {
            script: {
                if (mainView.state == "browser")
                    setToolbarModel(toolbarBtnsBrowser);
                else
                    setToolbarModel(toolbarBtnsBookmarks);
            }
        }
    }

    transitions: [
        Transition {
            to: "current"
            NumberAnimation { properties: "x";easing.type: "InOutQuad"; duration: 500 }
        },
        Transition {
            from: "current"
            NumberAnimation { properties: "x";easing.type: "InOutQuad"; duration: 500 }
        }
    ]
}
