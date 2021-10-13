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
TARGET = 07_stack

CONFIG += sailfishapp

SOURCES += src/07_stack.cpp

DISTFILES += qml/07_stack.qml \
    qml/cover/CoverPage.qml \
    qml/pages/StackPage.qml \
    rpm/07_stack.changes.in \
    rpm/07_stack.changes.run.in \
    rpm/07_stack.spec \
    rpm/07_stack.yaml \
    07_stack.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
