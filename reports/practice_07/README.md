\<Здесь нужно вставить титульный лист и оглавление>

# Постановка задачи

## Цель

Научиться использовать C++ классы в QML, научиться писать собственные QML компоненты на языке C++ и использовать их в приложении.

## Шаги

1. Создать класс-счётчик с полем для хранения текущего значения и методами для увеличения значения на единицу и сброса до нуля.

   ![](media/example_counter.png)
2. Использовать мета-объект класса-счётчика для создания объекта и вызова его методов (использовать функцию main, результат изменения состояния проверять выводом на консоль).
3. Создать приложение с текстовым полем и двумя кнопками. Использовать класс-счётчик в QML: текстовое поле должно отображать текущее значение счётчика, кнопки используются для увеличения значения счётчика на единицу и сброса значения до нуля.
4. Сделать поле со значением счётчика свойством и инициализировать его каким-либо значением при создании объекта в QML.
5. Создать класс, содержащий список из строк. Класс должен содержать методы для добавления строки в список и удаления последней добавленной строки.
6. Создать приложение, позволяющее добавить введённое слово и удалить последнее добавленное с использованием данного класса в QML. Слова сохраняются в нижнем регистре.
7. Реализовать свойство только для чтения, которое позволяет получить список всех строк в виде одной, перечисленных через запятую и использовать это свойство для вывода добавленных строк на экран. Свойство должно моментально реагировать на изменение содержимого списка, первое слово начинается с заглавной буквы.

   ![](media/example_words.png)


# Руководство пользователя

1. Запустите приложение **17_cppbackend**. Отобразится страница с кнопками, нажатие на которые приведет к переходу на одноименные страницы.

   ![](media/states_main_page.png)
2. При переходе на страницу "Counter" отобразится счетчик, который можно увеличивать и сбрасыват до 0 нажатием на кнопки _Increment_ и _Reset_ соответственно.

   ![](media/counter.png)
3. При переходе на страницу "Words" отобразится интерфейс для хранения слов. Введите слово в поле и нажмите _Add_, чтобы добавить его. Добавленные слова отображаются ниже. Для удаления последнего слова нажмите _Pop_.

   ![](media/words.png)


# Руководство программиста

Для выполнения лабораторной работы были использованы следующие классы из библиотеки Qt.
**QObject** - базовый класс всех мета-объектов Qt. Наследники могут использовать следующие макросы:
* Макрос `Q_OBJECT` используется для включения возможностей мета-объектов, таких как динамические свойства, сигналы и слоты;
* Макрос `Q_PROPERTY` - макрос используется для объявления свойств в классах, наследующих QObject. Свойства ведут себя как члены данных класса, но у них есть дополнительные функции, доступные через Meta-Object System. Свойства:
  * `type`, `name` - тип и имя свойства;
  * `getMethod` - метод для считывания значения;
  * `setMethod` - метод для установки значения свойства;
  * `resetMethod` - метод для установки значения свойства по умолчанию;
  * `DESIGNABLE` - показывать ли свойство в Qt Designer (true);
  * `STORED` - сохраняется ли при сохранении состояния объекта (true);
  * `USER` - редактируется ли свойство пользователем (false).
* Макрос `Q_INVOKABLE` – макрос к объявлению метода класса, чтобы их можно было вызвать через систему мета-объектов

Для взаимодействия мета-объектов между собой используется механизм Qt на основе сигналов-слотов:
* `slots` – содержит в себе функции, которые реагируют на различные сигналы (события)
* `signals` – функции-события, срабатывание которых может вызывать слоты.

Связывание сигналов и слотов осуществляется через метод `QObject::connect()`.

Система мета-объектов:
* **QMetaObject** - класс, содержащий информацию о мета-ообъектах
* `newInstance()` – генерирует объект переданного класса и передает аргументы для его конструктора
* `invokeMethod()` - вызывает элемент (сигнал или имя слота) на объекте
* `qmlRegisterType()` - функция для регистрации типа C++ в системе QML


# Приложение

Ниже приведен искодный код страниц приложения на языке QML и классов на языке С++.

## MainPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    Column {
        spacing: 20

        Button {
            text: "Counter"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("CounterPage.qml"))
        }

        Button {
            text: "Words"
            onClicked: pageStack.animatorPush(Qt.resolvedUrl("WordsPage.qml"))
        }

    }
}
```

## CounterPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0
import cppbackend.Counter 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Counter {
        id: counter
        counter: 0
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Counter"
            }

            Label {
                text: counter.counter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 64
            }

            Button {
                text: "Increment"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: counter.increment()
            }

            Button {
                text: "Reset"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: counter.reset()
            }
        }
    }
}
```

## WordsPage.qml

```qml
import QtQuick 2.0
import Sailfish.Silica 1.0
import cppbackend.Words 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    Words {
        id: words
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Words"
            }

            TextField {
                id: text_field
                width: parent.width
                placeholderText: "Enter word..."
            }

            Button {
                text: "Add"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    words.append(text_field.text);
                    text_field.text = "";
                }
            }
            Button {
                text: "Pop"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: words.pop()
            }

            Label {
                id: label
                width: page.width
                wrapMode: "Wrap"
                text: words.list
            }
        }
    }
}
```

## 17_backend.cpp

```cpp
#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>

#include "Counter.h"
#include "Words.h"

int main(int argc, char *argv[]) {
  {
    const QMetaObject meta = Counter::staticMetaObject;
    QObject *obj = meta.newInstance();
    QObject::connect(obj, SIGNAL(countChanged()), obj, SLOT(print()));
    meta.invokeMethod(obj, "increment");
    meta.invokeMethod(obj, "increment");
    meta.invokeMethod(obj, "increment");
    meta.invokeMethod(obj, "reset");
  }
  QGuiApplication *app = SailfishApp::application(argc, argv);
  QQuickView *view = SailfishApp::createView();
  view->setSource(SailfishApp::pathTo("qml/17_cppbackend.qml"));
  qmlRegisterType<Counter>("cppbackend.Counter", 1, 0, "Counter");
  qmlRegisterType<Words>("cppbackend.Words", 1, 0, "Words");
  view->showFullScreen();
  return app->exec();
}
```

### Counter.h

```cpp
#ifndef COUNTER_H
#define COUNTER_H

#include <QDebug>
#include <QObject>

class Counter : public QObject {
  Q_OBJECT
  Q_PROPERTY(int counter READ counter WRITE setCounter NOTIFY counterChanged)

private:
  int m_counter;

public:
  Q_INVOKABLE Counter() : QObject() {
      this->m_counter = 0;
  }
  Q_INVOKABLE void increment() {
      this->m_counter++;
      emit counterChanged();
 }
  Q_INVOKABLE void reset() {
      this->m_counter = 0;
      emit counterChanged();
  }

  int counter() {
      return this->m_counter;
  }
  void setCounter(int counter) {
      this->m_counter = counter;
      emit counterChanged();
  }

public slots:
  void print() {
      qDebug() << "Current count: " << this->m_counter;
  }

signals:
  void counterChanged();
};

#endif // COUNTER_H
```

## Words.h

```cpp
#ifndef WORDS_H
#define WORDS_H

#include <QObject>
#include <QString>
#include <QStringList>

class Words : public QObject {
  Q_OBJECT
  Q_PROPERTY(QString list READ str NOTIFY listChanged)

private:
  QStringList m_list;

public:
  Words() : QObject() {
      this->m_list = QStringList();
  }

  Q_INVOKABLE void append(QString str) {
    this->m_list.append(str.toLower());
    emit listChanged();
  }

  Q_INVOKABLE void pop() {
    this->m_list.removeLast();
    emit listChanged();
  }

  QString str() {
    QString text = this->m_list.join(", ");
    return text.replace(0, 1, text[0].toUpper());
  }

signals:
  void listChanged();
};

#endif // WORDS_H
```
