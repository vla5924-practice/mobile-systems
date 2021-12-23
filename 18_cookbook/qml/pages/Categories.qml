import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    id: page

    SilicaListView {
        id: categoriesList
        spacing: 10
        anchors.fill: parent
        header: PageHeader {
            title: "Категории"
        }
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
            Label {
                text: model.name
                anchors.centerIn: parent
            }
            function remove() {
                ListView.view.model.remove(index);
            }
            menu: ContextMenu {
                MenuItem {
                    text: "Показать рецепты"
                    onClicked: pageStack.animatorPush(Qt.resolvedUrl("Recipes.qml"), {"byCategory": model.id})
                }
                MenuItem {
                    text: "Удалить категорию"
                    onClicked: {
                        if (Database.deleteCategory(model.id)) {
                            remove();
                        }
                    }
                }
            }
        }
        PullDownMenu {
            MenuItem {
                text: "Добавить категорию"
                onClicked: addCategoryDialog.open()
            }
        }
    }

    Dialog {
        id: addCategoryDialog
        Column {
            spacing: 10
            width: page.width
            DialogHeader {
                title: "Добавление категории"
            }
            TextField {
                id: categoryName
            }
        }
        onAccepted: Database.addCategory(categoryName.text)
        onOpened: categoryName.text = ""
    }

    Component.onCompleted: {
        Database.categoryAdded.connect(function(id) {
            categoriesModel.append(Database.fetchCategory(id));
        })
    }
}
