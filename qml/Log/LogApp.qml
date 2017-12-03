import QtQuick 2.0
import "../AppFW"

DynamicApp {
    id: app
    toolbarHandler: mainView

    LogMainView {
        id: mainView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 5
        height: 0
        clip: true
    }

    LogButtonsData { id: toolbarBtns }

    states:
       State {
           name: "current"
           when: activeApp

           StateChangeScript { script: refresh() }
           PropertyChanges{ target: mainView; height: app.height }
           StateChangeScript { script: setToolbarModel(toolbarBtns) }
       }

    transitions:
      Transition {
          to: "current"
          reversible: true
          NumberAnimation { properties: "height";easing.type: "InOutQuad"; duration: 500 }
      }
}
