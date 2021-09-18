import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 250

    Rectangle {
        id: rectRed

        width: page.rectSize
        height: page.rectSize
        color: "red"
    }

    Rectangle {
        id: rectGreen

        width: page.rectSize
        height: page.rectSize
        color: "green"

        anchors.left: rectRed.right
        anchors.top: rectRed.verticalCenter
    }

    Rectangle {
        width: page.rectSize
        height: page.rectSize
        color: "blue"

        anchors.bottom: rectGreen.verticalCenter
        anchors.left: rectGreen.horizontalCenter

        Text {
            text: "Квадрат"
            color: "white"
            font.pixelSize: 50

            anchors.centerIn: parent
        }
    }
}
