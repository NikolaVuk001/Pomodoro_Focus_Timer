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

QDate Task::date() const
{
    return m_date;
}

QJsonObject Task::toJson() const
{
    QJsonObject obj;
    obj["name"] = m_name;
    obj["finished"] = m_finished;
    obj["date"] = date().toString();
    return obj;
}

void Task::setDate(const QDate &newDate)
{
    m_date = newDate;
}
