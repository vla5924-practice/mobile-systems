import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: cover
    property int counter: 0

    Label {
        anchors.centerIn: parent
        text: counter
    }

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-cover-cancel"
            onTriggered: cover.counter = 0
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-new"
            onTriggered: cover.counter++
        }
    }
}
