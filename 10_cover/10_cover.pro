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
TARGET = 10_cover

CONFIG += sailfishapp

SOURCES += src/10_cover.cpp

DISTFILES += qml/10_cover.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    rpm/10_cover.changes.in \
    rpm/10_cover.changes.run.in \
    rpm/10_cover.spec \
    rpm/10_cover.yaml \
    10_cover.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
