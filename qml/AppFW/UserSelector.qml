import QtQuick 2.0
import QtQuick.Controls 1.4
import "../shared"

Item {
    id: container

    // Properties
    property int leftmargin: 0
    property int topmargin: 10
    property int bottommargin: 10

    // Signal
    signal homeAppDisplayed;

    // Function
    function changeState() {
        if (container.state == "minimized")
            container.state = "userSelection";
        else
            container.state = "minimized";
    }

    // Components that scale when switching between states are grouped within a single Item
    Item   {
        id: scalingContent

        // Scaling factor that is changed upon transition
        property real scaleFactor: 1
        property alias loginButton: loginTxt

        anchors.fill: parent
        transform:
            Scale {
            id: scaler
            origin.x: person.x
            origin.y: person.y
            xScale: scalingContent.scaleFactor
            yScale: scalingContent.scaleFactor
        }

        Image {
            id: bgImage
            anchors.fill: parent
            source: "../images/backgrounds/background_main.png"
        }

        Item {
            id: userArea
            width: 0.75*document.properties.width
            height: 75
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            BorderImage {
                id: background
                border.left: 20; border.top: 2
                border.right: 20; border.bottom: 2
                anchors.fill: parent
                source: "../images/bars/user_bar.png"
            }

            Image {
                id: userImg
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.left: parent.left
                anchors.leftMargin: 30
                source: "../dummydata/content/faces/images.jpeg"
                width: 70
                height: 70

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(loginTxt.text === "Logout")
                            changeState();
                    }
                }
            }

            Item {
                id: loginInfo
                anchors.left: userImg.right
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 15
                height: 55
                width: 325

                Text {
                    id: userNameLbl
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.bold: true
                    font.pixelSize: 18
                    text: "User Name: "
                    color: 'white'
                    width: 120
                }

                TextField {
                    id: userNameTxt
                    placeholderText: qsTr("")
                    anchors.left: userNameLbl.right
                    anchors.leftMargin: 5
                    anchors.top: parent.top
                    width: 200
                }

                Text {
                    id: passwordLbl
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    font.bold: true
                    font.pixelSize: 18
                    text: "Password: "
                    color: 'white'
                    width: 120
                }

                TextField {
                    id: passworTxt
                    placeholderText: qsTr("")
                    echoMode: TextInput.Password
                    anchors.left: passwordLbl.right
                    anchors.leftMargin: 5
                    anchors.bottom: parent.bottom
                    width: 200
                }
            }

            Text {
                id: userText
                text: userNameTxt.text
                font.pixelSize: 30
                color: "lightgrey"
                anchors.left: userImg.right
                anchors.leftMargin: 15
                anchors.top: parent.top
                anchors.topMargin: 20
                visible: false
            }

            Rectangle {
                id: loginBtn
                width: 80
                height: 40
                anchors.left: loginInfo.right
                anchors.leftMargin: 30
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "black"
                border.width: 2
                radius: 2
                color: "#8f8f8f"
                Text {
                    id: loginTxt
                    text: qsTr("Login")
                    font.bold: true
                    font.pixelSize: 18
                    anchors.centerIn: parent
                    color: "white"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(loginTxt.text === "Login") {
                            if((userNameTxt.text === "NamHai") && (passworTxt.text === "14071992")) {
                                //console.log("Login successful!");
                                homeAppDisplayed();
                                changeState();
                            }
                            else {
                                //console.log("Incorrect username or password!");
                            }
                        }
                        else if (loginTxt.text === "Logout") {
                            loginTxt.text = "Login";
                            userText.visible = false;
                            loginInfo.visible = true;
                            userNameTxt.text = "";
                            passworTxt.text = "";

                        }
                    }
                }
            }
        }
    }

    Image {
        id: person
        source: "../dummydata/content/faces/images.jpeg"
        smooth: true
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
        width: 70
        height: 70
        opacity: 0

        MouseArea {
            anchors.fill: person
            onClicked: {
                scalingContent.loginButton.text = "Logout";
                userText.visible = true;
                loginInfo.visible = false;
                changeState();
            }
        }
    }

    states: [
        State {
            name: "minimized"
            PropertyChanges { target: person; opacity: 1; visible: true }
            PropertyChanges { target: scalingContent; scaleFactor: 0; visible: false }
        },
        State {
            name: "userSelection"
            PropertyChanges { target: person; visible: false }
            PropertyChanges { target: scalingContent; scaleFactor: 1; visible: true }
            PropertyChanges { target: appHolder; visible: false }
            PropertyChanges { target: toolbar; visible: false }
            PropertyChanges { target: topNav; visible: false }
            PropertyChanges { target: volumeBar; visible: false }
        }

    ]

    transitions: [
        Transition {
            to: "minimized"
            //reversible: true
            NumberAnimation { properties: "scaleFactor,opacity,visible"; easing.type: "InOutQuad"; duration: 500 }
        },
        Transition {
            to: "userSelection"
            NumberAnimation { properties: "scaleFactor, visible"; easing.type: "InOutQuad"; duration: 500 }
        }
    ]
}
