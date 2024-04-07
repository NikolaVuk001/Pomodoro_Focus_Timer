import QtQuick 6.2
import QtQuick.Controls
import QtMultimedia


Popup {

    property alias player: playAmbiance



    MediaPlayer {
        id: playAmbiance
        source: ""
        audioOutput: AudioOutput {
            id: audioOutput
            volume: sldrVolume.value
            muted: false

        }
        loops: 1000

    }





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
                        text: "Ambiance"
                        color: "#4e483a"
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 15
                    }


                    SpinBox {
                        id:ambianceSound
                        from: 0
                        to: items.length - 1
                        value: 0

                        up.indicator: Rectangle {
                            x: ambianceSound.mirrored ? 0 : parent.width - width
                            height: parent.height
                            implicitWidth: 40
                            implicitHeight: 40
                            color: "transparent"
                            anchors.right: parent.right
                            anchors.rightMargin: 0
                            anchors.topMargin: 2


                            Text {
                                text: ">"
                                font.pixelSize: ambianceSound.font.pixelSize * 2
                                color: "grey"
                                anchors.fill: parent
                                fontSizeMode: Text.Fit
                                anchors.centerIn: parent
                                leftPadding: 7
                                topPadding: 2

                            }

                        }

                        down.indicator: Rectangle {
                            x: ambianceSound.mirrored ? parent.width - width : 0
                            height: parent.height
                            implicitWidth: 40
                            implicitHeight: 40
                            color: "transparent"
                            anchors.left: parent.left
                            anchors.leftMargin: 0
                            anchors.topMargin: 2

                            Text {
                                text: "<"
                                font.pixelSize: ambianceSound.font.pixelSize * 2
                                color: "grey"
                                anchors.fill: parent
                                fontSizeMode: Text.Fit
                                anchors.centerIn: parent
                                leftPadding: 7
                                topPadding: 2

                            }

                        }

                        property var items: ["No Ambiance", "Rain", "Waves", "Lounge", "White Noise"]

                        textFromValue: function(value) {
                            return items[value];
                        }




                        valueFromText: function(text) {
                            for (var i = 0; i < items.length; ++i) {
                                if (items[i].toLowerCase().indexOf(text.toLowerCase()) === 0)
                                    return i
                            }
                            return sb.value
                        }
                        onValueChanged: {
                            switch(value) {
                            case 0:
                                playAmbiance.source = "";
                                break;
                            case 1:
                                playAmbiance.source = "Sounds/rain-02.mp3";
                                break;
                            case 2:
                                playAmbiance.source = "Sounds/ocean-waves-1.mp3";
                                break;
                            case 3:
                                playAmbiance.source = "Sounds/people-in-lounge-1.mp3";
                                break;
                            case 4:
                                playAmbiance.source = "Sounds/tv-static-05.mp3";
                                break;
                            };
                            playAmbiance.play();
                        }
                    }


                    Label {
                        text: "Volume"
                        color: "#4e483a"
                        wrapMode: Text.Wrap
                        textFormat: Text.StyledText
                        font.italic: true
                        font.bold: true
                        font.underline: false
                        font.pointSize: 15
                    }

                    Slider {
                        id: sldrVolume
                        from: 0
                        value: 0.5
                        to: 1
                        stepSize: 0.01000000
                        snapMode: "SnapAlways"
                        wheelEnabled: true
                        onValueChanged: {
                            if(!playAmbiance.playing)
                            {
                                playAmbiance.play()
                            }
                        }


                    }



                }
                Column {
                    anchors.top: parent.top
                    anchors.topMargin: 120
                    spacing: 50

                    Label {
                        id: lblBreak
                        text: Math.round(sldrVolume.value.toFixed(2)* 100) + "%"
                        anchors.leftMargin: 10
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
