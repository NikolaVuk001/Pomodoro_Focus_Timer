import QtQuick 2.15

import "../../PomodoroText"

Flipable {
    property string digitTxt
    property alias flippable: rotat
    property alias txtFront: txtFront
    property alias txtBack: txtBack



    id: digitComp
    width: parent.width * 1/2.8
    height: parent.height * 1/1.7



    z: 1

    front: Rectangle {
        id: rectFront
        visible: false
        color: "#4e483a"
        radius: 7
        border.color: "#232323"
        border.width: 7

        anchors {
            centerIn: parent
            fill: parent
        }


        PomodoroText {
            id: txtFront
            text: digitTxt

            anchors {
                centerIn: parent
                verticalCenterOffset: -10
            }

            color: "#f3ebbe"
            font.pointSize: 90
            style: Text.Sunken
            font.capitalization: Font.MixedCase
            fontSizeMode: Text.Fit
            font.styleName: "Semibold"
            font.weight: Font.ExtraBold
            font.bold: true

        }


    }





    Rectangle {
        id: rectMinBack
        x: 0
        y: 0
        z: 0
        width: rectFront.width
        height: rectFront.height
        color: rectFront.color
        radius: 7
        border.color: "#232323"
        border.width: 7


        PomodoroText {
            id: txtBack
            text: digitTxt

            anchors {
                centerIn: parent
                verticalCenterOffset: -10
            }

            color: "#f3ebbe"
            font.pointSize: 90
            style: Text.Sunken
            font.capitalization: Font.MixedCase
            fontSizeMode: Text.Fit
            font.styleName: "Semibold"
            font.weight: Font.ExtraBold
            font.bold: true

        }
    }

    transform: Rotation {
        id: rotat
        axis.x: 1; axis.y: 0; axis.z: 0;
        angle: 21600


        Behavior on angle {
            NumberAnimation {duration: 1000;}
        }
    }


}
