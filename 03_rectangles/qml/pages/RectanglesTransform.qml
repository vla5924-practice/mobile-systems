import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 250

    Rectangle {
        id: rectRed

        width: page.rectSize
        height: page.rectSize
        color: "black"
    }

    Rectangle {
        width: page.rectSize
        height: page.rectSize
        color: "black"
        transform: [
            Scale {
                yScale: 0.5
            },
            Rotation {
                angle: 135
            },
            Translate {
                x: page.rectSize * 2.2
                y: page.rectSize * 0.4
            }
        ]
    }
}
