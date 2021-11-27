\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

## Цель

Научиться создавать пользовательский интерфейс конфигурируемый состояниями, реализовывать анимированные переходы при смене состояний и создавать собственные QML компоненты.

## Шаги

1. Создать приложение, отображающее светофор. На экране должно присутствовать 3 разноцветных сигнала, которые загораются и гаснут в том же порядке, что и сигналы светофора. Сделать автоматическую смену состояний.

   ![](example_traffic_lights.png)
2. Доработать задание 1 так, чтобы во время зеленого сигнала светофора из одного конца экрана в другой плавно двигалась иконка человечка.
3. Создать приложение, отображающее строку текста вверху экрана. При нажатии на текст он должен плавно перемещаться вниз экрана, поворачивать на 180 градусов и менять цвет. Когда нажатие прекращается, он должен так же плавно возвращаться в исходное положение.

   ![](media/example_text.png)
4. Выделить сигналы светофора из задания 1 в отдельный компонент и использовать его.
5. Создать QML компонент со свойством по умолчанию, который берет значение свойства text любого объявленного внутри него объекта и создает Button с тем же текстом. Добавить возможность задавать цвет кнопки при объявлении компонента.
6. Создать приложение-секундомер. На экране должны отображаться значения часов, минут и секунд. Секундомер запускается по сигналу кнопки, при повторном нажатии секундомер останавливается. Для отображения часов, минут и секунд использовать собственные QML компоненты.
7. Добавить обработчик сигналов PageStack, подсчитывающий количество добавленных и удаленных страниц в PageStack.


# Руководство пользователя

1. Для демонстрации шагов 1-3 запустите приложение **14_states**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/states_main_page.png)
2. При переходе на страницу "Traffic light" отобрзаится светофор, который будет менять цвета. При появлении зеленого вета внизу будет плавно двигаться человечек.

   ![](media/states_traffic_lights.png)
3. При переходе на страницу "Animated text" отобразится синий текст. При нажатии на него он изменит цвет, развернется и начнет двигаться вниз.

   ![](media/states_text.png)
4. Для демонстрации шагов 4-6 запустите приложение **15_custom**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/custom_main_page.png)
5. На странице "Traffic light component" расположен компонент светофора, который меняет цвета.

   ![](media/custom_traffic_lights.png)
6. На странице "Custom button" расположена кнопка.

   ![](media/custom_button.png)
7. На странице "Stopwatch demo" расположен секундомер. Нажаите на кнопку _Start_ запустит его. Нажатие на кнопку _Stop_ становит.

   ![](media/custom_stopwatch.png)
8. Для демонстрации шага 7 запустите приложение **16_sighandler**. При нажатии на кнопки _Push_ и _Pop_ будет вызван обработчик изменения глубины стека, результат выводится в отладочной консоли.

   ![](media/sighandler_page.png)


# Руководство программиста

Для выполнения лабораторной работы были использованы следующие компоненты пакета Sailfish SDK, включающего Qt Quick:
* **State** - элемент, содержащий описания состояний объекта и условий перехода между ними со следующими свойствами и компонентами:
  * `changes` - содержит список изменений значений свойств по отношению к начальному состоянию.
  * `extend` - хранит имя состояния, от которого идет наследование списка изменений.
  * `name` - название состояния.
  * `when` - определяет условие, при котором состояние будет активно.
  * **StateChangeScript** - выполнение кода
  * **PropertyChanges** - изменение свойства
    * `target` - ссылается на объект, к которому будут применяться изменения значений
    * `restoreEntryValues` - определяет, будут ли востановлены прежние значения свойств при выходе из состояния
* **Transition** - задает контекст перехода между состояниями:
    * `from` - определяет, при выходе из какого состояние произойдет переход.
    * `to` - определяет, при переходе в какое состояние будет произведен переход
  * **SequentialAnimation** - позволяет запускать несколько анимаций друг за другом
  * **ParallelAnimation** - позволяет запускать несколько анимаций параллельно
  * **PropertyAnimation** - задает плавную анимацию изменения свойства
* **Item** - базовый компонент для создания визуальных блоков

Создание пользовательских свойств: `[default] property <type> <name>[: defaultValue]`

Определение свойства с ключевым словом default делает его свойство по-умолчанию: `default property var SomeText` 

Добавление обработчика сигналов к компонентам: `<objectid>.<signalName>.connect(<handlerFunctionName>)` 



# Приложение

Ниже приведен искодный код страниц приложений на языке QML.

## 14_states

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
            text: "Traffic light"
            onClicked: pageStack.push(Qt.resolvedUrl("TrafficLight.qml"))
        }
        Button {
            width: page.width
            text: "Animated text"
            onClicked: pageStack.push(Qt.resolvedUrl("AnimatedText.qml"))
        }
    }
}
```

### AnimatedText.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Text {
        anchors.horizontalCenter: page.horizontalCenter
        id: t
        text: "Hello, world!"
        font.pixelSize: 80
        color: "blue"
        state: "default"

        MouseArea {
            anchors.fill: parent
            onPressed: parent.state = "anim"
            onReleased: parent.state = "default"
        }

        states: [
            State {
                name: "default"
            },
            State {
                name: "anim"
                PropertyChanges {
                    target: t
                    color: "green"
                    rotation: 180
                }
            }
        ]
        transitions: [
            Transition {
                from: "default"
                to: "anim"
                ParallelAnimation {
                    PropertyAnimation {
                        target: t
                        property: "y"
                        to: page.height
                        duration: 2000
                    }
                }
            },
            Transition {
                from: "anim"
                to: "default"
                ParallelAnimation {
                    PropertyAnimation {
                        target: t
                        property: "y"
                        to: 0
                        duration: 2000
                    }
                }
            }
        ]
    }
}
```

### TrafficLight.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Component.onCompleted: anim.restart()

    Column {
        id: light
        spacing: 20
        anchors.centerIn: page
        property int counter: 0

        SequentialAnimation {
            id: anim
            loops: Animation.Infinite
            PropertyAnimation {
                target: light
                properties: "counter"
                from: 0
                to: 9
                duration: 9000
            }
        }

        state: "default"

        states: [
            State {
              name: "default"
            },
            State {
                name: "red"
                when: light.counter >= 0 && light.counter < 3
                PropertyChanges {
                    target: red
                    color: "red"
                }
            },

            State {
                name: "yellow"
                when: light.counter >= 3 && light.counter < 6
                PropertyChanges {
                    target: yellow
                    color: "yellow"
                }
            },

            State {
                name: "green"
                when: light.counter >= 6 && light.counter < 9
                PropertyChanges {
                    target: green
                    color: "green"
                }
            }

        ]

        transitions: [
            Transition {
                from: "yellow"
                to: "green"
                PropertyAnimation {
                    target: chelovechek
                    property: "x"
                    from: -chelovechek.width
                    to: page.width
                    duration: 2900
                }
            }
        ]

        Rectangle {
            id: red
            color: "black"
            width: 100
            height: 100
            radius: 180
        }

        Rectangle {
            id: yellow
            color: "black"
            width: 100
            height: 100
            radius: 180
        }

        Rectangle {
            id: green
            color: "black"
            width: 100
            height: 100
            radius: 180
        }
    }

    Icon {
        id: chelovechek
        x: -width
        y: page.height - height
        source: "image://theme/icon-m-person"
    }

}
```

## 15_custom

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
            text: "Traffic light component"
            onClicked: pageStack.push(Qt.resolvedUrl("TrafficLightPage.qml"))
        }
        Button {
            width: page.width
            text: "Custom button component"
            onClicked: pageStack.push(Qt.resolvedUrl("CustomButtonPage.qml"))
        }
        Button {
            width: page.width
            text: "Stopwatch demo"
            onClicked: pageStack.push(Qt.resolvedUrl("StopwatchPage.qml"))
        }
    }
}
```

### CustomButton.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    default property var item
    property var color
    Button {
        text: parent.item.text
        color: parent.color
    }
}
```

### CustomButtonPage.qml

```qmlimport QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    CustomButton {
        Text {
            text: "Text goes here..."
        }
        color: "green"
    }

}
```

### StopwatchPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int timer: 0

    ParallelAnimation {
        id: anim
        loops: Animation.Infinite
        PropertyAnimation {
            target: s
            property: "value"
            from: 0
            to: 59
            duration: 60000
        }

        PropertyAnimation {
            target: m
            property: "value"
            from: 0
            to: 59
            duration: 3600000
        }

        PropertyAnimation {
            target: h
            property: "value"
            from: 0
            to: 23
            duration: 86400000
        }

    }

    Row {
        TimeSection {
            id: h
            x: 0
            y: 0
            value: 0
        }
        TimeSection {
            id: m
            x: 100
            y: 0
            value: 0
        }
        TimeSection {
            id: s
            x: 200
            y: 0
            value: 0
        }

        Button {
            x: 0
            y: 200
            text: "Start"
            onClicked: {
                if (text == "Start") {
                    text = "Stop"
                    anim.start()
                }
                else {
                    text = "Start"
                    anim.stop()
                }
            }
        }
    }

}
```

### TimeSection.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    default property int value
    Label {
        text: parent.value
    }
}
```

### TrafficLight.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    id: light
    spacing: 20
    state: "default"

    property int counter: 0
    Component.onCompleted: anim.restart()

    SequentialAnimation {
        id: anim
        loops: Animation.Infinite
        PropertyAnimation {
            target: light
            properties: "counter"
            from: 0
            to: 9
            duration: 9000
        }
    }

    states: [
        State {
          name: "default"
        },
        State {
            name: "red"
            when: light.counter >= 0 && light.counter < 3
            PropertyChanges {
                target: red
                color: "red"
            }
        },

        State {
            name: "yellow"
            when: light.counter >= 3 && light.counter < 6
            PropertyChanges {
                target: yellow
                color: "yellow"
            }
        },

        State {
            name: "green"
            when: light.counter >= 6 && light.counter < 9
            PropertyChanges {
                target: green
                color: "green"
            }
        }

    ]

    Rectangle {
        id: red
        color: "black"
        width: 100
        height: 100
        radius: 180
    }

    Rectangle {
        id: yellow
        color: "black"
        width: 100
        height: 100
        radius: 180
    }

    Rectangle {
        id: green
        color: "black"
        width: 100
        height: 100
        radius: 180
    }
}
```

### TrafficLightPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    TrafficLight {}

}
```

## 16_sighandler

### MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int prevDepth: 2
    property int pagesPushed: 0
    property int pagesPopped: 0

    function handleStackDepthChange() {
        if (typeof pageStack === "undefined")
            return
        if (prevDepth > pageStack.depth)
            pagesPopped++;
        else if (prevDepth < pageStack.depth)
            pagesPushed++;
        console.log("Pushed pages: " + pagesPushed + ", popped pages: " + pagesPopped);
        prevDepth = pageStack.depth;
    }

    Component.onCompleted: {
        pageStack.depthChanged.connect(handleStackDepthChange);
    }

    Column {
        id: column
        anchors.fill: parent;
        width: page.width
        spacing: Theme.paddingLarge
        Button {
            text: "Pop"
            onClicked: pageStack.pop()
        }
        Button {
            text: "Push"
            onClicked: pageStack.push(Qt.resolvedUrl("MainPage.qml"))
        }
        Label {
            text: "Stack depth: " + pageStack.depth
        }
    }
}
```
