import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SlideshowView {
        id: view
        model: ListModel {
            ListElement { name: "Task 1"; date: "13.10.2021" }
            ListElement { name: "Task 2"; date: "13.10.2021" }
            ListElement { name: "Task 3"; date: "14.10.2021" }
            ListElement { name: "Task 4"; date: "14.10.2021" }
            ListElement { name: "Task 5"; date: "14.10.2021" }
            ListElement { name: "Task 6"; date: "15.10.2021" }
            ListElement { name: "Task 7"; date: "16.10.2021" }
            ListElement { name: "Task 8"; date: "16.10.2021" }
        }

        anchors.fill: parent

        delegate: Rectangle {
            width: view.itemWidth
            height: view.height
            Text {
                anchors.centerIn: parent
                text: name + "\n" + date
            }
        }
    }
}
