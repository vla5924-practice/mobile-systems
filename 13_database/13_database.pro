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
TARGET = 13_database

CONFIG += sailfishapp

SOURCES += src/13_database.cpp

DISTFILES += qml/13_database.qml \
    qml/cover/CoverPage.qml \
    qml/pages/DataAccessObject.qml \
    qml/pages/MainPage.qml \
    rpm/13_database.changes.in \
    rpm/13_database.changes.run.in \
    rpm/13_database.spec \
    rpm/13_database.yaml \
    13_database.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
