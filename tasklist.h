#ifndef TASKLIST_H
#define TASKLIST_H

#include <QObject>
#include <QSharedPointer>
#include <QDebug>

#include "task.h"



class TaskList : public QObject
{
    Q_OBJECT
public:
    explicit TaskList(QObject *parent = nullptr);

    bool setItemAt(int index, Task *task);

    QList<Task*> tasks() const;


signals:
    void preTaskAppended();
    void postTaskAppended();

    void preTaskRemoved(int index);
    void postTaskRemoved();



public slots:
    void appendTask();
    void removeCompletedTasks();

private:
    QList<Task*> m_Tasks;
};

#endif // TASKLIST_H
