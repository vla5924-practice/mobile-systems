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
