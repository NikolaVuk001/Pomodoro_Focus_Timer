#include "task.h"

Task::Task(QObject *parent)
    : QObject{parent}
{    
    this->m_finished = false;
    this->m_date = QDate::currentDate();
}

bool Task::finished() const
{
    return m_finished;
}

void Task::setFinished(bool newFinished)
{
    m_finished = newFinished;
}

QString Task::name() const
{
    return m_name;
}

void Task::setName(const QString &newName)
{
    m_name = newName;
}
