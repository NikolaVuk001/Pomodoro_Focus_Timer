import QtQuick 6.2
import Pomodor_Qt_Framework
import QtQuick.Controls
import QtQuick.Studio.Effects
import QtQuick.Layouts
import Qt.labs.platform
import QtQuick.Window 2.2



import "../LeftScreen/PomodoroTimer"



Window {
    id: newWindow
    width: 600
    height: 320
    color: "#838a59"

    flags: Qt.WindowStaysOnTopHint











    Button {

        width: 55
        height: 65
        x: newWindow.width - width - 7
        y: 0
        z: 2
        text: "X"
        font.pointSize: 20

        onClicked: {
            newWindow.close()
        }

    }

    PomodoroTimer {
        id:littleTimer
        // width: parent.width
        // height: parent.height
        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: 270
            // centerIn: parent
        }

        min: focusTimer.min
        sec: focusTimer.sec
        transform: Scale {origin.x: 25; origin.y: 25; xScale: 0.5; yScale: 0.5}
    }


    onClosing: {
        window.show()
    }


}




