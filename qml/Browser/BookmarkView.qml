import QtQuick 2.0

Item {
    id: container

    // Properties
    property int columns: 3
    property int bmWidth: 0.31*container.width
    property int bmHeight: 110
    property int bmSpacing: 20
    // Bookmark item dimensions
    property real itemHeight: container.height/3
    property real itemWidth: container.width/4
    // Bookmark icon dimensions in the grid view
    property int iconWidth: 0.7*itemWidth
    property int iconHeight: 0.7*itemHeight
    property real xstep: itemWidth + bmSpacing
    property real ystep: 0
    property real ystep3: itemHeight+bmSpacing

    // Signals
    signal bookmarkSelected(string url)

    state: "gridview"

    Component {
        id: bookmarkDrawer

        Item {
            id: wrapper

            width: itemWidth
            height: itemHeight
            x: xstep/3 + (index % columns) * xstep
            y: Math.floor(index / columns) * ystep3  + (index % columns)*ystep

            // Border image for the item.
            BorderImage {
                id: bookmarkBackgroundborder
                border.left: 22
                border.top: 20
                border.right: 22
                border.bottom: 20
                horizontalTileMode: BorderImage.Stretch
                verticalTileMode:  BorderImage.Stretch
                width:parent.width
                height: parent.height
                source: "../images/bars/listbar_internet.png"
            }

            Image {
                id: bookmarkIcon
                y: 5
                anchors.horizontalCenter: parent.horizontalCenter
                source:  picture
                width: iconWidth
                height: iconHeight
                fillMode: "PreserveAspectFit"
            }

            Text {
                id: bookmarkText
                font.pixelSize: 18
                font.bold: true
                color: "lightgrey"
                text: title
                anchors.horizontalCenter: wrapper.horizontalCenter
                y: {
                    if (bookmarkIcon.height > (wrapper.height - height) / 2)
                        return anchors.topMargin + bookmarkIcon.y + bookmarkIcon.height
                    else
                        return (wrapper.height - height) / 2
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: container.bookmarkSelected(url)
            }
        }
    }
    Flickable {
        id: flickable
        width: container.width
        height: container.height
        contentWidth: container.width
        contentHeight: repe.height
        clip: true

        Repeater {
            id: repe
            anchors.fill:parent
            model: bookmarkData
            delegate: bookmarkDrawer
        }
    }

    states:
        State {
            name: "listview"
            PropertyChanges {
                target: container
                itemHeight: 65
                itemWidth: columns*bmWidth + (columns-1)*bmSpacing
                iconHeight: 0
                iconWidth: 0
                xstep: 0
                ystep: itemHeight + bmSpacing
                ystep3: (itemHeight + bmSpacing) * 3
            }
        }

    transitions:
        Transition {
            from: "gridview"
            to: "listview"
            reversible: true
            SequentialAnimation {
                NumberAnimation {
                    properties: "iconHeight,itemHeight,y,ystep,ystep3"
                    easing.type: "InOutQuad"
                    duration: 500
                }
                NumberAnimation {
                    properties: "iconWidth,itemWidth,x,xstep"
                    easing.type: "InOutQuad"
                    duration: 500
                }
            }
        }
}
