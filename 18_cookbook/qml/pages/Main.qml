import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        anchors.centerIn: page
        spacing: 30

        Button {
            width: page.width - 60
            text: "Рецепты"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Recipes.qml"))
        }
        Button {
            width: page.width - 60
            text: "Поиск"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Search.qml"))
        }
        Button {
            width: page.width - 60
            text: "Категории"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Categories.qml"))
        }
        Button {
            width: page.width - 60
            text: "Ингредиенты"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Ingredients.qml"))
        }
        Button {
            width: page.width - 60
            text: "Настройки"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Settings.qml"))
        }
    }
}
