import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Component.onCompleted: anim.restart()

    Column {
        id: light
        spacing: 20
        anchors.centerIn: page
        property int counter: 0

        SequentialAnimation {
            id: anim
            loops: Animation.Infinite
            PropertyAnimation {
                target: light
                properties: "counter"
                from: 0
                to: 9
                duration: 9000
            }
        }

        state: "default"

        states: [
            State {
              name: "default"
            },
            State {
                name: "red"
                when: light.counter >= 0 && light.counter < 3
                PropertyChanges {
                    target: red
                    color: "red"
                }
            },

            State {
                name: "yellow"
                when: light.counter >= 3 && light.counter < 6
                PropertyChanges {
                    target: yellow
                    color: "yellow"
                }
            },

            State {
                name: "green"
                when: light.counter >= 6 && light.counter < 9
                PropertyChanges {
                    target: green
                    color: "green"
                }
            }

        ]

        transitions: [
            Transition {
                from: "yellow"
                to: "green"
                PropertyAnimation {
                    target: chelovechek
                    property: "x"
                    from: -chelovechek.width
                    to: page.width
                    duration: 2900
                }
            }
        ]

        Rectangle {
            id: red
            color: "black"
            width: 100
            height: 100
            radius: 180
        }

        Rectangle {
            id: yellow
            color: "black"
            width: 100
            height: 100
            radius: 180
        }

        Rectangle {
            id: green
            color: "black"
            width: 100
            height: 100
            radius: 180
        }
    }

    Icon {
        id: chelovechek
        x: -width
        y: page.height - height
        source: "image://theme/icon-m-person"
    }

}
