import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        TextField {
            width: page.width
            label: "Text field label"
            placeholderText: "This is placeholder text"
            inputMethodHints: Qt.ImhDigitsOnly
        }
        ComboBox {
            width: page.width
            label: "List"
            menu: ContextMenu {
                MenuItem { text: "One" }
                MenuItem { text: "Two" }
                MenuItem { text: "Three" }
            }
            onCurrentIndexChanged: console.log(currentItem)
        }
        TextSwitch {
            id: s
            width: page.width
            text: "Disabled"
            onCheckedChanged: text = (checked ? "Enabled" : "Disabled")
        }
    }
}
