\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

## Цель

Научиться использовать различные модели для отображения данных в прокручиваемых списках, взаимодействовать с базой данных и управлять настройками приложения.

## Шаги

1. Создать приложение, которое позволяет отображать список из прямоугольников с использованием ListModel. В модели должны настраиваться цвет фона и текста внутри прямоугольника. Текст содержит название цвета фона прямоугольника.

   ![](media/example_rectangles.png)
2. Создать приложение, которое позволяет отображать список из прямоугольников. Нажатие на кнопку над списком добавит новый элемент. Нажатие на элемент в списке удалит его из списка. В прямоугольниках должен отображаться порядковый номер, присваиваемый при добавлении в список. При удалении элементов порядковые номера у добавленных прямоугольников  остаются неизменными.

   ![](media/example_list.png)
3. Выполнить задание 1 с использованием javascript-модели.
4. Получить и отобразить курсы валют из ресурса ЦБ РФ по адресу http://www.cbr.ru/scripts/XML_daily.asp.

   ![](media/example_currency.png)
5. Выполнить задание 4 с использованием XMLHttpRequest.
6. Создать приложение, позволяющее добавлять и удалять заметки с использованием базы данных и отображать их в списке. Текстовое поле служит для ввода текста, кнопка для добавления заметки, нажатие на заметку удалит её.

   ![](media/example_notes.png)


# Руководство пользователя

1. Для демонстрации шагов 1-3 запустите приложение **11_models**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/models_main_page.png)
2. На страницах "Colored rectangles" и "Colored rectangles (Alt)" находится список цветных прямоугольников, реализованный с помощью моделей.

   ![](media/colored_rectangles.png)

   ![](media/colored_rectangles_alt.png)
3. На странице "Rectangles list" находится список кнопок-прямоугольников. Для добавления нового нажмите _Add_. Для удаления нажмите на нужный прямоугольник.

   ![](media/rectangles_list.png)
4. Для демонстрации шагов 4, 5 запустите приложение **12_currency**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/currency_main_page.png)
5. На обеих страницах появится список курсов валют разных стран после перехода на них.

   ![](media/currency_list.png)
6. Для демонстрации шага 6 запустите приложение **13_database**. Откроется основное окно приложения.

   ![](media/notes_main_page.png)
7. Для добавления заметки введите ее в поле и нажмите _Add_. Для удаления заметки нажмите на нее. Обратите внимание, что заметки не удаляются после завершения приложения. При следующем запуске будут отображены добавленные ранее записи.

   ![](media/notes_list.png)


# Руководство программиста

Для выполнения лабораторной работы были использованы следующие компоненты пакета Sailfish SDK, включающего Qt Quick:
* **SilicaListView** - компонент со свойствами:
  * `model` - отображаемая модель данных
  * `header` - заголовок списка
  * `delegate: Rectangle` - делегат - визуальное представление элемента списка в виде прямоугольника
* Методы модели данных:
  * `remove(index)` - удаляет элемент из списка модели по индексу
  * `append(dict)` - добавляет новый элемент в конец списка модели
* **XmlListModel** - компонент со свойствми и элементами:
  * `source` - путь к XML-файлу с данными
  * `query` - запрос для создания элементов XmlRole модели
  * **XmlRole**: `name` - имя свойства модели, `query` - запрос для извлечения роли из модели
* **LocalStorage** - компонент для взаимодействия с базой данных при помощи SQL следующими методами:
  * `openDatabaseSync` - открывает соединение с базой данных
  * `transaction` - создает транзакцию чтения/записи (вызывается на объекте, содержащий базу данных)
  * `readTransaction` - создает транзакцию только для чтения
  * `executeSql` - для чтения и изменения базы данных

Реализована вспомогательная JavaScript-функция `loadRate` для загрузки XML-файла с помощью **XMLHttpRequest**.

Также реализованы вспомогательные функция для взаимодействия с БД:
* `insertNote` - добавляет новую заметку в таблицу
* `deleteNote` - удаляет заметку из таблицы
* `fetchNotes` - получение всех заметок таблицы
* `updateNotes` - обновление модели в **SilicaListView** данными из таблицы


# Приложение

Ниже приведен искодный код страниц приложений на языке QML.

## 11_models

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        Button {
            width: page.width
            text: "Colored rectangles"
            onClicked: pageStack.push(Qt.resolvedUrl("ColoredRectangles.qml"))
        }
        Button {
            width: page.width
            text: "Rectangles list"
            onClicked: pageStack.push(Qt.resolvedUrl("RectanglesList.qml"))
        }
        Button {
            width: page.width
            text: "Colored rectangles (JS model)"
            onClicked: pageStack.push(Qt.resolvedUrl("ColoredRectanglesAlt.qml"))
        }
    }
}
```

### ColoredRectangles.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    ListModel {
        id: listModel
        ListElement { text: "White"; bg_color: "white"; text_color: "black" }
        ListElement { text: "Black"; bg_color: "black"; text_color: "white"}
        ListElement { text: "Blue"; bg_color: "blue"; text_color: "red"}
    }
    SilicaListView {
        spacing: 10
        anchors.fill: parent
        header: PageHeader { title: "Colored rectangles" }
        model: listModel
        delegate: Rectangle {
            width: parent.width
            height: 80
            color: model.bg_color
            Text {
                anchors.centerIn: parent
                text: model.text
                color: model.text_color
            }
        }
    }
}
```

### ColoredRectanglesAlt.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property var dataModel: [
        { bg_color: "white", text: "White", text_color: "black" },
        { bg_color: "black", text: "Black", text_color: "white"},
        { bg_color: "blue", text: "Blue", text_color: "red"}
    ]
    SilicaListView {
        spacing: 10
        anchors.fill: parent
        header: PageHeader {
            title: "Colored rectangles"
            description: "Alternative implementation (JS model)"
        }
        model: dataModel
        delegate: Rectangle {
            width: parent.width
            height: 80
            color: modelData.bg_color
            Text {
                anchors.centerIn: parent
                text: modelData.text
                color: modelData.text_color
            }
        }
    }
}
```

### RectanglesList.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int count: 0

    ListModel { id: listModel; }
    Column {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10
        PageHeader {
            title: "Rectangles list"
        }
        Button {
            id: addButton
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add"
            onClicked: listModel.append({text: "Item " + (++count)})
        }
        SilicaListView {
            width: parent.width
            height: parent.height
            model: listModel
            spacing: 10
            delegate: Rectangle {
                SecondaryButton {
                    width: parent.width
                    height: parent.height
                    onClicked: listModel.remove(model.index)
                }
                width: parent.width
                height: 70
                color: "white"
                Text {
                    anchors.centerIn: parent
                    text: model.text
                }
            }
        }
    }
}
```

## 12_currency

### MainPage.qml

```qml
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
```

### CurrencyRate.qml

```qml
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
```

### CurrencyRateAlt.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page

    XmlListModel {
        id: xmlListModel
        query: "/ValCurs/Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
    }
    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: "Currency rate"
            description: "XMLHttpRequest"
        }
        model: xmlListModel
        delegate: Column {
            x: Theme.horizontalPageMargin
            Label { text: Name }
            Label { text: Value }
        }
    }
    Component.onCompleted: {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                xmlListModel.xml = xhr.responseText;
            }
        }
        xhr.open("GET", "https://www.cbr.ru/scripts/XML_daily_eng.asp", true);
        xhr.send();
    }
}
```

## 13_database

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    DataAccessObject { id: dao }
    ListModel { id: notesListModel }
    Column {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 10
        TextField {
            id: field
            placeholderText: "Enter note here..."
        }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Add"
            onClicked: {
                if (!field.text)
                    return;
                dao.insertNote(field.text);
                updateNotes();
            }
        }
        SilicaListView {
            width: parent.width
            height: parent.height
            model: notesListModel
            spacing: 15
            delegate: Button {
                width: parent.width
                onClicked: { dao.deleteNote(model.id); updateNotes(); }
                text: model.name
                height: 80
            }
        }
    }

    function updateNotes() {
        notesListModel.clear();
        dao.fetchNotes(function(notes) {
            for (var i = 0; i < notes.length; i++) {
                var note = notes.item(i);
                notesListModel.append({id: note.id, name: note.name});
            }
        });
    }

    Component.onCompleted: updateNotes()
}
```

### DataAccessObject.qml

```qml
import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {
    property var database

    Component.onCompleted: {
        database = LocalStorage.openDatabaseSync("notes", "1.0");
        database.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)");
        });
    }

    function insertNote(name) {
        database.transaction(function(tx) {
           var result = tx.executeSql("INSERT INTO notes(name) VALUES(?)", [name]);
        });
    }

    function deleteNote(id) {
        database.transaction(function (tx) {
            tx.executeSql("DELETE FROM notes WHERE id = ?", [id]);
        });
    }

    function fetchNotes(callback) {
        database.readTransaction(function(tx) {
            var result = tx.executeSql("SELECT * FROM notes");
            callback(result.rows);
        });
    }
}
```
