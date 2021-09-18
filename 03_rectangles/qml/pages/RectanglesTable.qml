import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 200
    property int spacing: 10

    Column {
        spacing: page.spacing
        Row {
            spacing: page.spacing
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "red"
            }
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "green"
            }
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "blue"
            }
        }
        Row {
            spacing: page.spacing
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "pink"
            }
            Item {
                width: page.rectSize
                height: page.rectSize
            }
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "black"
            }
        }
    }
}
