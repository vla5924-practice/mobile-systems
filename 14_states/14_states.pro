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
TARGET = 14_states

CONFIG += sailfishapp

SOURCES += src/14_states.cpp

DISTFILES += qml/14_states.qml \
    qml/cover/CoverPage.qml \
    qml/pages/AnimatedText.qml \
    qml/pages/MainPage.qml \
    qml/pages/TrafficLight.qml \
    rpm/14_states.changes.in \
    rpm/14_states.changes.run.in \
    rpm/14_states.spec \
    rpm/14_states.yaml \
    14_states.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
