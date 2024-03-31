import QtQuick 2.15
import QtQuick.Controls 2.15


Item{
    id: root
    property alias timer: timer
    property alias minutes: txtMin.text
    property alias seconds: txtSec.text
    property alias state: root.state

    states: [
        State {
            name: "StudyTime"

        },
        State {
            name: "BreakTime"
        }
    ]

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true        
        onTriggered: {
            if(txtMin.text === "00" && txtSec.text === "00")
            {
                txtMinBack.text = txtMin.text
                if(root.state === "StudyTime") {
                    txtMin.text = "05"
                    txtSec.text = "00"
                    // rotatMin.angle -= 360
                    timer.running = true;
                    root.state = "BreakTime";
                } else {
                        txtMin.text = 25
                        txtSec.text = "00"
                        rotatMin.angle -= 360
                        timer.running = false;
                    }
            }
            else {
                if(txtSec.text === "00")
                {
                    txtMinBack.text = txtMin.text
                    if(parseInt(txtMin.text) <= 10)
                    {
                        txtMin.text = "0" + (parseInt(txtMin.text) - 1)
                    }
                    else
                    {
                        txtMin.text = parseInt(txtMin.text) - 1
                    }

                    txtSec.text = "59"


                    rotatMin.angle -= 360
                }
                else {
                    if(parseInt(txtSec.text) <= 10)
                    {

                        txtSec.text = "0" + (parseInt(txtSec.text) - 1)
                    }
                    else {

                        txtSec.text = parseInt(txtSec.text) - 1
                    }
                }

            }
        }


    }
    
    



    /*-------------------------------------Sec Digit---------------------------------------------------------*/
    Flipable {

        id:flipableMin
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -500
        width: 399
        height: 250

        z: 1



        front:
            Rectangle {
            id: rectMin
            x: 100
            y: 65
            width: 400
            height: 250
            color: "#4e483a"
            radius: 7
            border.color: "#232323"
            border.width: 7

            anchors.centerIn: parent

            Text {
                id: txtMin
                x: -97
                y: -56
                color: "#f3ebbe"
                text: qsTr("25")
                anchors.fill: parent
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                font.pixelSize: 170
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                wrapMode: Text.NoWrap
                styleColor: "#000000"
                font.capitalization: Font.MixedCase
                style: Text.Sunken
                fontSizeMode: Text.Fit
                font.styleName: "Semibold"
                font.weight: Font.ExtraBold
                font.underline: false
                font.strikeout: false
                font.italic: false
                font.bold: true
            }
        }

        back: Rectangle {
            id: rectMin1
            x: 259
            y: 250
            width: 400
            height: 250
            color: rectMin.color
            radius: 7
            border.color: "#232323"
            border.width: 7
            anchors.centerIn: parent


        }

        transform: Rotation {
            id: rotatMin
            axis.x: 1; axis.y: 0; axis.z: 0;
            angle: 21600


            Behavior on angle {

                NumberAnimation {duration: 1000;}
            }
        }

    }

    Rectangle {
        id: rectMinBack
        x: flipableMin.x
        y: flipableMin.y
        z: 0
        width: 399
        height: 250
        color: rectMin.color
        radius: 7
        border.color: "#232323"
        border.width: 7


        Text {
            id: txtMinBack
            x: 51
            y: 34
            color: "#f3ebbe"
            text: qsTr("")
            anchors.fill: parent
            anchors.topMargin: 0
            font.pixelSize: 170
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            style: Text.Sunken
            font.styleName: "Semibold"
            font.strikeout: false
            font.underline: false
            font.italic: false
            font.weight: Font.ExtraBold
            font.bold: true
        }
    }




    /*-------------------------------------Sec Digit---------------------------------------------------------*/


    Rectangle {
        id: rectSec
        x: 559
        y: 56
        z: 0
        width: 399
        height: 250
        color: rectMin.color
        radius: 7
        border.color: "#232323"
        border.width: 7
        anchors.centerIn: parent

        Text {
            id: txtSec
            x: 51
            y: 34
            color: "#f3ebbe"
            text: qsTr("00")
            anchors.fill: parent
            anchors.topMargin: 0
            font.pixelSize: 170
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            style: Text.Sunken
            font.styleName: "Semibold"
            font.strikeout: false
            font.underline: false
            font.italic: false
            font.weight: Font.ExtraBold
            font.bold: true
        }
    }
}




