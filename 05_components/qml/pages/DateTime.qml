import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        DatePicker {
            date: new Date()
            monthYearVisible: true
            onDateChanged: console.log(date)
        }
        TimePicker {
            width: page.width
            hour: 0
            minute: 0
            onTimeChanged: console.log(hour + ":" + minute)
        }
    }
}
