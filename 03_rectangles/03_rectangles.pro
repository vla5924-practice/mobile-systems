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
TARGET = 03_rectangles

CONFIG += sailfishapp

SOURCES += src/03_rectangles.cpp

DISTFILES += qml/03_rectangles.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/RectanglesAnimation.qml \
    qml/pages/RectanglesBasic.qml \
    qml/pages/RectanglesGrid.qml \
    qml/pages/RectanglesTable.qml \
    qml/pages/RectanglesTransform.qml \
    rpm/03_rectangles.changes.in \
    rpm/03_rectangles.changes.run.in \
    rpm/03_rectangles.spec \
    rpm/03_rectangles.yaml \
    translations/*.ts \
    03_rectangles.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/03_rectangles-de.ts
