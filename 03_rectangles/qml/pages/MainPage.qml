import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        Button {
            text: "Rectangles Basic"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesBasic.qml"))
        }
        Button {
            text: "Rectangles Table"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesTable.qml"))
        }
        Button {
            text: "Rectangles Grid"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesGrid.qml"))
        }
        Button {
            text: "Rectangles Transform"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesTransform.qml"))
        }
        Button {
            text: "Rectangles Animation"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesAnimation.qml"))
        }
    }
}
