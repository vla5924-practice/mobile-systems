import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Item 1"
                onClicked: outField.text = text
            }
            MenuItem {
                text: "Item 2"
                onClicked: outField.text = text
            }
        }
        PushUpMenu {
            MenuItem {
                text: "Item 3"
                onClicked: outField.text = text
            }
            MenuItem {
                text: "Item 4"
                onClicked: outField.text = text
            }
        }

        Column {
            spacing: 10
            width: page.width
            PageHeader {
                title: "Pull-down menus"
                description: "SilicaFlickable demo"
            }
            TextField {
                id: outField
            }
        }
    }
}
