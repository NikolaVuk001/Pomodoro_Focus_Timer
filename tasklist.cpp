#include "tasklist.h"

TaskList::TaskList(QObject *parent)
    : QObject{parent}
{
    /*On Creating A List A JSON Document Is Loaded With All The User Tasks That Are Not Finished*/
    QJsonDocument doc = JSON_Converter::readJson("UserTasks.txt");
    QJsonArray array = doc.array();
    QJsonValue val;
    for(auto jsonObj : array)
    {
        Task *t = new Task(this);
        t->setName(jsonObj.toObject().value("name").toString());
        t->setFinished(jsonObj.toObject().value("finished").toBool());
        t->setDate(QDate::fromString(jsonObj.toObject().value("date").toString()));

        m_Tasks.append(t);
    }
}

TaskList::~TaskList()
{
    /* Apon Exiting The Application Goes Thru Every Task In Task List
    That Is Finished And Saves It To JSON*/
    JSON_Converter::writeJson<QList<Task*>>(m_Tasks,"UserTasks.txt");
}

bool TaskList::setItemAt(int index, Task *task)
{
    if(index < 0 || index >= m_Tasks.size())
    {
        return false;
    }

    Task *oldTask = m_Tasks.at(index);
    if(task->finished() == oldTask->finished() && task->name() == oldTask->name())
    {
        return false;
    }
    m_Tasks[index] = task;
    return true;

}

QList<Task*> TaskList::tasks() const
{
    return m_Tasks;
}

void TaskList::appendTask()
{
    emit preTaskAppended();

    Task *task(new Task(this));
    m_Tasks.append(task);

    emit postTaskAppended();
}

void TaskList::removeCompletedTasks()
{


    // emit postTaskRemoved();

    foreach(Task *t,m_Tasks)
    {
        if(t->finished() == true)
        {

            emit preTaskRemoved(m_Tasks.indexOf(t));
            m_Tasks.removeAt(m_Tasks.indexOf(t));
            emit postTaskRemoved();
        }
    }
}

