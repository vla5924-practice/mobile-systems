import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10

        Label {
            text: "Stack"
        }
        Button {
            text: "Pop"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Push"
            onClicked: pageStack.push(Qt.resolvedUrl("StackPage.qml"))
        }
        Label {
            id: counter
            text: "Stack depth: " + pageStack.depth
        }
    }
}
