import QtQuick 6.2
import QtQuick.Controls


Popup {
    id: menuInterval
    property alias studyTime: sldrStudy
    property alias breakTime: sldrBreak

    width: parent.width
    height: parent.height



    background: PaddedRectangle {
        id: rect
        anchors.fill: parent
        anchors.margins: 7
        color: "#f8eeb8"
        width: parent.width
        height: parent.height
        border.color: "#c0b992"
        border.width: 7
        radius: 15
        padding: -11




        Grid {
            anchors.horizontalCenter: parent.horizontalCenter
            id: grid
            Row {
                Column {
                    Label {
                        text: "Study Time"
                        color: "#4e483a"
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 15


                    }

                    Slider {
                        id: sldrStudy
                        from: 0
                        value: focusTimer.studyTimeValue()

                        to: 60
                        stepSize: 1
                        snapMode: "SnapAlways"

                        onValueChanged: {

                            focusTimer.setStudyTime(parseInt(value.toString()));

                        }
                        onPressedChanged: {
                            if(pressed === true) {
                                focusTimer.setState("Study Time ")
                                lblTime.visible = true
                            } else {

                                lblTime.visible = false
                            }

                        }
                    }


                    Label {
                        text: "Break Time"
                        color: "#4e483a"
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 15
                    }

                    Slider {
                        id: sldrBreak
                        from: 0
                        value: focusTimer.breakTimeValue()
                        to: 30
                        stepSize: 1
                        snapMode: "SnapOnRelease"

                        onValueChanged: {
                            focusTimer.setBreakTime(parseInt(value.toString()));
                            if(pressed === true)
                            {
                                if(value >= 10)
                                    {
                                        focusTimer.setMin(value.toString());
                                    }
                                    else
                                    {
                                        focusTimer.setMin("0" + value.toString());
                                    }
                            }
                        }
                        onPressedChanged: {
                            if(pressed !== true)
                            {
                                focusTimer.setMin(sldrStudy.value.toString());
                                lblTime.visible = false

                            }
                            else
                            {
                                focusTimer.setState("Break Time ")
                                lblTime.visible = true

                            }
                        }
                    }
                }

                Column {
                    anchors.top: parent.top
                    anchors.topMargin: 28
                    spacing: 50
                    Label {
                        id: lblStudy
                        text: sldrStudy.value + " min"
                        color: "#4e483a"
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 15
                    }
                    Label {
                        id: lblBreak
                        text: sldrBreak.value + " min"
                        color: "#4e483a"
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 15
                    }
                }


            }

        }
    }










}









