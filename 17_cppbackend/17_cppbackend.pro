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
TARGET = 17_cppbackend

CONFIG += sailfishapp

SOURCES += src/17_cppbackend.cpp

DISTFILES += qml/17_cppbackend.qml \
    qml/cover/CoverPage.qml \
    qml/pages/CounterPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/WordsPage.qml \
    rpm/17_cppbackend.changes.in \
    rpm/17_cppbackend.changes.run.in \
    rpm/17_cppbackend.spec \
    rpm/17_cppbackend.yaml \
    17_cppbackend.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

HEADERS += \
    src/Counter.h \
    src/Words.h
