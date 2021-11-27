import QtQuick 2.0
import Sailfish.Silica 1.0
import cppbackend.Counter 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Counter {
        id: counter
        counter: 0
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Counter"
            }

            Label {
                text: counter.counter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 64
            }

            Button {
                text: "Increment"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: counter.increment()
            }

            Button {
                text: "Reset"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: counter.reset()
            }
        }
    }
}
