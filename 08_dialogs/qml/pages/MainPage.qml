import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Dialogs"
        }
        Button {
            text: "Text dialog"
            onClicked: pageStack.push(Qt.resolvedUrl("TextDialog.qml"))
        }
        Button {
            text: "Date dialog"
            onClicked: pageStack.push(Qt.resolvedUrl("DateDialog.qml"))
        }
        Button {
            text: "Time dialog"
            onClicked: pageStack.push(Qt.resolvedUrl("TimeDialog.qml"))
        }
    }
}
