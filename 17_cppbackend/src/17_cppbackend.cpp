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
