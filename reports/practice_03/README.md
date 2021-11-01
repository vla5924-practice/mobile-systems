\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

## Цель

Научиться применять типовые элементы интерфейса Sailfish OS.

## Шаги

1. Создать текстовое поле для ввода числа с заголовком и подсказкой
2. Создать кнопку, которая будет сохранять визуально нажатое состояние, после того, как пользователь нажал на неё один раз
3. Создать кнопку и поле с текстом. Поле с текстом должно отображать нажата ли кнопка или нет выводом текста “Нажата” или “Отпущена”

   ![](media/example_button_pressed.png)

   ![](media/example_button_released.png)
4. Создать кнопку со значением, которая будет отображать количество нажатий на неё

   ![](media/example_button_counter.png)
5. Создать селектор даты, который будет отображать выбранную дату в консоли
6. Создать селектор времени, который будет отображать выбранное время в консоли
7. Создать поле с выпадающим списком, позволяющее выбрать строку из списка. Результат выбора отобразить в консоли
8. Создать переключатель с текстом, в тексте отобразить состояние переключателя “Включен” или “Выключен”
9.  Создать ползунок и поле с текстом. Поле с текстом должно отображать текущее значение ползунка

    ![](media/example_button_slider.png)


## Руководство пользователя

1. Запустите приложение **05_components**. Отобразится список кнопок.

   ![](media/main_page.png)
2. Для демонстрации шагов нажмите соответствующую кнопку. Чтобы вернуться обратно к выбору раздела, коснитесь подсвеченной области экрана слева вверху. На рисунке ниже показана демонстрация шагов 2-4.

   ![](media/buttons.png)
3. Демонстрация шагов 2-4 открывается по нажатию на кнопку "Buttons". Демонстрация шагов 5-6 открывается по нажатию на кнопку "Date & Time Pickers". Демонстрация шага 9 открывается по нажатию на кнопку "Sliders". Демонстрация шагов 1, 7-8 открывается по нажатию на кнопку "Miscellaneous".


# Руководство программиста

TBD...


# Приложение

Ниже приведен исходный код приложения на языке QML.

## MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        Button {
            text: "Buttons"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Buttons.qml"))
        }
        Button {
            text: "Date & Time Pickers"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("DateTime.qml"))
        }
        Button {
            text: "Sliders"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Sliders.qml"))
        }
        Button {
            text: "Miscellaneous"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("Misc.qml"))
        }
    }
}
```

## Buttons.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        Button {
            width: page.width
            text: "Button"
            onClicked: down = true
        }
        Button {
            width: page.width
            text: "Released"
            onPressed: text = "Clicked"
            onReleased: text = "Released"
        }
        ValueButton {
            width: page.width
            property int i: 0
            label: "Counter"
            onClicked: i++
            value: i
        }
    }
}
```

## DateTime.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        DatePicker {
            date: new Date()
            monthYearVisible: true
            onDateChanged: console.log(date)
        }
        TimePicker {
            width: page.width
            hour: 0
            minute: 0
            onTimeChanged: console.log(hour + ":" + minute)
        }
    }
}
```

## Sliders.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        Slider {
            width: page.width
            id: slider
            minimumValue: 0
            maximumValue: 100
            value: 0
            stepSize: 0.1
        }
        Label {
            width: page.width
            text: slider.value
        }
    }
}
```

## Misc.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        TextField {
            width: page.width
            label: "Text field label"
            placeholderText: "This is placeholder text"
            inputMethodHints: Qt.ImhDigitsOnly
        }
        ComboBox {
            width: page.width
            label: "List"
            menu: ContextMenu {
                MenuItem { text: "One" }
                MenuItem { text: "Two" }
                MenuItem { text: "Three" }
            }
            onCurrentIndexChanged: console.log(currentItem)
        }
        TextSwitch {
            id: s
            width: page.width
            text: "Disabled"
            onCheckedChanged: text = (checked ? "Enabled" : "Disabled")
        }
    }
}
```
