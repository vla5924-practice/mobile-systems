import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property var dataModel: [
        { bg_color: "white", text: "White", text_color: "black" },
        { bg_color: "black", text: "Black", text_color: "white"},
        { bg_color: "blue", text: "Blue", text_color: "red"}
    ]
    SilicaListView {
        spacing: 10
        anchors.fill: parent
        header: PageHeader {
            title: "Colored rectangles"
            description: "Alternative implementation (JS model)"
        }
        model: dataModel
        delegate: Rectangle {
            width: parent.width
            height: 80
            color: modelData.bg_color
            Text {
                anchors.centerIn: parent
                text: modelData.text
                color: modelData.text_color
            }
        }
    }
}
