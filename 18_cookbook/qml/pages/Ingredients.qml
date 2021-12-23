import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    id: page

    SilicaListView {
        id: ingredientsList
        spacing: 10
        anchors.fill: parent
        header: PageHeader {
            title: "Ингредиенты"
        }
        model: ListModel {
            id: ingredientsModel
            Component.onCompleted: {
                var ingredients = Database.fetchIngredients();
                ingredients.forEach(function (ingredient) {
                    append(ingredient);
                });
            }
        }

        delegate: ListItem {
            width: ListView.view.width
            Label {
                text: model.name
                anchors.centerIn: parent
            }
            menu: ContextMenu {
                MenuItem {
                    text: "Показать рецепты"
                    onClicked: pageStack.animatorPush(Qt.resolvedUrl("Recipes.qml"), {"byIngredient": model.id})
                }
            }
        }
    }
}
