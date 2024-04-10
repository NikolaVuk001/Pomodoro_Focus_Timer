import QtQuick 2.15
import QtQuick.Controls

import "OptionsBar"
import "PomodoroTimer"
import "TimerControls"
import "StateLabel"
import "PopUpWindowButton"
import QtQuick 2.0 as QtQuickModuleImportedInJS



Rectangle {
    id: leftScreen
    color: "transparent"

    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
        right: taskList.left
    }

    PopUpWindowButton {
        id: newWindowBtn

        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 5
            topMargin: 50
        }

        onClicked: {
            var component = Qt.createComponent("../PopUpWindow/PopUpWindow.qml")
            if (component.status === QtQuickModuleImportedInJS.Component.Ready) {
                var newWindow = component.createObject(newWindow)
                window.hide()
                newWindow.show()
            }
        }
    }

    StateLabel {
        id: lblTime
        anchors {
            centerIn: parent
            verticalCenterOffset: -(timer.height/2) - 90
        }



    }

    PomodoroTimer {
        id: timer
        anchors.centerIn: parent

        min: focusTimer.min
        sec: focusTimer.sec
    }

    TimerControls {
        id: pomodoroControls

    }



    OptionsBar {
        id:optionsBar

    }



}
