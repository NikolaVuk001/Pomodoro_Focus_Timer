import QtQuick 2.15
import QtQuick.Studio.Effects
import QtQuick.Controls
import QtQuick.Layouts

import "../PomodoroText"
import "../PomodoroButton"


import com.pomodoro.Task 1.0


Rectangle {
    id: tasksPanel
    width: 640
    color: "transparent"

    anchors {
        right: parent.right
        top: parent.top
        bottom: parent.bottom
    }

    Rectangle {
        id: outterRectTasks
        color: "#f9f4cc"
        radius: 50
        anchors.fill: parent

        Rectangle {
            id: innerRectTasks
            color: "#f8eeb8"
            radius: 29

            anchors {
                fill: parent
                margins: 50
            }

            layer.enabled: true
            layer.effect: DropShadowEffect {
                id: dropShadow2
                radius: 4
                spread: 0.2
                samples: 53
                verticalOffset: -4
                horizontalOffset: -1
            }

            PomodoroText {
                id:lblTodaysTasks
                text: "Today's Tasks"
                font.pointSize: 34
            }

            ToolSeparator {
                id: sepLblTasks
                anchors {
                    left: parent.left
                    leftMargin: 10
                    right: parent.right
                    rightMargin: 10
                    top: lblTodaysTasks.bottom
                }
                height: 20
            }

            Rectangle {
                id: rectTasks
                color: "transparent"

                anchors {
                    left: parent.left
                    right: parent.right
                    top: sepLblTasks.bottom
                    bottom: btnClearTasks.top
                    leftMargin: 20
                    rightMargin: 20
                    topMargin: 70
                    bottomMargin: 15
                }

                ListView {                    
                    clip: true
                    anchors.fill: parent
                    model: TaskModel {
                        list: todaysTasks
                    }
                    spacing: 30

                    delegate: RowLayout {
                        width: rectTasks.width

                        CheckBox {
                            id: control
                            checked: model.finished
                            indicator: Rectangle {
                                width: 40
                                height: 40
                                x: control.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 3
                                border.color: control.down ? "#17a81a" : "#21be2b"


                                Text {
                                    width: 20
                                    height: 20
                                    x: 0
                                    y: -10
                                    text: "✔"
                                    font.pointSize: 20
                                    color: control.down ? "#17a81a" : "#21be2b"
                                    visible: control.checked
                                }
                            }
                            onClicked: model.finished = checked
                        }

                        TextField {
                            implicitWidth: 40
                            font.pointSize: 15
                            Layout.fillWidth: true
                            color: "#4e483a"
                            wrapMode: Text.Wrap
                            font.italic: true
                            font.bold: true
                            font.underline: false

                            text: model.description

                            onEditingFinished: model.description = text
                            background: Rectangle {
                                color: "white"
                                anchors.fill: parent
                                border.color: "#784e0b"
                                border.width: 1
                                radius: 15
                                opacity: 0.5

                            }
                        }
                    }
                }
            }

            PomodoroButton {
                id: btnClearTasks

                Material.background: "#731d31"


                anchors {
                    left: parent.left
                    bottom: parent.bottom
                    leftMargin: 10
                    bottomMargin: 10

                }

                width: parent.width / 1.83

                contentItem: PomodoroText {
                    color:  "#ffffff"
                    font.pointSize: 13

                    text: "Clear Finished Tasks"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: todaysTasks.removeCompletedTasks()
            }

            RoundButton {

                id: btnAdd

                width: height
                height: btnClearTasks.height
                flat: false

                Material.background: "#2d481d"


                anchors {
                    right: parent.right
                    bottom: parent.bottom
                    bottomMargin: 15
                    rightMargin: 10
                }

                contentItem: PomodoroText {
                    text: "+"
                    font.pointSize: 20
                    color: "#ffffff"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 17
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    styleColor: "#204318"
                }

                onClicked: todaysTasks.appendTask()

            }

        }
    }
}

