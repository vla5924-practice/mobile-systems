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
TARGET = 12_currency

CONFIG += sailfishapp

SOURCES += src/12_currency.cpp

DISTFILES += qml/12_currency.qml \
    qml/cover/CoverPage.qml \
    qml/pages/CurrencyRate.qml \
    qml/pages/CurrencyRateAlt.qml \
    qml/pages/MainPage.qml \
    rpm/12_currency.changes.in \
    rpm/12_currency.changes.run.in \
    rpm/12_currency.spec \
    rpm/12_currency.yaml \
    12_currency.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
