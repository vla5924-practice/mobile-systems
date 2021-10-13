import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Time dialog"
        }
        Button {
            text: "Open dialog"
            onClicked: dialog.open()
        }
        TextField {
            id: outField
        }

        TimePickerDialog {
            id: dialog
            onAccepted: outField.text = timeText
        }
    }
}
