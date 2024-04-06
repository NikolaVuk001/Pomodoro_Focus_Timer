import QtQuick 6.2
import QtQuick.Controls

Rectangle {
    id: menuInterval
    property alias studyTime: sldrStudy
    property alias breakTime: sldrBreak
    // width: parent.width / 4
    color: "White"
    width: 400
    height: 400
    Grid {
        id: grid
       Row {
           Column {
               Label {
                   text: "Study Time"
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
               }
               Label {
                   id: lblBreak
                   text: sldrBreak.value + " min"
                   anchors.left: sldrBreak.right
               }
           }


       }

    }

    Row {
        id: row
        y: 130
        height: 62
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        leftPadding: 39



        // MyButton {
        //     id: myButton
        //     width: 100
        //     height: 50
        //     font.pointSize: 10
        //     anchors.leftMargin: 50

        // }
    }



}
