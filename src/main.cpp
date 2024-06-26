// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>


#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"
#include "content/taskmodel.h"
#include "CppClasses/focustimer.h"
#include "CppClasses/task.h"/*Nije Za Sad Potreban U Mejnu*/
#include "CppClasses/tasklist.h"

int main(int argc, char *argv[])
{
    set_qt_environment();
    QGuiApplication app(argc, argv);




    qmlRegisterType<TaskModel>("com.pomodoro.Task",1,0,"TaskModel");
    qmlRegisterUncreatableType<TaskList>("com.pomodoro.Task",1,0,"TaskList",QStringLiteral("TaskList should not be created in QML"));

    TaskList taskList(&app);
    FocusTimer m_focusTimerHandler(&app);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty(QStringLiteral("todaysTasks"), &taskList);
    engine.rootContext()->setContextProperty(QStringLiteral("focusTimer"), &m_focusTimerHandler);






    const QUrl url(u"qrc:/qt/qml/Main/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");

    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    int a = app.exec();

    taskList.~TaskList();

    return a;
}
