import QtQuick 2.0

Item {
    id: container

    property string text
    property string label
    property int pixelSize: 18
    property string color: "white"
    property alias backgroundColor: bg.color

    // Confirms changes made to the text
    function confirm(confirmValue) {
        if (confirmValue)
            container.text = confirmValue;
        else
            container.text = textEdit.text;
        textEdit.focus = false;
    }

    height: textEdit.height

    // Handles events from keyboard
    Connections {
        target: document.properties.keyboard
        onTextEntered: {
            confirm(kbdText);
            document.properties.keyboard.show = false;
        }
        onEnterWebView: {
            confirm(webUrlText);
            document.properties.keyboard.show = false;
            urlInput.urlEntered();
        }
    }

    // Draw a background rectangle
    Rectangle {
       id : bg

       width: container.width-2
       height: container.height+10
       anchors.verticalCenter: parent.verticalCenter
       radius: 8
       color: "#323232"
       border.color: "#d5d5d5"
       border.width: 1
    }

    // Button that opens onscreen keyboard
    Image {
        id: keyboardIcon

        width: 22
        height: 15
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "../images/icons/icon_keyboard.png"
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: {
                document.properties.keyboard.label = container.label;
                document.properties.keyboard.initText = textEdit.text;
                document.properties.keyboard.show = true;
            }
        }
    }

    // Standard single line text input
    TextInput {
        id: textEdit

        text: container.text
        color: container.color
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: keyboardIcon.left
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: container.pixelSize
        onAccepted: {
            confirm();
            //urlInput.urlEntered()
            keyboardIcon.visible = false;
        }
        onActiveFocusChanged: keyboardIcon.visible = true
    }

    Text {
        id: textLabel

        x: 5
        width: parent.width-10
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: "AlignHCenter"
        font.pixelSize: container.pixelSize
        font.italic: true
        font.bold: true
        text: label
        opacity: textEdit.text == '' ? 1 : 0
    }
}
