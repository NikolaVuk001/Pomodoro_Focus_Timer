import QtQuick 2.15
import QtQuick.Studio.Effects



import "../../PomodoroText"

// Outer Rectangle
Rectangle {
    property string min
    property string sec

    id: outerClock
    color: "#f9f4cc"
    radius: 50
    width: 1121
    height: 462

    layer.enabled: true
    layer.effect: DropShadowEffect {
        id: dropShadow
        radius: 39
        spread: 0.4
        samples: 77
    }


    //Inner Rectangle
    Rectangle {
        id: innerClock
        color: "#f8eeb8"
        radius: 29
        width: outerClock.width - 100
        height: outerClock.height - 100

        anchors.centerIn: parent


        layer.enabled: true
        layer.effect: DropShadowEffect {
            id: dropShadow1
            radius: 4
            spread: 0.2
            samples: 53
            verticalOffset: -4
            horizontalOffset: -1
        }

        Rectangle {
            id: wrapper
            anchors.fill: parent
            color: "Transparent"
            Rectangle {
                id: rectMinBack
                x: minDigit.x
                y: minDigit.y
                width: minDigit.width
                height: minDigit.height
                color:"#4e483a"
                radius: 7
                border.color: "#232323"
                border.width: 7

                PomodoroText {
                    id: txtBack
                    text: ""

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
            DigitComponent {
                id: minDigit
                width: parent.width * 1/2.4

                digitTxt: min

                anchors {
                    top: wrapper.top
                    bottom: wrapper.bottom
                    left: wrapper.left
                    topMargin: 52
                    bottomMargin: 52
                    leftMargin: 50
                    // centerIn: parent
                }
                txtFront.onTextChanged: {
                    if(secDigit.digitTxt === "00" &&  pomodoroControls.rowBtnDefault.visible !== true)
                    {
                            if(parseInt(min) >= 10) {
                                txtBack.text = parseInt(min) + 1
                            } else {
                                txtBack.text = "0" + (parseInt(min) + 1)
                            }
                            flippable.angle -= 360
                    }
                }

            }


        }

        DigitComponent {
            id: secDigit
            width: parent.width * 1/2.4

            digitTxt: sec

            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
                topMargin: 52
                bottomMargin: 52
                rightMargin: 50
                // centerIn: parent

            }


        }

        //Upper Circle Rectangle
        Rectangle {

            id: upperCircle
            width: 40
            height: 40
            color: "#fff5bf"
            radius: upperCircle.width
            border.color: "#232323"
            border.width: 4

            anchors {
                centerIn: parent
                verticalCenterOffset: -50
            }
        }

        //Down Circle Rectangle
        Rectangle {

            id: lowerCircle
            width: 40
            height: 40
            color: "#fff5bf"
            radius: upperCircle.width
            border.color: "#232323"
            border.width: 4

            anchors {
                centerIn: parent
                verticalCenterOffset: 50
            }
        }      

    }


}




