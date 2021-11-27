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
