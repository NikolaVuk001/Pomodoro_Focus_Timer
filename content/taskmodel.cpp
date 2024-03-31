#include "taskmodel.h"
#include "../tasklist.h"
#include <QSharedPointer>
#include "../task.h"

TaskModel::TaskModel(QObject *parent)
    : QAbstractListModel(parent), m_List(nullptr)
{}

int TaskModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !m_List)
        return 0;

    return m_List->tasks().size();
}

QVariant TaskModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !m_List)
        return QVariant();

    const Task *task = m_List->tasks().at(index.row());

    qInfo() << role;
    switch(role){
    case FinishedRole:        
        return QVariant(task->finished());
    case TaskNameRole:
        return QVariant(task->name());
    }

    return QVariant();
}

bool TaskModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!m_List)
    {
        return false;
    }

    Task *task = m_List->tasks().at(index.row());
    qInfo() << task->name();
    qInfo() << value;

    switch(role){
    case FinishedRole:

        task->setFinished(value.toBool());
        break;
    case TaskNameRole:
        task->setName(value.toString());
        break;
    }

    if (m_List->setItemAt(index.row(),task)) {
        emit dataChanged(index, index, {role});
        return true;
    }
    return false;
}

Qt::ItemFlags TaskModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return QAbstractItemModel::flags(index) | Qt::ItemIsEditable;
}

QHash<int, QByteArray> TaskModel::roleNames() const
{
    QHash<int,QByteArray> names;
    names[FinishedRole] = "finished";
    names[TaskNameRole] = "description";
    qInfo() << names;
    return names;
}

TaskList *TaskModel::list() const
{
    return m_List;
}

void TaskModel::setList(TaskList *newList)
{
    beginResetModel();

    if(m_List)
    {
        m_List->disconnect(this);
    }

    m_List = newList;

    if(m_List) {
        connect(m_List,&TaskList::preTaskAppended,this,[=](){
            const int index = m_List->tasks().size();
            beginInsertRows(QModelIndex(),index,index);
        });
        connect(m_List,&TaskList::postTaskAppended,this,[=](){
            endInsertRows();
        });
        connect(m_List,&TaskList::preTaskRemoved,this,[=](int index){
            beginRemoveRows(QModelIndex(),index,index);
        });
        connect(m_List,&TaskList::postTaskRemoved,this,[=](){
            endRemoveRows();
        });
    }
    endResetModel();
}
