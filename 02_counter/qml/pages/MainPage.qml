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
            text: "0"
            width: page.width
            font.pixelSize: 200
            horizontalAlignment: "AlignHCenter"

            property int i: 0
            function update() {
                this.text = this.i;
            }
            function setCounter(i) {
                this.i = i;
                this.update();
            }
            function increment() {
                this.setCounter(i + 1);
            }
        }

        Button {
            x: page.getCenterWidth(this)
            text: "Increment"
            onClicked: counter.increment()
            onPressAndHold: counter.setCounter(0)
        }
    }
}
