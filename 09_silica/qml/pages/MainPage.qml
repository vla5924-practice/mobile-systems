import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Silica components demo"
        }
        Button {
            width: page.width
            text: "SilicaListView demo"
            onClicked: pageStack.push(Qt.resolvedUrl("ListViewDemo.qml"))
        }
        Button {
            width: page.width
            text: "SilicaWebView demo"
            onClicked: pageStack.push(Qt.resolvedUrl("WebViewDemo.qml"))
        }
        Button {
            width: page.width
            text: "SlideshowView demo"
            onClicked: pageStack.push(Qt.resolvedUrl("SlideshowViewDemo.qml"))
        }
        Button {
            width: page.width
            text: "SilicaFlickable demo"
            onClicked: pageStack.push(Qt.resolvedUrl("FlickableDemo.qml"))
        }
        Button {
            width: page.width
            text: "ContextMenu demo"
            onClicked: pageStack.push(Qt.resolvedUrl("ContextMenuDemo.qml"))
        }
    }
}
