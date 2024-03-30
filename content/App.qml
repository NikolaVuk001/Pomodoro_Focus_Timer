// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Pomodor_Qt_Framework
import QtQuick.Controls
import QtQuick.Studio.Effects



Window {
    id: window
    width: Constants.width
    height: Constants.height
    visible: true
    color: "#838a59"




    Rectangle{
        id: mainRow
        color: "#838a59"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 1080
        Rectangle{
            id: leftCol
            color: "transparent"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.rightMargin: 1761
            anchors.topMargin: 0
            anchors.bottomMargin: -1080

        }
        Rectangle{
            id: middleCol
            color: "transparent"            
            anchors.left: leftCol.right
            anchors.right: leftCol.left
            anchors.top: leftCol.bottom
            anchors.bottom: leftCol.top
            anchors.leftMargin: 0
            anchors.rightMargin: -1280
            anchors.topMargin: -1080
            anchors.bottomMargin: -1080


            Rectangle {
                id: outerClock
                width: 1121
                height: 462
                color: "#f9f4cc"
                radius: 50
                border.color: "#000000"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                layer.enabled: true
                layer.effect: DropShadowEffect {
                    id: dropShadow
                    radius: 39
                    spread: 0.4
                    samples: 77
                }
                anchors.verticalCenterOffset: 17
                anchors.horizontalCenterOffset: -6
                anchors.horizontalCenter: parent.horizontalCenter

                //Inner Rectangle
                Rectangle {
                    id: innerClock
                    width: outerClock.width - 100
                    height: outerClock.height - 100
                    color: "#f8eeb8"
                    radius: 29
                    border.color: "#97866d"
                    border.width: 0
                    anchors.verticalCenter: parent.verticalCenter
                    layer.enabled: true
                    layer.effect: DropShadowEffect {
                        id: dropShadow1
                        radius: 4
                        spread: 0.2
                        samples: 53
                        antialiasing: true
                        verticalOffset: -4
                        horizontalOffset: -1
                    }
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter



                    // Clock
                    FlipItem {
                        id: clockItem
                        x: 563
                        width: 400
                        height: 250
                        anchors.verticalCenter: parent.verticalCenter

                    }



                    //Upper Circle Rectangle
                    Rectangle {

                        id: upperCircle
                        y: 103
                        width: 50
                        height: 50
                        color: "#fff5bf"
                        radius: upperCircle.width
                        border.color: "#000000"
                        border.width: 4
                        anchors.top: parent.top
                        anchors.topMargin: 100
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    //Down Circle Rectangle
                    Rectangle {
                        id: downCircle
                        x: 487
                        y: 274
                        width: 50
                        height: 50
                        color: "#fff5bf"
                        radius: downCircle.width
                        border.color: "#000000"
                        border.width: 4
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 100
                        anchors.horizontalCenterOffset: -1
                        anchors.horizontalCenter: parent.horizontalCenter
                    }


                }
            }

            Row {
                id: rowButtonsDefault
                y: 885
                height: 132
                visible: true
                anchors.top: outerClock.bottom
                anchors.topMargin: 61
                anchors.horizontalCenter: outerClock.horizontalCenter
                spacing: 50



                MyButton {
                    id: btnStart
                    height: 75
                    width: 200
                    onClicked: {
                        clockItem.timer.start()
                        rowButtonsDefault.visible = false
                        rowButtonsStarted.visible = true
                    }
                }
            }

            Row {
                id: rowButtonsStarted
                y: 885
                height: 132
                visible: false
                anchors.top: outerClock.bottom
                anchors.topMargin: 61
                spacing: 50

                MyButton {
                    id: btnPause
                    text: "Pause"
                    width: 200
                    height: 75
                    onClicked: {
                        visible = false
                        btnResume.visible = true
                        clockItem.timer.stop()
                    }

                }

                MyButton {
                    id: btnResume
                    text: "Resume"
                    visible: false
                    width: 200
                    height: 75
                    onClicked: {
                        visible = false
                        btnPause.visible = true
                        clockItem.timer.start()

                    }

                }

                MyButton {
                    id: btnStop
                    text: "Stop"
                    width: 200
                    height: 75
                    onClicked: {
                        clockItem.minutes = "25"
                        clockItem.seconds = "00"
                        clockItem.timer.stop()
                        rowButtonsDefault.visible = true
                        rowButtonsStarted.visible = false

                    }
                }
                anchors.horizontalCenter: outerClock.horizontalCenter
            }

        }
        Rectangle {
            id: rightCol
            color: "transparent"
            width: 640
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: -1080



            Rectangle {
                id: outterTasks
                color: "#f9f4cc"
                radius: 50
                anchors.fill: parent
                anchors.leftMargin: 29

                Rectangle {
                    id: innerTasks
                    width: outterTasks.width - 100
                    color: "#f8eeb8"
                    radius: 29
                    border.color: "#97866d"
                    border.width: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.margins: 50
                    anchors.bottomMargin: 50
                    layer.enabled: true
                    layer.effect: DropShadowEffect {
                        id: dropShadow2
                        radius: 4
                        spread: 0.2
                        samples: 53
                        antialiasing: true
                        verticalOffset: -4
                        horizontalOffset: -1
                    }
                    anchors.verticalCenterOffset: 0

                    Label {
                        id: lblTasks
                        color: "#4e483a"
                        text: qsTr("Tasks")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 25
                        anchors.rightMargin: 14
                        anchors.topMargin: 18
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 44

                    }

                    ListView{

                    }












                }


            }
        }
    }









}








