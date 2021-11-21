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
TARGET = 15_custom

CONFIG += sailfishapp

SOURCES += src/15_custom.cpp

DISTFILES += qml/15_custom.qml \
    qml/cover/CoverPage.qml \
    qml/pages/CustomButton.qml \
    qml/pages/CustomButtonPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/StopwatchPage.qml \
    qml/pages/TimeSection.qml \
    qml/pages/TrafficLight.qml \
    qml/pages/TrafficLightPage.qml \
    rpm/15_custom.changes.in \
    rpm/15_custom.changes.run.in \
    rpm/15_custom.spec \
    rpm/15_custom.yaml \
    15_custom.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
