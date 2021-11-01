import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    ListModel {
        id: listModel
        ListElement { text: "White"; bg_color: "white"; text_color: "black" }
        ListElement { text: "Black"; bg_color: "black"; text_color: "white"}
        ListElement { text: "Blue"; bg_color: "blue"; text_color: "red"}
    }
    SilicaListView {
        spacing: 10
        anchors.fill: parent
        header: PageHeader { title: "Colored rectangles" }
        model: listModel
        delegate: Rectangle {
            width: parent.width
            height: 80
            color: model.bg_color
            Text {
                anchors.centerIn: parent
                text: model.text
                color: model.text_color
            }
        }
    }
}
