import QtQuick 2.15
import QtQuick.Controls

Button {
    property color btnColor: Material.background

    id: button
    height: 75
    width: 200
    text: qsTr("Start")
    font.pointSize: 15
    Material.background: "#f8eeb8"
    Material.accent: "#97866d"

}
