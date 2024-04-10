// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Pomodor_Qt_Framework
import QtQuick.Controls
import QtQuick.Studio.Effects
import QtQuick.Layouts
import Qt.labs.platform
import QtQuick 2.0 as QtQuickModuleImportedInJS
import QtQuick.Window 2.2




import com.pomodoro.Task 1.0
import "Components/TaskList"
import "Components/LeftScreen"







Window {
    id: window
    width: Constants.width
    height: Constants.height
    visible: true
    color: "#838a59"

    SystemTrayIcon {
        id: sysTrayIcon
        visible: true
        icon.source: "Images/TimerIcon.png"

        onActivated: {
            window.show()
            window.raise()
            window.requestActivate()
        }

    }




    LeftScreen {
        id: leftScreen
    }



    TaskList{
        id: taskList

    }


}











