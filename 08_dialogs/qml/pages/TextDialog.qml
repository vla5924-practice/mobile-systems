import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Text dialog"
        }
        Button {
            text: "Open dialog"
            onClicked: dialog.open()
        }
        TextField {
            id: outField
        }

        Dialog {
            id: dialog
            Column {
                spacing: 10
                width: page.width
                DialogHeader{}
                TextField {
                    id: inField
                }
            }
            onAccepted: outField.text = inField.text
        }
    }
}
