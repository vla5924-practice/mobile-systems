import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    function getCenterWidth(object) {
        return page.width / 2 - object.width / 2;
    }

    Column {
        Label {
            id: counter
            text: i
            width: page.width
            font.pixelSize: 200
            horizontalAlignment: "AlignHCenter"

            property int i: 0
        }

        Button {
            x: page.getCenterWidth(this)
            text: "Increment"
            onClicked: counter.i++
            onPressAndHold: counter.i = 0
        }
    }
}
