import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        Button {
            width: page.width
            text: "Traffic light"
            onClicked: pageStack.push(Qt.resolvedUrl("TrafficLight.qml"))
        }
        Button {
            width: page.width
            text: "Animated text"
            onClicked: pageStack.push(Qt.resolvedUrl("AnimatedText.qml"))
        }
    }
}
