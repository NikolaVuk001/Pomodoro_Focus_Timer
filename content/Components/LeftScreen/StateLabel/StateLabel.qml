import QtQuick 2.15
import QtQuick.Controls

Label {
    id: stateLbl
    visible: false
    color: "#f9f4cc"
    text: focusTimer.state

    onTextChanged: {
        if(focusTimer.state === "Study Time")
        {
            sysTrayIcon.showMessage("Its Focus Time", "Time To Study")
        } else if (focusTimer.state === "Break Time") {
            sysTrayIcon.showMessage("Its Break Time", "Time For A Break")
        }
    }



    wrapMode: Text.Wrap
    textFormat: Text.StyledText
    font.italic: true
    font.bold: true
    font.underline: false
    font.pointSize: 55    
    onVisibleChanged: {
        if(visible === true) {
            opacityAnimation.running = true
        }
        else {
            opacityAnimationOut.running = true
        }
    }

    NumberAnimation {
        id: opacityAnimation
        target: lblTime
        property: "opacity"
        from: 0.0
        to: 1.0
        duration: 200
        easing.type: Easing.InOutQuad
        running: false
    }
    NumberAnimation {
        id: opacityAnimationOut
        target: lblTime
        property: "opacity"
        from: 1.0
        to: 0.0
        duration: 500
        easing.type: Easing.InOutQuad
        running: false
    }
}




