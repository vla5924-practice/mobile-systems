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
TARGET = 09_silica

CONFIG += sailfishapp

SOURCES += src/09_silica.cpp

DISTFILES += qml/09_silica.qml \
    qml/cover/CoverPage.qml \
    qml/pages/ContextMenuDemo.qml \
    qml/pages/FlickableDemo.qml \
    qml/pages/ListViewDemo.qml \
    qml/pages/MainPage.qml \
    qml/pages/SlideshowViewDemo.qml \
    qml/pages/WebViewDemo.qml \
    rpm/09_silica.changes.in \
    rpm/09_silica.changes.run.in \
    rpm/09_silica.spec \
    rpm/09_silica.yaml \
    09_silica.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
