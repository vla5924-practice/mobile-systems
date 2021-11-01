import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page

    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily_eng.asp"
        query: "/ValCurs/Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: "Currency rate"
            description: "JS model"
        }
        model: xmlListModel
        delegate: Column {
            x: Theme.horizontalPageMargin
            Label { text: Name }
            Label { text: Value }
        }
    }
}
