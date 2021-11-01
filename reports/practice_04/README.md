\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

## Цель

Научиться организовывать многостраничное приложение, использовать контейнеры Silica, вытягиваемые меню и обложку приложения.

## Шаги

1. Создать приложение, которое будет отображать страницу с двумя кнопками “Назад” и “Вперёд”. Первая удалит текущую страницу со стека, вторая добавит новую. Также на экране нужно отображать текущую глубину стека.

    ![](media/example_stack.png)
2. Создать приложение из двух страниц. Первая страница содержит две кнопки “Добавить страницу” и “Убрать страницу”. Первая кнопка добавит вторую страницу как прикреплённую, вторая кнопка её удалит. На второй странице должна быть кнопка для возврата на первую страницу без закрытия второй.

    ![](media/example_append.png)

    ![](media/example_append_2.png)
3. Создать приложение с одной кнопкой и текстовом поле. После нажатия на кнопку отображается диалог для ввода текста. После согласия с результатом введённый текст отображается в текстовое поле.
4. Создать приложение с одной кнопкой и текстовым полем. После нажатия на кнопку отображается диалог для выбора даты. После согласия с результатом ввода выбранная дата отображается в текстовое поле.
5. Создать приложение с одной кнопкой и текстовым полем. После нажатия на кнопку отображается диалог для выбора времени. После согласия с результатом ввода выбранное время отображается в текстовом поле.
6. Создать приложение со списком SilicaListView, из задач на неделю. Задачи должны содержать дату и описание. В списке задачи группировать по датам.

    ![](media/example_list.png)
7. Создать приложение с SilicaWebView для доступа к вашему любимому сайту.
8. Использовать SlideshowView для просмотра и перелистывания задач на неделю. На одном слайде – одна задача.
9.  Создать приложение с вытягиваемыми меню сверху и снизу и текстовым полем. После выбора какого-либо элемента меню, его название отобразить в текстовом поле.
10. Создать приложение со списком и контекстным меню. После выбора элемента контекстного меню отобразить в консоли название выбранного элемента меню и индекс элемента списка.
11. Создать приложение с обложной-счётчиком. На обложке отобразить текущий счёт и две кнопки для добавления единицы к счёту и для сброса счётчика.

    ![](media/example_cover.png)


# Руководство пользователя

1. Для демонстрации шага 2 запустите приложение **06_multipage**. Отобразится первая страница приложения.

   ![](media/multipage_first.png)
2. Нажмите кнопку _Attach page_, чтобы добавить страницу как прикрепленную. Чтобы перейти на прикрепленную страницу, коснитесь белой области справа вверху.

   ![](media/multipage_attached.png)
3. Чтобы вернуться обратно, нажмите _Back_. Чтобы открепить вторую страницу, нажмите _Detach page_.

   ![](media/multipage_second.png)
4. Для демонстрации шага 1 запустите приложение **07_stack**. Отобразится основная страница приложения.

   ![](media/stack_page.png)
5. Нажмите _Push_, чтобы добавить страницу на вершину стека и перейти на нее. Нажмите _Pop_, чтобы удалить страницу с вершины стека и перейти обратно. Число страниц на стеке отображается под кнопками.
6. Для демонстрации шагов 3-5 запустите приложение **08_dialogs**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/dialogs_main_page.png)
7. На странице "Text dialog" по нажатию на кнопку _Open dialog_ откроется экран с предложением ввода в текстовое поле. После ввода и нажатия _Accept_ введенный текст появится в поле на предыдущем экране.

   ![](media/dialogs_text.png)

   ![](media/dialog_text_input.png)
8. На странице "Date dialog" по нажатию на кнопку _Open dialog_ откроется экран с выбором даты в календаре. После выбора и нажатия _Accept_ выбранная дата появится в поле на предыдущем экране.

   ![](media/dialog_date.png)

   ![](media/dialog_date_pick.png)
9. На странице "Time dialog" по нажатию на кнопку _Open dialog_ откроется экран с выбором времени суток. После выбора и нажатия _Accept_ выбранное время отобразится в поле на предыдущем экране.

   ![](media/dialog_time.png)

   ![](media/dialog_time_pick.png)
10. Для демонстрации шагов 6-10 запустите приложение **09_silica**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

    ![](media/silica_main_page.png)
11. На странице _SilicaListView demo_ находится список задач, сгруппированный по датам. Его можно прокручивать.

    ![](media/silica_list.png)
12. На странице _SilicaWebView demo_ открывается веб-сайт.

    ![](media/silica_web_page.png)
13. На странице _SlideshowView demo_ находится слайд-шоу из задач, которое можно прокручивать слева направо и наоборот.

    ![](media/silica_slideshow.png)
14. На странице _SilicaFlickable demo_ находятся два вытягиваемых меню (вверху и внизу страницы).

    ![](media/silica_flickable.png)

    Чтобы открыть, потяните от нижнего или от верхнего края экрана. Выбранный пункт отобразится в текстовом поле.

    ![](media/silica_pull_down_menu.png)
15. На странице _Context menu demo_ находится список элементов, по нажатию на которые открывается контекстное меню. При выборе элемента нажатием он отобразится в отладочной консоли.

    ![](media/silica_context_menu.png)
16. Для демонстрации шага 11 запустите приложение **10_cover**. Отобразится пустая страница.
17. Выйдите на экран просмотра запущенных приложений, чтобы отобразить обложку. По нажатию на левую кнопку будет выполнен сброс счетчика. По нажатию на правую кнопку значение будет увеличено на 1. Можно повторять несколько раз.

    ![](media/cover.png)
    ![](media/cover_incremented.png)


# Руководство программиста

Для выполнения лабораторной работы были использованы следующие компоненты пакета Sailfish SDK, включающего Qt Quick:
* **PageStack** - объект для контроля навигации между страницами с помощью стека, содержит в себе следующие методы и свойства:
  * `pushAttached` – присоединяет страницу к текущей вершине стека
  * `popAttached` – удаляет одну или несколько присоединенных страниц из вершины стека
  * `navigateBack` – переход вниз по стеку
  * `depth` – глубина стека
* Элемент **DatePickerDialog** - диалог для выбора даты 
* Элемент **TimePickerDialog** - диалог для выбора времени 
* Элемент **SilicaListView** (список Silica) со следующими свойствами:
  * `model` – отображаемая модель данных (**ListModel**)
  * `header` – заголовок списка
  * `section` – группа свойств для настройки секции списка
  * `property` – имя свойства модели, содержащее информацию о секции
  * `delegate` – визуальное представление разделителя секции
* Элемент **SilicaWebView** (веб-представление Silica) со следующими свойствами:
  * `url` – адрес веб страницы для загрузки
* Элемент **SlideshowView** (интерактивное слайд-шоу) со следующими свойствами:
  * `model` – отображаемая модель данных (**ListModel**)
  * `itemWidth` – ширина каждого элемента в компоненте
  * `delegate` – визуальное представление элемента списка
* Элементы **PullDownMenu** (вытягиваемое вниз меню), **PullUpMenu** (вытягиваемое вверх меню), **ContextMenu** (контекстное меню), внутри которых расположены **MenuItem** (элемент меню) и **MenuLabel** (название элемента):
* Элемент **CoverBackground** (обложка приложения), внутри которого расположен **CoverActionList** (список действий обложки), состоит из **CoverAction** (кнопка-иконка) со следующими свойствами:
  * `iconSource` – путь до иконки
  * `onTriggered` – функция-обработчик нажатия 


# Приложение

Ниже приведен искодный код страниц приложений на языке QML.

## 06_multipage

### FirstPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10

        Label {
            text: "First page"
        }

        Button {
            text: "Attach page"
            onClicked: pageStack.pushAttached(Qt.resolvedUrl("SecondPage.qml"))
        }
        Button {
            text: "Detach page"
            onClicked: pageStack.popAttached()
        }
    }
}
```

### SecondPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10

        Label {
            text: "Second page"
        }
        Button {
            text: "Back"
            onClicked: pageStack.navigateBack()
        }
    }
}
```

## 07_stack

### StackPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10

        Label {
            text: "Stack"
        }
        Button {
            text: "Pop"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Push"
            onClicked: pageStack.push(Qt.resolvedUrl("StackPage.qml"))
        }
        Label {
            id: counter
            text: "Stack depth: " + pageStack.depth
        }
    }
}
```

## 08_dialogs

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Dialogs"
        }
        Button {
            text: "Text dialog"
            onClicked: pageStack.push(Qt.resolvedUrl("TextDialog.qml"))
        }
        Button {
            text: "Date dialog"
            onClicked: pageStack.push(Qt.resolvedUrl("DateDialog.qml"))
        }
        Button {
            text: "Time dialog"
            onClicked: pageStack.push(Qt.resolvedUrl("TimeDialog.qml"))
        }
    }
}
```

### TextDialog.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Text dialog"
        }
        Button {
            text: "Open dialog"
            onClicked: dialog.open()
        }
        TextField {
            id: outField
        }

        Dialog {
            id: dialog
            Column {
                spacing: 10
                width: page.width
                DialogHeader{}
                TextField {
                    id: inField
                }
            }
            onAccepted: outField.text = inField.text
        }
    }
}
```

### DateDialog.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Date dialog"
        }
        Button {
            text: "Open dialog"
            onClicked: dialog.open()
        }
        TextField {
            id: outField
        }

        DatePickerDialog {
            id: dialog
            onAccepted: outField.text = dateText
        }
    }
}
```

### TimeDialog.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Time dialog"
        }
        Button {
            text: "Open dialog"
            onClicked: dialog.open()
        }
        TextField {
            id: outField
        }

        TimePickerDialog {
            id: dialog
            onAccepted: outField.text = timeText
        }
    }
}
```

## 09_silica

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        width: page.width
        PageHeader {
            title: "Silica components demo"
        }
        Button {
            width: page.width
            text: "SilicaListView demo"
            onClicked: pageStack.push(Qt.resolvedUrl("ListViewDemo.qml"))
        }
        Button {
            width: page.width
            text: "SilicaWebView demo"
            onClicked: pageStack.push(Qt.resolvedUrl("WebViewDemo.qml"))
        }
        Button {
            width: page.width
            text: "SlideshowView demo"
            onClicked: pageStack.push(Qt.resolvedUrl("SlideshowViewDemo.qml"))
        }
        Button {
            width: page.width
            text: "SilicaFlickable demo"
            onClicked: pageStack.push(Qt.resolvedUrl("FlickableDemo.qml"))
        }
        Button {
            width: page.width
            text: "ContextMenu demo"
            onClicked: pageStack.push(Qt.resolvedUrl("ContextMenuDemo.qml"))
        }
    }
}
```

### ListViewDemo.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaListView {
        model: ListModel {
            ListElement { name: "Task 1"; date: "13.10.2021" }
            ListElement { name: "Task 2"; date: "13.10.2021" }
            ListElement { name: "Task 3"; date: "14.10.2021" }
            ListElement { name: "Task 4"; date: "14.10.2021" }
            ListElement { name: "Task 5"; date: "14.10.2021" }
            ListElement { name: "Task 6"; date: "15.10.2021" }
            ListElement { name: "Task 7"; date: "16.10.2021" }
            ListElement { name: "Task 8"; date: "16.10.2021" }
        }

        anchors.fill: parent
        header: PageHeader {
            title: "Task list"
            description: "SilicaListView demo"
        }
        delegate: BackgroundItem {
            Label {
                text: name
            }
        }
        section.property: "date"
        section.delegate: BackgroundItem {
            PageHeader {
                title: section
            }
        }
        VerticalScrollDecorator {}
    }
}
```

### WebViewDemo.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaWebView {
        anchors.fill: parent
        header: PageHeader {
            title: "practice.mvla.ru"
            description: "SilicaWebView demo"
        }
        url: "https://practice.mvla.ru"
        VerticalScrollDecorator {}
    }
}
```

### SlideshowViewDemo.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SlideshowView {
        id: view
        model: ListModel {
            ListElement { name: "Task 1"; date: "13.10.2021" }
            ListElement { name: "Task 2"; date: "13.10.2021" }
            ListElement { name: "Task 3"; date: "14.10.2021" }
            ListElement { name: "Task 4"; date: "14.10.2021" }
            ListElement { name: "Task 5"; date: "14.10.2021" }
            ListElement { name: "Task 6"; date: "15.10.2021" }
            ListElement { name: "Task 7"; date: "16.10.2021" }
            ListElement { name: "Task 8"; date: "16.10.2021" }
        }

        anchors.fill: parent

        delegate: Rectangle {
            width: view.itemWidth
            height: view.height
            Text {
                anchors.centerIn: parent
                text: name + "\n" + date
            }
        }
    }
}
```

### FlickableDemo.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Item 1"
                onClicked: outField.text = text
            }
            MenuItem {
                text: "Item 2"
                onClicked: outField.text = text
            }
        }
        PushUpMenu {
            MenuItem {
                text: "Item 3"
                onClicked: outField.text = text
            }
            MenuItem {
                text: "Item 4"
                onClicked: outField.text = text
            }
        }

        Column {
            spacing: 10
            width: page.width
            PageHeader {
                title: "Pull-down menus"
                description: "SilicaFlickable demo"
            }
            TextField {
                id: outField
            }
        }
    }
}
```

### ContextMenuDemo.qml

```qml
import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: "ContextMenu demo"
        }

        model: ListModel {
            id: listModel
            Component.onCompleted: {
                for (var i = 0; i < 10; i++) {
                    append({"name": "Item " + i})
                }
            }
        }

        delegate: ListItem {
            width: ListView.view.width

            Label {
                id: label
                text: model.name
                anchors.centerIn: parent
            }

            menu: ContextMenu {
                MenuItem {
                    text: "Menu 1"
                    onClicked: console.log(model + " " + text)
                }
                MenuItem {
                    text: "Menu 2"
                    onClicked: console.log(model + " " + text)
                }
            }
        }
    }
}
```

## 10_cover

### CoverPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: cover
    property int counter: 0

    Label {
        anchors.centerIn: parent
        text: counter
    }

    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-cover-cancel"
            onTriggered: cover.counter = 0
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-new"
            onTriggered: cover.counter++
        }
    }
}
```
