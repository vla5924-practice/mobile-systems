import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int timer: 0

    ParallelAnimation {
        id: anim
        loops: Animation.Infinite
        PropertyAnimation {
            target: s
            property: "value"
            from: 0
            to: 59
            duration: 60000
        }

        PropertyAnimation {
            target: m
            property: "value"
            from: 0
            to: 59
            duration: 3600000
        }

        PropertyAnimation {
            target: h
            property: "value"
            from: 0
            to: 23
            duration: 86400000
        }

    }

    Row {
        TimeSection {
            id: h
            x: 0
            y: 0
            value: 0
        }
        TimeSection {
            id: m
            x: 100
            y: 0
            value: 0
        }
        TimeSection {
            id: s
            x: 200
            y: 0
            value: 0
        }

        Button {
            x: 0
            y: 200
            text: "Start"
            onClicked: {
                if (text == "Start") {
                    text = "Stop"
                    anim.start()
                }
                else {
                    text = "Start"
                    anim.stop()
                }
            }
        }
    }

}
