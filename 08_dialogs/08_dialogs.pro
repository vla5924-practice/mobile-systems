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
TARGET = 08_dialogs

CONFIG += sailfishapp

SOURCES += src/08_dialogs.cpp

DISTFILES += qml/08_dialogs.qml \
    qml/cover/CoverPage.qml \
    qml/pages/DateDialog.qml \
    qml/pages/MainPage.qml \
    qml/pages/TextDialog.qml \
    qml/pages/TimeDialog.qml \
    rpm/08_dialogs.changes.in \
    rpm/08_dialogs.changes.run.in \
    rpm/08_dialogs.spec \
    rpm/08_dialogs.yaml \
    08_dialogs.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
