import QtQuick 2.0

// A base component for applications
Item {
    id: dynamicApp

    // Properties
    property bool useToolbar: true
    property variant toolbarHandler

    // Signal
    signal setToolbarModel(variant model)
    signal activateToolbarButton(int btn)
    signal setToolbarButton(int index, variant btnDef)
    signal refresh
    signal changeApp(string appName)
    signal appDataChanged(string appName, variant data)
    signal resetCounter

    // Binding
    width: appHolder.width
    height: useToolbar ? appHolder.height: appHolder.height + toolbar.height

    onSetToolbarModel: toolbar.model = model
    onRefresh: toolbar.visible = useToolbar
    onActivateToolbarButton: toolbar.activateButton(btn)
    onSetToolbarButton: toolbar.model.set(index, btnDef)
    onChangeApp: appFw.changeApp(appName)
    onAppDataChanged: appFw.appDataChanged(appName, data)
    onResetCounter: toolbar.count = 0

    // Handle toolbar events
    Connections {
        target: activeApp ? toolbar: null
        onBtnClicked: toolbarHandler.handleToolbarEvent(event)
    }
}
