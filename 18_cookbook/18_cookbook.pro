# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = 18_cookbook

QT += sql

CONFIG += sailfishapp

SOURCES += src/18_cookbook.cpp \
    src/database.cpp

DISTFILES += qml/18_cookbook.qml \
    qml/cover/CoverPage.qml \
    qml/pages/Categories.qml \
    qml/pages/Ingredients.qml \
    qml/pages/Main.qml \
    qml/pages/Recipe.qml \
    qml/pages/Recipes.qml \
    qml/pages/Search.qml \
    qml/pages/Settings.qml \
    rpm/18_cookbook.changes.in \
    rpm/18_cookbook.changes.run.in \
    rpm/18_cookbook.spec \
    rpm/18_cookbook.yaml \
    18_cookbook.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

HEADERS += \
    include/database.hpp

INCLUDEPATH += include
