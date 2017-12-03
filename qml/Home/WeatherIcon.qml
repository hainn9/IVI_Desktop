import QtQuick 2.0

Item {
    id: container
    property string weatherIcon: "01d"
    property bool useServerIcon: true

    Image {
        id: img
        source: {
            if(useServerIcon)
                "http://openweathermap.org/img/w/" + container.weatherIcon + ".png"
            else {
                switch (weatherIcon) {
                case "01d":
                case "01n":
                    "../images/icons/weather-sunny.png"
                    break;
                case "02d":
                case "02n":
                    "../images/icons/weather-sunny-very-few-clouds.png"
                    break;
                case "03d":
                case "03n":
                    "../images/icons/weather-few-clouds.png"
                    break;
                case "04d":
                case "04n":
                    "../images/icons/weather-overcast.png"
                    break;
                case "09d":
                case "09n":
                    "../images/icons/weather-showers.png"
                    break;
                case "10d":
                case "10n":
                    "../images/icons/weather-showers.png"
                    break;
                case "11d":
                case "11n":
                    "../images/icons/weather-thundershower.png"
                    break;
                case "13d":
                case "13n":
                    "../images/icons/weather-snow.png"
                    break;
                case "50d":
                case "50n":
                    "../images/icons/weather-fog.png"
                    break;
                default:
                    "../images/icons/weather-unknown.png"
                }
            }
        }
        smooth: true
        anchors.fill: parent
    }
}
