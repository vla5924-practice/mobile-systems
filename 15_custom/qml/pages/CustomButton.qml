import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    default property var item
    property var color
    Button {
        text: parent.item.text
        color: parent.color
    }
}
