\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

Разработать и реализовать приложение, позволяющее управлять списком рецептов с возможностью их добавления, просмотра, а также поиска по названию, категории и ингредиенту.


# Руководство пользователя

1. Запустите приложение **18_cookbook**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/main.png)
2. В разделе "Рецепты" отображается прокручиваемый список добавленных рецептов. По долгому нажатию на название открывается меню, с помощью которого можно открыть рецепт или удалить его.
   
   ![](media/recipes.png)
   ![](media/recipe_menu.png)
   ![](media/recipe.png)
3. Чтобы добавить рецепт, нужно открыть вытягиваемое меню сверху и нажать "Добавить рецепт". Откроется страница добавления, на которой нужно заполнить все поля, выбрать категорию в прокручиваемом списке кнопок и нажать "Принять".
   
   ![](media/add_recipe.png)
4. На странице "Поиск" находится поле ввода, с помощью которого можно искать рецепты по названию. Поисковая выдача будет обновляться по мере того, как пользователь вводит текст.
   
   ![](media/search.png)
5. В разделе "Категории" находится список добавленных категорий рецептов. По долгому нажатию на название открывается меню, с помощью которого можно открыть рецепты из выбранной категории или удалить ее. Чтобы добавить категорию, нужно воспользоваться вытягиваемым меню аналогично тому, как это реализовано в разделе "Рецепты".
   
   ![](media/categories.png)
   ![](media/category_menu.png)
   ![](media/recipes_by_category.png)
6. В разделе "Ингредиенты" находится список ингредиентов из всех рецептов, имеющихся в базе данных. Ингредиенты автоматически добавляются и удаляются по мере добавления и удаления рецептов. Можно также посмотреть список рецептов, требующих определенный ингредиент.
   
   ![](media/ingredients.png)
7. На странице "Настройки" находится кнопка, с помощью которой можно очистить базу данных. При этом удалятся все рецепты, категории и ингредиенты.


# Руководство программиста

Для выполнения лабораторной работы были использованы следующие компоненты пакета Sailfish SDK, включающего Qt Quick:

* Элемент **Column** (компонент для размещения элементов в столбец)
  * `spacing` – отступ между столбцами
* Элемент **Label** (текстовый ярлык) со свойствами:
  * `id` – идентификатор элемента на странице
  * `text` – текст ярлыка
  * `width` – ширина элемента
  * `font.pixelSize` – размер шрифта 
  * `horizontalAlignment` – тип горизонтального выравнивания
* Элемент **Button** (кнопка) со свойствами:
  * `x` – смещение объекта по оси X
  * `text` – текст на кнопке
  * `onClicked` – обработчик события при нажатии на кнопку
  * `onPressAndHold` – обработчик события при зажатой кнопке
* Элемент **Text** (текстовая метка) со свойствами:
  * `text` – значение текстовой метки
  * `color` – цвет текста
  * `anchors.centerIn` – привязка блока по центру
  * `font.pixelSize` – размер текста в пикселях
* Элемент **Dialog** (предназначен для ввода данных пользователем) со свойствами:
  * `onAccepted` – обработчик нажатия на кнопку подтверждения
* Элемент **DialogHeader** – заголовок для диалога
* Элемент **TextField** (текстовое поле ввода) со свойствами:
  * `id` - идентификатор
  * `placeholderText` - замещающий текст
  * `label` – заголовок поля ввода
* **PageStack** - объект для контроля навигации между страницами с помощью стека, содержит в себе следующие методы и свойства:
  * `push` – присоединяет страницу к текущей вершине стека
* Элемент **SilicaListView** (список Silica) со следующими свойствами:
  * `model` – отображаемая модель данных (**ListModel**)
  * `header` – заголовок списка
  * `delegate` – визуальное представление разделителя секции
* Элементы **PullDownMenu** (вытягиваемое вниз меню), **PullUpMenu** (вытягиваемое вверх меню), **ContextMenu** (контекстное меню), внутри которых расположены **MenuItem** (элемент меню) и **MenuLabel** (название элемента)

Также были использованы следующие классы и возможности библиотеки Qt.

* **QObject** - базовый класс всех мета-объектов Qt. Наследники могут использовать следующие макросы:
* Макрос `Q_OBJECT` используется для включения возможностей мета-объектов, таких как динамические свойства, сигналы и слоты;
* Макрос `Q_INVOKABLE` – макрос к объявлению метода класса, чтобы их можно было вызвать через систему мета-объектов

Для взаимодействия мета-объектов между собой используется механизм Qt на основе сигналов-слотов:
* `slots` – содержит в себе функции, которые реагируют на различные сигналы (события)
* `signals` – функции-события, срабатывание которых может вызывать слоты.

Система мета-объектов:
* `qmlRegisterType()` - функция для регистрации типа C++ в системе QML
* `qmlRegisterSingletonType()` - функция для регистрации типа C++ в системе QML как синглтон (единый объект для всех клиентов)

Кроме того, с помощью описанных выше возможностей был реализован класс для работы с данными приложения:

```cpp
class Database : public QObject {
    Q_OBJECT

protected:
    QSqlDatabase m_handle;

    void initializeTables();
    int findOrInsertIngredient(const QString &name);
    bool attachIngredientToRecipe(int recipeId, int ingredientId, const QString &amount);
    std::unordered_map<int, QString> fetchCategoriesAsMap();
    QString fetchCategoryName(int id);
    std::unordered_map<int, QString> fetchIngredientsAsMap();
    QVariantList fetchIngredientsForRecipe(int recipeId);
    QVariantList unpackRecipes(QSqlQuery &query);

public:
    explicit Database(QObject *parent = nullptr);
    ~Database() = default;

    Q_INVOKABLE int addRecipe(const QString &name, int categoryId, const QString &ingredientsRaw, const QString &body);
    Q_INVOKABLE int addCategory(const QString &name);
    Q_INVOKABLE QVariantList fetchRecipes();
    Q_INVOKABLE QVariantList fetchRecipesByCategory(int categoryId);
    Q_INVOKABLE QVariantList fetchRecipesByIngredient(int ingredientId);
    Q_INVOKABLE QVariantList fetchRecipesByQuery(const QString &searchQuery);
    Q_INVOKABLE QVariantList fetchCategories();
    Q_INVOKABLE QVariantList fetchIngredients();
    Q_INVOKABLE QVariantMap fetchRecipe(int id);
    Q_INVOKABLE QVariantMap fetchRecipeSnippet(int id);
    Q_INVOKABLE QVariantMap fetchCategory(int id);
    Q_INVOKABLE QVariantMap fetchIngredient(int id);
    Q_INVOKABLE void dropDatabase();
    Q_INVOKABLE bool deleteRecipe(int id);
    Q_INVOKABLE bool deleteCategory(int id);

signals:
    void recipeAdded(int recipeId);
    void categoryAdded(int categoryId);
};
```

Полагаем, что все методы, поля и аргументы функций являются самодокументирующими за счет своих названий и приведенного выше описания. Реализация описана в приложении.


# Приложение

Ниже приведен исходный код страниц приложения на языке QML и классов на языке С++.

_**Примечание.** Весь код также доступен в [репозитории GitHub](https://github.com/vla5924-practice/mobile-systems)._


## Main.qml

```qml
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
```

## Recipes.qml

```qml
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
```

## Recipe.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0
import cookbook.Database 1.0

Page {
    property int recipeId

    id: page

    Column {
        anchors.fill: parent
        PageHeader {
            id: header
            title: ""
        }
        Text {
            id: recipeIngredients
            text: ""
            color: Theme.primaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Text {
            id: recipeBody
            text: ""
            color: Theme.primaryColor
            font.pixelSize: Theme.fontSizeSmall
        }
        Component.onCompleted: {
            var recipe = Database.fetchRecipe(page.recipeId);
            header.title = recipe.name;
            header.description = recipe.category_name;
            recipeBody.text = recipe.body;
            var ingredientsRaw = "<ul>"
            recipe.ingredients.forEach(function(item) {
                ingredientsRaw += "<li>" + item.name + " - " + item.amount + "</li>\n";
            });
            ingredientsRaw += "</ul>"
            recipeIngredients.text = ingredientsRaw;
        }
    }
}
```

## Categories.qml

```qml
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
```

## Ingredients.qml

```qml
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
```

## Search.qml

```qml
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
```

## Settings.qml

```qml
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
```

## CoverPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        text: "Книга рецептов"
    }
}
```

## 18_cookbook.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    initialPage: Component { Main { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
```

## database.hpp

```cpp
#ifndef DATABASE_HPP
#define DATABASE_HPP

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>
#include <unordered_map>

class Database : public QObject {
    Q_OBJECT

protected:
    QSqlDatabase m_handle;

    void initializeTables();
    int findOrInsertIngredient(const QString &name);
    bool attachIngredientToRecipe(int recipeId, int ingredientId, const QString &amount);
    std::unordered_map<int, QString> fetchCategoriesAsMap();
    QString fetchCategoryName(int id);
    std::unordered_map<int, QString> fetchIngredientsAsMap();
    QVariantList fetchIngredientsForRecipe(int recipeId);
    QVariantList unpackRecipes(QSqlQuery &query);

public:
    explicit Database(QObject *parent = nullptr);
    ~Database() = default;

    Q_INVOKABLE int addRecipe(const QString &name, int categoryId, const QString &ingredientsRaw, const QString &body);
    Q_INVOKABLE int addCategory(const QString &name);
    Q_INVOKABLE QVariantList fetchRecipes();
    Q_INVOKABLE QVariantList fetchRecipesByCategory(int categoryId);
    Q_INVOKABLE QVariantList fetchRecipesByIngredient(int ingredientId);
    Q_INVOKABLE QVariantList fetchRecipesByQuery(const QString &searchQuery);
    Q_INVOKABLE QVariantList fetchCategories();
    Q_INVOKABLE QVariantList fetchIngredients();
    Q_INVOKABLE QVariantMap fetchRecipe(int id);
    Q_INVOKABLE QVariantMap fetchRecipeSnippet(int id);
    Q_INVOKABLE QVariantMap fetchCategory(int id);
    Q_INVOKABLE QVariantMap fetchIngredient(int id);
    Q_INVOKABLE void dropDatabase();
    Q_INVOKABLE bool deleteRecipe(int id);
    Q_INVOKABLE bool deleteCategory(int id);

signals:
    void recipeAdded(int recipeId);
    void categoryAdded(int categoryId);
};

#endif // DATABASE_HPP
```

## database.cpp

```cpp
#include "database.hpp"

#include <QSqlQuery>
#include <QVariant>
#include <QString>
#include <QVector>
#include <QStringRef>
#include <QSqlError>

Database::Database(QObject *parent) :QObject(parent) {
    m_handle = QSqlDatabase::addDatabase("QSQLITE", "db");
    m_handle.setDatabaseName("cookbook");
    m_handle.open();
    initializeTables();
}

int Database::addRecipe(const QString &name, int categoryId, const QString &ingredientsRaw, const QString &body) {
    QSqlQuery query(m_handle);
    query.prepare("INSERT INTO recipes(category_id, name, body) VALUES(?, ?, ?)");
    query.addBindValue(categoryId);
    query.addBindValue(name);
    query.addBindValue(body);
    query.exec();
    int recipeId = query.lastInsertId().toInt();
    auto ingredients = ingredientsRaw.splitRef(',');
    for (const auto &item : ingredients) {
        auto parts = item.split('-');
        auto ingredient = parts[0].trimmed();
        auto amount = parts[1].trimmed();
        int ingredientId = findOrInsertIngredient(ingredient.toString());
        attachIngredientToRecipe(recipeId, ingredientId, amount.toString());
    }
    emit recipeAdded(recipeId);
    return recipeId;
}

int Database::findOrInsertIngredient(const QString &name) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id FROM ingredients WHERE name = ?");
    query.addBindValue(name);
    query.exec();
    while (query.next()) {
        int id = query.value(0).toInt();
        return id;
    }
    query.prepare("INSERT INTO ingredients(name) VALUES(?)");
    query.addBindValue(name);
    query.exec();
    return query.lastInsertId().toInt();
}

bool Database::attachIngredientToRecipe(int recipeId, int ingredientId, const QString &amount) {
    QSqlQuery query(m_handle);
    query.prepare("INSERT INTO ingredients_recipes(ingredient_id, recipe_id, amount) VALUES(?, ?, ?)");
    query.addBindValue(ingredientId);
    query.addBindValue(recipeId);
    query.addBindValue(amount);
    return query.exec();
}

int Database::addCategory(const QString &name) {
    QSqlQuery query(m_handle);
    query.prepare("INSERT INTO categories(name) VALUES(?)");
    query.addBindValue(name);
    query.exec();
    int categoryId = query.lastInsertId().toInt();
    emit categoryAdded(categoryId);
    return categoryId;
}

std::unordered_map<int, QString> Database::fetchCategoriesAsMap() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM categories");
    std::unordered_map<int, QString> categories = {{0, "<uncategorized>"}};
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        categories.insert({id, name});
    }
    return categories;
}

std::unordered_map<int, QString> Database::fetchIngredientsAsMap() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM ingredients");
    std::unordered_map<int, QString> ingredients;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        ingredients.insert({id, name});
    }
    return ingredients;
}

QVariantList Database::unpackRecipes(QSqlQuery &query) {
    auto categories = fetchCategoriesAsMap();
    QVariantList recipes;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        int categoryId = query.value(2).toInt();
        QVariantMap recipe;
        recipe.insert("id", id);
        recipe.insert("name", name);
        recipe.insert("category_id", categoryId);
        recipe.insert("category_name", categories[categoryId]);
        recipes.append(recipe);
    }
    return recipes;
}

QVariantList Database::fetchRecipes() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name, category_id FROM recipes ORDER BY name ASC");
    return unpackRecipes(query);
}

QVariantList Database::fetchRecipesByCategory(int categoryId) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, category_id FROM recipes WHERE category_id = ? ORDER BY name ASC");
    query.addBindValue(categoryId);
    query.exec();
    return unpackRecipes(query);
}

QVariantList Database::fetchRecipesByIngredient(int ingredientId) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT recipe_id FROM ingredients_recipes WHERE ingredient_id = ?");
    query.addBindValue(ingredientId);
    query.exec();
    QVariantList recipes;
    while (query.next()) {
        int recipeId = query.value(0).toInt();
        recipes.append(fetchRecipeSnippet(recipeId));
    }
    return recipes;
}

QVariantList Database::fetchCategories() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM categories ORDER BY name ASC");
    QVariantList categories;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        QVariantMap category;
        category.insert("id", id);
        category.insert("name", name);
        categories.append(category);
    }
    return categories;
}

QVariantList Database::fetchIngredients() {
    QSqlQuery query(m_handle);
    query.exec("SELECT id, name FROM ingredients ORDER BY name ASC");
    QVariantList ingredients;
    while (query.next()) {
        int id = query.value(0).toInt();
        QSqlQuery subQuery(m_handle);
        subQuery.prepare("SELECT COUNT(*) FROM ingredients_recipes WHERE ingredient_id = ?");
        subQuery.addBindValue(id);
        subQuery.exec();
        if (subQuery.next()) {
            int count = query.value(0).toInt();
            if (count < 1) {
                QSqlQuery subSubQuery(m_handle);
                subSubQuery.prepare("DELETE FROM ingredients WHERE id = ?");
                subSubQuery.addBindValue(id);
                subSubQuery.exec();
                break;
            }
        }
        QString name = query.value(1).toString();
        QVariantMap ingredient;
        ingredient.insert("id", id);
        ingredient.insert("name", name);
        ingredients.append(ingredient);
    }
    return ingredients;
}

QVariantMap Database::fetchRecipe(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, body, category_id FROM recipes WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap recipe;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        QString body = query.value(2).toString();
        int categoryId = query.value(3).toInt();
        recipe.insert("name", name);
        recipe.insert("body", body);
        recipe.insert("ingredients", fetchIngredientsForRecipe(id));
        recipe.insert("category_id", categoryId);
        recipe.insert("category_name", fetchCategoryName(categoryId));
    }
    return recipe;
}

QString Database::fetchCategoryName(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT name FROM categories WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    while (query.next()) {
        QString name = query.value(0).toString();
        return name;
    }
    return "<uncategorized>";
}

QVariantList Database::fetchIngredientsForRecipe(int recipeId) {
    auto allIngredients = fetchIngredientsAsMap();
    QSqlQuery query(m_handle);
    query.prepare("SELECT ingredient_id, amount FROM ingredients_recipes WHERE recipe_id = ?");
    query.addBindValue(recipeId);
    query.exec();
    QVariantList ingredients;
    while (query.next()) {
        int ingredientId = query.value(0).toInt();
        QString amount = query.value(1).toString();
        QVariantMap ingredient;
        ingredient.insert("name", allIngredients[ingredientId]);
        ingredient.insert("amount", amount);
        ingredients.append(ingredient);
    }
    return ingredients;
}

QVariantMap Database::fetchRecipeSnippet(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, category_id FROM recipes WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap recipe;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        int categoryId = query.value(2).toInt();
        recipe.insert("id", id);
        recipe.insert("name", name);
        recipe.insert("category_id", categoryId);
        recipe.insert("category_name", fetchCategoryName(categoryId));
    }
    return recipe;
}

QVariantMap Database::fetchCategory(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name FROM categories WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap category;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        category.insert("id", id);
        category.insert("name", name);
    }
    return category;
}

QVariantMap Database::fetchIngredient(int id) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name FROM ingredients WHERE id = ?");
    query.addBindValue(id);
    query.exec();
    QVariantMap ingredient;
    while (query.next()) {
        int id = query.value(0).toInt();
        QString name = query.value(1).toString();
        ingredient.insert("id", id);
        ingredient.insert("name", name);
    }
    return ingredient;
}

void Database::dropDatabase() {
    QSqlQuery query(m_handle);
    query.exec("DROP TABLE recipes");
    query.exec("DROP TABLE categories");
    query.exec("DROP TABLE ingredients");
    query.exec("DROP TABLE ingredients_recipes");
    initializeTables();
}

void Database::initializeTables() {
    QSqlQuery query(m_handle);
    query.exec("CREATE TABLE IF NOT EXISTS recipes(id INTEGER PRIMARY KEY AUTOINCREMENT, category_id INTEGER NOT NULL, name VARCHAR(100) NOT NULL, body TEXT NOT NULL)");
    query.exec("CREATE TABLE IF NOT EXISTS categories(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100) NOT NULL)");
    query.exec("CREATE TABLE IF NOT EXISTS ingredients(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(100) NOT NULL)");
    query.exec("CREATE TABLE IF NOT EXISTS ingredients_recipes(ingredient_id INTEGER NOT NULL, recipe_id INTEGER NOT NULL, amount VARCHAR(100) NOT NULL)");
}

bool Database::deleteRecipe(int id) {
    bool ok = true;
    QSqlQuery query(m_handle);
    query.prepare("DELETE FROM recipes WHERE id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    query.prepare("DELETE FROM ingredients_recipes WHERE recipe_id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    return ok;
}

bool Database::deleteCategory(int id) {
    bool ok = true;
    QSqlQuery query(m_handle);
    query.prepare("DELETE FROM categories WHERE id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    query.prepare("UPDATE recipes SET category_id = 0 WHERE category_id = ?");
    query.addBindValue(id);
    ok &= query.exec();
    return ok;
}

QVariantList Database::fetchRecipesByQuery(const QString &searchQuery) {
    QSqlQuery query(m_handle);
    query.prepare("SELECT id, name, category_id FROM recipes WHERE name LIKE ? ORDER BY name ASC");
    query.addBindValue("%" + searchQuery + "%");
    query.exec();
    return unpackRecipes(query);
}
```

## 18_cookbook.cpp

```cpp
#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>

#include "database.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();
    view->setSource(SailfishApp::pathTo("qml/18_cookbook.qml"));
    qmlRegisterSingletonType<Database>("cookbook.Database", 1, 0, "Database", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)

        Database *instance = new Database;
        return instance;
    });
    view->showFullScreen();
    return app->exec();
}
```
