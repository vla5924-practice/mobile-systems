import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: "ContextMenu demo"
        }

        model: ListModel {
            id: listModel
            Component.onCompleted: {
                for (var i = 0; i < 10; i++) {
                    append({"name": "Item " + i})
                }
            }
        }

        delegate: ListItem {
            width: ListView.view.width

            Label {
                id: label
                text: model.name
                anchors.centerIn: parent
            }

            menu: ContextMenu {
                MenuItem {
                    text: "Menu 1"
                    onClicked: console.log(model.name + " " + text)
                }
                MenuItem {
                    text: "Menu 2"
                    onClicked: console.log(model.name + " " + text)
                }
            }
        }
    }
}
