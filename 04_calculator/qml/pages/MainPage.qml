import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    function getSum() {
        return parseInt(number1.text) + parseInt(number2.text);
    }

    Button {
        width: parent.width
        text: "Open calculator"
        onClicked: dialog.open()
    }

    Dialog {
        id: dialog

        function clear() {
            number1.text = "";
            number2.text = "";
        }

        Column {
            width: parent.width

            DialogHeader {}
            TextField {
                id: number1
                placeholderText: "Number 1"
                strictValidation: true
                validator: IntValidator{}
            }
            TextField {
                id: number2
                placeholderText: "Number 2"
                strictValidation: true
                validator: IntValidator{}
            }
            Button {
                text: "Sum"
                width: parent.width
                onClicked: console.log(page.getSum())
            }
        }
        onAccepted: {
            console.log(page.getSum());
            dialog.clear();
        }
        onRejected: dialog.clear()
    }
}
