QT += widgets webview location positioning network core qml quick

# Add more folders to ship with the application, here
folder_01.source = qml

DEPLOYMENTFOLDERS =folder_01

# Additional import path used to resolve Qml modules in Creator's code model
QML_IMPORT_PATH =

SOURCES += main.cpp \
    weather_app/appmodel.cpp

# Please do not modify
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    resources.qrc

DISTFILES += \
    qml/Home/WeatherIcon.qml \
    qml/Home/BigForecastIcon.qml \
    qml/Home/ForecastIcon.qml

HEADERS += \
    weather_app/appmodel.h
