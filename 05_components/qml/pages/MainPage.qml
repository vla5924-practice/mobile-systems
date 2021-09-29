import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        Button {
            text: "Buttons"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Buttons.qml"))
        }
        Button {
            text: "Date & Time Pickers"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("DateTime.qml"))
        }
        Button {
            text: "Sliders"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Sliders.qml"))
        }
        Button {
            text: "Miscellaneous"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Misc.qml"))
        }
    }
}
