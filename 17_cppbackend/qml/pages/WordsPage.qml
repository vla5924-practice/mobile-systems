import QtQuick 2.0
import Sailfish.Silica 1.0
import cppbackend.Words 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Words {
        id: words
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Words"
            }

            TextField {
                id: text_field
                width: parent.width
                placeholderText: "Enter word..."
            }

            Button {
                text: "Add"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    words.append(text_field.text);
                    text_field.text = "";
                }
            }
            Button {
                text: "Pop"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: words.pop()
            }

            Label {
                id: label
                width: page.width
                wrapMode: "Wrap"
                text: words.list
            }
        }
    }
}
