\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

## Цель

Освоить базовые навыки построения пользовательских интерфейсов, позиционирования, отрисовки и перемещения элементов. Научиться анимировать элементы. Научиться создавать диалоги и взаимодействовать с ними.

## Шаги

1. Создать новый проект со стандартной заготовкой приложения.
2. Нарисовать 3 квадрата красного, зелёного и синего цветов следующим образом: <br />
   ![](media/rectangles_basic.png)
3. Поместить текст “Квадрат” белого цвета по центру синего квадрата.
4. Нарисовать 5 квадратов с использованием Column и Row следующим образом: <br />
   ![](media/rectangles_table.png)
5. Нарисовать те же 5 квадратов с использованием Grid.
6. Сделать из квадрата “A” прямоугольник “B” с использованием объектов Translate, Scale и Rotation <br />
   ![](media/rectangles_transform.png)
7. Нарисовать квадрат и анимировать его перемещение вниз с увеличением его размера. Документация по анимации доступна по адресу http://doc.qt.io/qt-5/qml-qtquick-animation.html.
8. Реализовать диалог с двумя текстовыми полями, в которые вводятся числа. После нажатия на кнопку “Подтвердить” в консоль выводится сумма чисел. Для преобразования строк к числам использовать функцию parseInt(“42”). Валидацией и обработкой ошибок можно пренебречь. <br />
   ![](media/dialog_example.png)


# Руководство пользователя

1. Для демонстрации шагов 2-7 запустите приложение **03_rectangles**. Отобразится список кнопок. <br />
   ![](media/rectangles_main_page.png)
2. Чтобы перейти к нужному разделу, нажмите соответствующую кнопку. Чтобы вернуться обратно к выбору раздела, коснитесь подсвеченной области экрана слева вверху.  <br />
   ![](media/rectangles_section.png)
3. Для демонстрации шага 8 запустите приложение **04_calculator**. Отобразится главный экран приложения. <br />
   ![](media/calculator_main_page.png)
4. Чтобы открыть диалог для ввода чисел, нажмите на кнопку _Open calculator_. В открывшемся окне введите числа в поля ввода и нажмите _Sum_, чтобы отобразить сумму введенных чисел в консоль. <br />
   ![](media/calculator_dialog.png)

# Руководство программиста

TBD...


# Приложение

Ниже приведен искодный код страниц приложений на языке QML.

## 03_rectangles

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 10
        Button {
            text: "Rectangles Basic"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesBasic.qml"))
        }
        Button {
            text: "Rectangles Table"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesTable.qml"))
        }
        Button {
            text: "Rectangles Grid"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesGrid.qml"))
        }
        Button {
            text: "Rectangles Transform"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesTransform.qml"))
        }
        Button {
            text: "Rectangles Animation"
            width: page.width
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("RectanglesAnimation.qml"))
        }
    }
}
```

### RectanglesBasic.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 250

    Rectangle {
        id: rectRed

        width: page.rectSize
        height: page.rectSize
        color: "red"
    }

    Rectangle {
        id: rectGreen

        width: page.rectSize
        height: page.rectSize
        color: "green"

        anchors.left: rectRed.right
        anchors.top: rectRed.verticalCenter
    }

    Rectangle {
        width: page.rectSize
        height: page.rectSize
        color: "blue"

        anchors.bottom: rectGreen.verticalCenter
        anchors.left: rectGreen.horizontalCenter

        Text {
            text: "Квадрат"
            color: "white"
            font.pixelSize: 50

            anchors.centerIn: parent
        }
    }
}
```

### RectanglesTable.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 200
    property int spacing: 10

    Column {
        spacing: page.spacing
        Row {
            spacing: page.spacing
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "red"
            }
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "green"
            }
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "blue"
            }
        }
        Row {
            spacing: page.spacing
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "pink"
            }
            Item {
                width: page.rectSize
                height: page.rectSize
            }
            Rectangle {
                width: page.rectSize
                height: page.rectSize
                color: "black"
            }
        }
    }
}
```

### RectanglesGrid.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 200
    property int spacing: 10

    Grid {
        spacing: page.spacing
        columns: 3
        rows: 2
        Rectangle {
            width: page.rectSize
            height: page.rectSize
            color: "red"
        }
        Rectangle {
            width: page.rectSize
            height: page.rectSize
            color: "green"
        }
        Rectangle {
            width: page.rectSize
            height: page.rectSize
            color: "blue"
        }
        Rectangle {
            width: page.rectSize
            height: page.rectSize
            color: "pink"
        }
        Item {
            width: page.rectSize
            height: page.rectSize
        }
        Rectangle {
            width: page.rectSize
            height: page.rectSize
            color: "black"
        }
    }
}
```

### RectanglesTransform.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 250

    Rectangle {
        id: rectRed

        width: page.rectSize
        height: page.rectSize
        color: "black"
    }

    Rectangle {
        width: page.rectSize
        height: page.rectSize
        color: "black"
        transform: [
            Scale {
                yScale: 0.5
            },
            Rotation {
                angle: 135
            },
            Translate {
                x: page.rectSize * 2.2
                y: page.rectSize * 0.4
            }
        ]
    }
}
```

### RectanglesAnimation.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int rectSize: 100
    onActiveFocusChanged: anim.restart()

    Rectangle {
        id: rect
        width: page.rectSize
        height: page.rectSize
        color: "red"
        anchors.horizontalCenter: page.horizontalCenter
        ParallelAnimation {
            id: anim
            PropertyAnimation {
                target: rect
                properties: "width"
                from: page.rectSize
                to: page.rectSize * 3
                duration: 1000
            }
            PropertyAnimation {
                target: rect
                properties: "height"
                from: page.rectSize
                to: page.rectSize * 3
                duration: 1000
            }
            PropertyAnimation {
                target: rect
                properties: "y"
                from: 0
                to: 400
                duration: 1000
            }
        }
    }
}
```

## 04_calculator

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    function getSum() {
        return parseInt(number1.text) + parseInt(number2.text);
    }

    Button {
        width: parent.width
        text: "Open calculator"
        onClicked: dialog.open()
    }

    Dialog {
        id: dialog

        function clear() {
            number1.text = "";
            number2.text = "";
        }

        Column {
            width: parent.width

            DialogHeader {}
            TextField {
                id: number1
                placeholderText: "Number 1"
                strictValidation: true
                validator: IntValidator{}
            }
            TextField {
                id: number2
                placeholderText: "Number 2"
                strictValidation: true
                validator: IntValidator{}
            }
            Button {
                text: "Sum"
                width: parent.width
                onClicked: console.log(page.getSum())
            }
        }
        onAccepted: {
            console.log(page.getSum());
            dialog.clear();
        }
        onRejected: dialog.clear()
    }
}
```
