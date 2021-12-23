import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    id: page

    Column {
        spacing: 20
        anchors.centerIn: page
        Button {
            width: page.width
            text: "Очистить базу данных"
            onClicked: Database.dropDatabase()
        }
    }
}
