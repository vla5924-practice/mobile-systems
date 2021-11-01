import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int count: 0

    ListModel { id: listModel; }
    Column {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10
        PageHeader {
            title: "Rectangles list"
        }
        Button {
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add"
            onClicked: listModel.append({text: "Item " + (++count)})
        }
        SilicaListView {
            width: parent.width
            height: parent.height
            model: listModel
            spacing: 10
            delegate: Rectangle {
                SecondaryButton {
                    width: parent.width
                    height: parent.height
                    onClicked: listModel.remove(model.index)
                }
                width: parent.width
                height: 70
                color: "white"
                Text {
                    anchors.centerIn: parent
                    text: model.text
                }
            }
        }
    }
}
