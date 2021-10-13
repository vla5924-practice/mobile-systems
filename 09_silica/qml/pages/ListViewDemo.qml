import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaListView {
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
        header: PageHeader {
            title: "Task list"
            description: "SilicaListView demo"
        }
        delegate: BackgroundItem {
            Label {
                text: name
            }
        }
        section.property: "date"
        section.delegate: BackgroundItem {
            PageHeader {
                title: section
            }
        }
        VerticalScrollDecorator {}
    }
}
