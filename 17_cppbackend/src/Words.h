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
