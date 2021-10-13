import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10

        Label {
            text: "First page"
        }

        Button {
            text: "Attach page"
            onClicked: pageStack.pushAttached(Qt.resolvedUrl("SecondPage.qml"))
        }
        Button {
            text: "Detach page"
            onClicked: pageStack.popAttached()
        }
    }
}
