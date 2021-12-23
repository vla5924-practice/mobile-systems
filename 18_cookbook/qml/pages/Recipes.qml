import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    id: page
    property int byCategory: 0
    property int byIngredient: 0

    SilicaListView {
        id: recipesList
        spacing: 10
        anchors.fill: parent
        header: PageHeader {
            id: recipesHeader
            title: "Рецепты"
            Component.onCompleted: {
                if (page.byCategory > 0) {
                    description = "Категория: " + Database.fetchCategory(page.byCategory).name;
                } else if (page.byIngredient > 0) {
                    description = "Ингредиент: " + Database.fetchIngredient(page.byIngredient).name;
                } else {
                    description = "Показаны все рецепты";
                }
            }
        }
        model: ListModel {
            id: recipesModel
            Component.onCompleted: {
                var recipes = [];
                if (page.byCategory > 0) {
                    recipes = Database.fetchRecipesByCategory(page.byCategory);
                } else if (page.byIngredient > 0) {
                    recipes = Database.fetchRecipesByIngredient(page.byIngredient);
                } else {
                    recipes = Database.fetchRecipes();
                }
                recipes.forEach(function (recipe) {
                    append(recipe);
                });
            }
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
            function remove() {
                ListView.view.model.remove(index);
            }
            menu: ContextMenu {
                MenuItem {
                    text: "Открыть рецепт"
                    onClicked: pageStack.animatorPush(Qt.resolvedUrl("Recipe.qml"), {"recipeId": model.id})
                }
                MenuItem {
                    text: "Удалить рецепт"
                    onClicked: {
                        if (Database.deleteRecipe(model.id)) {
                            remove();
                        }
                    }
                }
            }
        }
        PullDownMenu {
            MenuItem {
                text: "Добавить рецепт"
                onClicked: addRecipeDialog.open()
            }
        }
    }

    Dialog {
        id: addRecipeDialog
        property string categoryName: "<uncategorized>"
        property int categoryId: 0
        Column {
            spacing: 10
            width: page.width
            DialogHeader {
                title: "Добавление рецепта"
            }
            TextField {
                id: recipeName
                label: "Название"
            }
            Item {
                id: catSelector
                width: parent.width
                height: 190
                SilicaListView {
                    anchors.fill: parent
                    model: ListModel {
                        id: categoriesModel
                        Component.onCompleted: {
                            var categories = Database.fetchCategories();
                            categories.forEach(function (category) {
                                append(category);
                            });
                        }
                    }

                    delegate: ListItem {
                        width: ListView.view.width
                        Button {
                            text: model.name
                            anchors.centerIn: parent
                            width: parent.width
                            onClicked: {
                                addRecipeDialog.categoryId = model.id;
                                addRecipeDialog.categoryName = model.name;
                                catSelector.visible = false;
                                catLabel.visible = true;
                                catBtn.visible = true;
                            }
                        }
                    }
                }
            }
            Label {
                id: catLabel
                text: addRecipeDialog.categoryName
                visible: false
            }
            Button {
                id: catBtn
                text: "Изменить категорию"
                onClicked: {
                    catLabel.visible = false;
                    catBtn.visible = false;
                    catSelector.visible = true;
                }
                visible: false
            }

            TextArea {
                label: "Ингредиенты"
                id: recipeIngredients
            }
            TextArea {
                label: "Описание приготовления"
                id: recipeBody
            }
        }
        onAccepted: Database.addRecipe(recipeName.text, addRecipeDialog.categoryId, recipeIngredients.text, recipeBody.text)
        onOpened: {
            catLabel.visible = false;
            catBtn.visible = false;
            catSelector.visible = true;
            recipeName.text = ""
            recipeIngredients.text = ""
            recipeBody.text = ""
        }
    }

    Component.onCompleted: {
        Database.recipeAdded.connect(function(id) {
            recipesModel.append(Database.fetchRecipe(id));
        })
    }
}
