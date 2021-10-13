import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Date dialog"
        }
        Button {
            text: "Open dialog"
            onClicked: dialog.open()
        }
        TextField {
            id: outField
        }

        DatePickerDialog {
            id: dialog
            onAccepted: outField.text = dateText
        }
    }
}
