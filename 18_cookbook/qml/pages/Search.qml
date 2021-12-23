import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    id: page

    SilicaListView {
        spacing: 10
        anchors.fill: parent
        header: PageHeader {
            title: "Поиск"
        }
        TextField {
            y: 34
            x: 5
            placeholderText: "Начните вводить название"
            onTextChanged: updateModel(text, this)
        }

        model: ListModel {
            id: searchResultsModel
        }

        delegate: ListItem {
            width: ListView.view.width
            Label {
                id: label
                text: model.name
                anchors.centerIn: parent
            }
            Label {
                anchors.top: label.bottom
                anchors.horizontalCenter: label.horizontalCenter
                text: model.category_name
                font.pixelSize: Theme.fontSizeExtraSmall
            }
            menu: ContextMenu {
                MenuItem {
                    text: "Открыть рецепт"
                    onClicked: pageStack.animatorPush(Qt.resolvedUrl("Recipe.qml"), {"recipeId": model.id})
                }
            }
        }
    }

    function updateModel(query, textField) {
        query = query.trim();
        if (query === "") {
            textField.label = ""
            return;
        }
        var results = Database.fetchRecipesByQuery(query);
        textField.label = "Найдено: " + results.length;
        searchResultsModel.clear();
        results.forEach(function (result) {
            searchResultsModel.append(result);
        });
        textField.forceActiveFocus();
    }
}
