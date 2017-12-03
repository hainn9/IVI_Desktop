import QtQuick 2.0
import "../shared"
import WeatherInfo 1.0

Item {
    id: homeMainView

    Image {
        id: homeBg
        anchors.fill: parent
        source: "../images/backgrounds/homeBackground.png"
    }

    AppModel {
        id: model
    }

    Item {
        id: mainWeatherInfo
        anchors.fill: parent

        Text {
            id: cityNameTxt
            width: parent.width
            height: 30
            color: "lightgrey"
            font.bold: true
            font.pointSize: 20
            text: model.hasValidCity?model.city:""
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        BigForecastIcon {
            id: current
            anchors.top:cityNameTxt.bottom
            anchors.topMargin: 10
            width: mainWeatherInfo.width - 12
            height: 2* (mainWeatherInfo.height - 25 -12)/3
            weatherIcon: model.hasValidWeather?model.weather.weatherIcon:"01d"
            topText: model.hasValidWeather?model.weather.temperature:""
            bottomText: model.hasValidWeather?model.weather.weatherDescription:""

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    model.refreshWeather()
                }
            }
        }

        Row {
            id: iconRow
            anchors.top: current.bottom
            spacing: 6
            width: mainWeatherInfo.width - 12
            height: (mainWeatherInfo.height - 25 -24)/3
            property real iconWidth: iconRow.width/4 - 10
            property real iconHeight: iconRow.height

            ForecastIcon {
                id: forecast1
                width: iconRow.iconWidth
                height: iconRow.iconHeight
                topText: model.hasValidWeather?model.forecast[0].dayOfWeek:""
                bottomText: model.hasValidWeather?model.forecast[0].temperature:""
                weatherIcon: model.hasValidWeather?model.forecast[0].weatherIcon:"01d"
            }

            ForecastIcon {
                id: forecast2
                width: iconRow.iconWidth
                height: iconRow.iconHeight
                topText: model.hasValidWeather?model.forecast[1].dayOfWeek:""
                bottomText: model.hasValidWeather?model.forecast[1].temperature:""
                weatherIcon: model.hasValidWeather?model.forecast[1].weatherIcon:"01d"
            }

            ForecastIcon {
                id: forecast3
                width: iconRow.iconWidth
                height: iconRow.iconHeight
                topText: model.hasValidWeather?model.forecast[2].dayOfWeek:""
                bottomText: model.hasValidWeather?model.forecast[2].temperature:""
                weatherIcon: model.hasValidWeather?model.forecast[2].weatherIcon:"01d"
            }

            ForecastIcon {
                id: forecast4
                width: iconRow.iconWidth
                height: iconRow.iconHeight
                topText: model.hasValidWeather?model.forecast[3].dayOfWeek:""
                bottomText: model.hasValidWeather?model.forecast[3].temperature:""
                weatherIcon: model.hasValidWeather?model.forecast[3].weatherIcon:"01d"
            }
        }
    }
}


//Item {

//    // Reset
//    function resetList() {
//        model.clear();
//        for (var i=0; i < homeWidgets.count; i++)
//            model.append(homeWidgets.get(i));
//    }

//    Component {
//        id: itemDrawer
//        Item {
//            width: widgetList.width
//            height: 74

//            Connections {
//                target: appFw
//                onAppDataChanged: {
//                    if (appName == dataSource) {
//                     if (data.description)
//                        ListView.view.model.set(index, { descriptionText: data.description });
//                     if (data.title)
//                        ListView.view.model.set(index, { titleText: data.title });
//                     if (data.status)
//                        ListView.view.model.set(index, { statusText: data.status });
//                     if (data.other)
//                        ListView.view.model.set(index, { otherText: data.other });
//                    }
//                }
//            }

//            // Background image for the list item
//            BorderImage {
//                id: background
//                border.left: 93
//                border.top: 2
//                border.right: 25
//                border.bottom: 2
//                horizontalTileMode: BorderImage.Repeat
//                width: widgetList.width
//                height:  74
//                source: backgroundImage

//                MouseArea {
//                    anchors.fill: parent
//                    onClicked:  {
//                        if (launchApp)
//                            changeApp(launchApp);
//                    }
//                }
//            }

//            // Draw the icon and desctiption info piled up
//            // and the title and texts on their side
//            Column{
//                x:25
//                anchors.verticalCenter:background.verticalCenter

//                Image {
//                    id: icon
//                    source: iconSource
//                }

//                Text {
//                    id: descriptionField
//                    anchors.horizontalCenter: icon.horizontalCenter
//                    text: descriptionText
//                    color: "white"
//                    font.pixelSize: 12
//                }
//            }

//            Text {
//                id: titleField
//                x: 100
//                anchors.verticalCenter: background.verticalCenter
//                text: titleText
//                color: "white"
//                font.pixelSize: 18
//            }

//            Text {
//                id: statusField
//                text:statusText
//                color: "white"
//                font.pixelSize: 12
//                anchors.top: titleField.bottom
//                anchors.topMargin: 5
//                anchors.left: titleField.left
//                anchors.leftMargin: 50
//            }

//            Text {
//                id: otherField
//                text: otherText
//                color: "white"
//                font.pixelSize: 18
//                anchors.verticalCenter: parent.verticalCenter
//                x: 400
//            }
//        }
//    }

//    ListModel {
//        id: model
//    }

//    // The list that draws status texts
//    ListView {
//        id: widgetList
//        width: parent.width - scroller.width
//        height: parent.height
//        model: model
//        delegate: itemDrawer
//        spacing: 20
//        focus: false
//    }

//    // Scroll indicator
//    ScrollIndicator {
//        id: scroller
//        anchors.left:widgetList.right
//        anchors.top: widgetList.top
//        anchors.bottom: widgetList.bottom
//        position: widgetList.visibleArea.yPosition
//        zoom: widgetList.visibleArea.heightRatio
//        shown: widgetList.moving
//    }
//}

