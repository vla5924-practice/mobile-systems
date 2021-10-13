import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10

        Label {
            text: "Second page"
        }
        Button {
            text: "Back"
            onClicked: pageStack.navigateBack()
        }
    }
}
