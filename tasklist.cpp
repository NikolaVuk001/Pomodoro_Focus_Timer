#include "tasklist.h"

TaskList::TaskList(QObject *parent)
    : QObject{parent}
{

    Task *t1 = new Task(this);
    t1->setName("Prvi Task Za Danas");
    m_Tasks.append(t1);

    Task *t2 = new Task(this);
    t2->setName("Drugi Task Za Danas");
    t2->setFinished(true);
    m_Tasks.append(t2);





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

