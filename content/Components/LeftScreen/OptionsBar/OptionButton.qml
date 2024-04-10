import QtQuick 2.15
import QtQuick.Controls


Rectangle {

    property string btnText: "TEST TEXT"
    property alias btn: primButton


    id: btn
    color: "#544d3c"
    border.width: 3
    radius: 15

    anchors {        
        bottom: parent.bottom
        top: parent.top
        bottomMargin: 10
        topMargin: 10
    }
    width: optionsRow.width / 4 - 10


    Button {
        id: primButton
        anchors.fill: parent
        Text {
            text: btnText
            color: "#f9f4cc"
            wrapMode: Text.Wrap
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            textFormat: Text.StyledText
            font.italic: true
            font.bold: true
            font.underline: false
            font.pointSize: 13

        }

        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
        }

        onClicked: {

        }
    }

}
