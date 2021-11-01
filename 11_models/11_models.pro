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
TARGET = 11_models

CONFIG += sailfishapp

SOURCES += src/11_models.cpp

DISTFILES += qml/11_models.qml \
    qml/cover/CoverPage.qml \
    qml/pages/ColoredRectangles.qml \
    qml/pages/ColoredRectanglesAlt.qml \
    qml/pages/MainPage.qml \
    qml/pages/RectanglesList.qml \
    rpm/11_models.changes.in \
    rpm/11_models.changes.run.in \
    rpm/11_models.spec \
    rpm/11_models.yaml \
    11_models.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
