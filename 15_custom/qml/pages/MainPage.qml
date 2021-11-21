import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        Button {
            width: page.width
            text: "Traffic light component"
            onClicked: pageStack.push(Qt.resolvedUrl("TrafficLightPage.qml"))
        }
        Button {
            width: page.width
            text: "Custom button component"
            onClicked: pageStack.push(Qt.resolvedUrl("CustomButtonPage.qml"))
        }
        Button {
            width: page.width
            text: "Stopwatch demo"
            onClicked: pageStack.push(Qt.resolvedUrl("StopwatchPage.qml"))
        }
    }
}
