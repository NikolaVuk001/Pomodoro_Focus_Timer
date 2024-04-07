import QtQuick 6.2
import QtQuick.Controls

Popup {
    id: menuInterval
    property alias studyTime: sldrStudy
    property alias breakTime: sldrBreak



    background: PaddedRectangle {
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
                       value: 25
                       to: 120
                       stepSize: 1
                       snapMode: "SnapAlways"

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
                       from: 1
                       value: 5
                       to: 120
                       stepSize: 1
                       snapMode: "SnapAlways"
                   }



               }
               Column {
                   anchors.top: parent.top
                   anchors.topMargin: 28
                   spacing: 50
                   Label {
                       id: lblStudy
                       text: sldrStudy.value + " min"
                       anchors.left: sldrStudy.right
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
                       anchors.left: sldrBreak.right
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








