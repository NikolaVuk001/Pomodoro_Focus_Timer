import QtQuick 2.15
import QtQuick.Controls



Rectangle {
    property alias menuInterval: menuInterval
    property alias menuAmbiance: menuAmbiance

    id: options

    color: "transparent"

    anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
        horizontalCenterOffset: 10
    }
    height: 85
    width: parent.width

    OptionButton {
        id: btnSetInterval
        btnText: "Pomodoro Interval"
        anchors {
            bottom: parent.bottom
            top: parent.top
            left: parent.left
            bottomMargin: 10
            topMargin: 10
            leftMargin: parent.width / 4
        }
        width: parent.width / 4

        btn.onClicked: {
            if(menuInterval.visible === false) {
                menuInterval.open()
            } else {
                menuInterval.close()
            }

        }
    }

    OptionButton {
        id: btnSetNoise
        btnText: "Backround Noise"
        anchors {
            bottom: parent.bottom
            top: parent.top
            right: parent.right
            left: btnSetInterval.right
            bottomMargin: 10
            topMargin: 10
            rightMargin: parent.width / 4
            leftMargin: 10
        }
        width: parent.width / 4

        btn.onClicked: {
            if(menuAmbiance.visible === false) {
                menuAmbiance.open()
            } else {
                menuAmbiance.close()
            }

        }
    }

    Rectangle {
        id: popUpMenus
        color: "transparent"

        anchors {
            bottom: options.top
            left: btnSetInterval.left
            right: btnSetNoise.right
        }
        height: options.height * 2.5



        Rectangle {
            id: rectIntervalWrapper
            color: "transparent"

            anchors {
                left: parent.left
                bottom: parent.bottom
                top: parent.top
            }
            width: btnSetInterval.width

            MenuInterval {
                id:menuInterval

            }
        }


        Rectangle {
            id: rectNoiseWrapper
            color: "transparent"

            anchors {
                right: parent.right
                bottom: parent.bottom
                top: parent.top
            }
            width: btnSetInterval.width

            MenuAmbiance {
                id: menuAmbiance

                onVisibleChanged: {
                    {
                        if(focusTimer.state === "") {
                            if(player !== null)
                            {
                                player.stop()
                            }

                        }
                    }


                }

            }
        }


    }







}
