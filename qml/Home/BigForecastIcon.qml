import QtQuick 2.0

Item {
    id: current
    property string topText: ""
    property string bottomText: "Mostly cloudy"
    property string weatherIcon: "01d"
    property real smallSide: (current.width<current.height)?current.width:current.height

    WeatherIcon {
        id: iconBig
        weatherIcon: current.weatherIcon
        useServerIcon: false
        anchors.top: current.top
        anchors.topMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        width: current.smallSide
        height: current.smallSide
    }

    Text {
        id: bottomBigTxt
        text: current.bottomText
        font.pointSize: 23
        color: "lightgrey"
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignRight
        anchors.bottom: current.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: topBigTxt
        text: current.topText
        font.pointSize: 23
        color: "lightgrey"
        anchors.bottom: bottomBigTxt.top
        anchors.bottomMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
