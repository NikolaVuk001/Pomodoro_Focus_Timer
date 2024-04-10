import QtQuick 2.15
import QtQuick.Controls



Button {
    width: 200
    height: 100


    background: Image {
        id: popUpImage
        source: "../../../Images/new_window_pop_up-512.webp"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit


        Behavior on scale {
            NumberAnimation {duration: 300;}
        }

    }

    onHoveredChanged: {
        if (hovered) {
            popUpImage.scale = 1.15
        } else {
            popUpImage.scale = 1.0
        }
    }
}
