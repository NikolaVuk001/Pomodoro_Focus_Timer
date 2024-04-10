import QtQuick 2.15
import QtQuick.Controls



Rectangle {
    property alias rowBtnDefault: rowBtnDefault

    id: root


    anchors {
        top: timer.bottom


        topMargin: 80

        horizontalCenter: parent.horizontalCenter
    }
    color: "transparent"
    width: parent.width * 1/2



    Rectangle {
        id: rowBtnDefault
        anchors.fill: parent
        color: "transparent"
        visible: true

        ControlButton {
            id: btnStart
            height: 75
            width: 200
            text: "Start"

            anchors.centerIn: parent

            onClicked: {
                focusTimer.startTimer()
                rowBtnDefault.visible = false
                focusTimer.setState("Study Time")
                lblTime.visible = true
                optionsBar.menuInterval.studyTime.enabled = false
                optionsBar.menuInterval.breakTime.enabled = false
                btnPause.visible = true
                optionsBar.menuAmbiance.player.play()
            }
        }

    }

    Rectangle {
        id: rowBtnStarted
        anchors.fill: parent
        color: "transparent"
        visible: rowBtnDefault.visible ? false : true

        ControlButton {
            id: btnPause
            visible: true
            text: "Pause"
            height: 75
            width: 200

            anchors {
                centerIn: parent
                horizontalCenterOffset: -125
            }

            onClicked: {
                visible = false
                focusTimer.pauseTimer()                
                optionsBar.menuAmbiance.player.stop()
            }

        }
        ControlButton {
            id: btnResume
            visible: btnPause.visible ? false : true
            text: "Resume"
            height: 75
            width: 200

            anchors {
                centerIn: parent
                horizontalCenterOffset: -125
            }

            onClicked: {
                btnPause.visible = true
                focusTimer.startTimer()
                optionsBar.menuInterval.studyTime.enabled = false
                optionsBar.menuInterval.breakTime.enabled = false
                optionsBar.menuAmbiance.player.play()

            }

        }
        ControlButton {
            id: btnStop
            text: "Stop"
            height: 75
            width: 200

            anchors {
                centerIn: parent
                horizontalCenterOffset: 125
            }

            onClicked: {
                focusTimer.stopTimer()
                rowBtnDefault.visible = true

                lblTime.visible = false
                optionsBar.menuInterval.studyTime.enabled = true
                optionsBar.menuInterval.breakTime.enabled = true
                optionsBar.menuAmbiance.player.stop()
            }

        }
    }
}
