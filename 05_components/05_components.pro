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
TARGET = 05_components

CONFIG += sailfishapp

SOURCES += src/05_components.cpp

DISTFILES += qml/05_components.qml \
    qml/cover/CoverPage.qml \
    qml/pages/Buttons.qml \
    qml/pages/DateTime.qml \
    qml/pages/MainPage.qml \
    qml/pages/Misc.qml \
    qml/pages/Sliders.qml \
    rpm/05_components.changes.in \
    rpm/05_components.changes.run.in \
    rpm/05_components.spec \
    rpm/05_components.yaml \
    translations/*.ts \
    05_components.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
