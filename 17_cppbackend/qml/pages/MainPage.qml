import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 20

        Button {
            text: "Counter"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("CounterPage.qml"))
        }

        Button {
            text: "Words"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("WordsPage.qml"))
        }

    }
}
