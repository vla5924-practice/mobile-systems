import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaWebView {
        anchors.fill: parent
        header: PageHeader {
            title: "practice.mvla.ru"
            description: "SilicaWebView demo"
        }
        url: "https://practice.mvla.ru"
        VerticalScrollDecorator {}
    }
}
