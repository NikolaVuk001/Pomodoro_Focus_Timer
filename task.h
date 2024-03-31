#ifndef TASK_H
#define TASK_H

#include <QObject>
#include <QDate>
#include <QJsonObject>

class Task : public QObject
{
    Q_OBJECT
public:
    explicit Task(QObject *parent = nullptr);

    bool finished() const;
    void setFinished(bool newFinished);

    QString name() const;
    void setName(const QString &newName);

    QDate date() const;

    QJsonObject toJson() const;

    void setDate(const QDate &newDate);

signals:

private:
    bool m_finished;
    QString m_name;
    QDate m_date;
};

#endif // TASK_H
