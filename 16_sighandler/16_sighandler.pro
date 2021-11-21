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
TARGET = 16_sighandler

CONFIG += sailfishapp

SOURCES += src/16_sighandler.cpp

DISTFILES += qml/16_sighandler.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    rpm/16_sighandler.changes.in \
    rpm/16_sighandler.changes.run.in \
    rpm/16_sighandler.spec \
    rpm/16_sighandler.yaml \
    16_sighandler.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
