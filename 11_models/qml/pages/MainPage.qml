import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        Button {
            width: page.width
            text: "Colored rectangles"
            onClicked: pageStack.push(Qt.resolvedUrl("ColoredRectangles.qml"))
        }
        Button {
            width: page.width
            text: "Rectangles list"
            onClicked: pageStack.push(Qt.resolvedUrl("RectanglesList.qml"))
        }
        Button {
            width: page.width
            text: "Colored rectangles (JS model)"
            onClicked: pageStack.push(Qt.resolvedUrl("ColoredRectanglesAlt.qml"))
        }
    }
}
