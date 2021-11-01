import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        Button {
            width: page.width
            text: "Currency rate (JS model)"
            onClicked: pageStack.push(Qt.resolvedUrl("CurrencyRate.qml"))
        }
        Button {
            width: page.width
            text: "Currency rate (XMLHttpRequest)"
            onClicked: pageStack.push(Qt.resolvedUrl("CurrencyRateAlt.qml"))
        }
    }
}
