#include <QApplication>
#include "qmlapplicationviewer.h"
#include <QtWebView/QtWebView>
#include <QLoggingCategory>
#include "weather_app/appmodel.h"

int main(int argc, char *argv[])
{
    QLoggingCategory::setFilterRules("wapp.*.debug=false");
    QApplication app(argc, argv);
    QtWebView::initialize();

    qmlRegisterType<WeatherData>("WeatherInfo", 1, 0, "WeatherData");
    qmlRegisterType<AppModel>("WeatherInfo", 1, 0, "AppModel");
    qRegisterMetaType<WeatherData>();

    QmlApplicationViewer viewer;
    viewer.loadDummyDataFiles(QLatin1String("./qml/dummydata"));
    viewer.setMainQmlFile("./qml/main.qml");
    viewer.show();

    return app.exec();
}
