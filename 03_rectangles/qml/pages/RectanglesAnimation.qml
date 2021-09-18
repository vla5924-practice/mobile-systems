import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 100
    onActiveFocusChanged: anim.restart()

    Rectangle {
        id: rect
        width: page.rectSize
        height: page.rectSize
        color: "red"
        anchors.horizontalCenter: page.horizontalCenter
        ParallelAnimation {
            id: anim
            PropertyAnimation {
                target: rect
                properties: "width"
                from: page.rectSize
                to: page.rectSize * 3
                duration: 1000
            }
            PropertyAnimation {
                target: rect
                properties: "height"
                from: page.rectSize
                to: page.rectSize * 3
                duration: 1000
            }
            PropertyAnimation {
                target: rect
                properties: "y"
                from: 0
                to: 400
                duration: 1000
            }
        }
    }
}
