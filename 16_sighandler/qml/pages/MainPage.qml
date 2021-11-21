import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int prevDepth: 2
    property int pagesPushed: 0
    property int pagesPopped: 0

    function handleStackDepthChange() {
        if (typeof pageStack === "undefined")
            return
        if (prevDepth > pageStack.depth)
            pagesPopped++;
        else if (prevDepth < pageStack.depth)
            pagesPushed++;
        console.log("Pushed pages: " + pagesPushed + ", popped pages: " + pagesPopped);
        prevDepth = pageStack.depth;
    }

    Component.onCompleted: {
        pageStack.depthChanged.connect(handleStackDepthChange);
    }

    Column {
        id: column
        anchors.fill: parent;
        width: page.width
        spacing: Theme.paddingLarge
        Button {
            text: "Pop"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Push"
            onClicked: pageStack.push(Qt.resolvedUrl("MainPage.qml"))
        }
        Label {
            text: "Stack depth: " + pageStack.depth
        }
    }
}
