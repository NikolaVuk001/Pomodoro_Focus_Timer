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


//Main Rectangle
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







}






