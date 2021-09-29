import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        Slider {
            width: page.width
            id: slider
            minimumValue: 0
            maximumValue: 100
            value: 0
            stepSize: 0.1
        }
        Label {
            width: page.width
            text: slider.value
        }
    }
}
