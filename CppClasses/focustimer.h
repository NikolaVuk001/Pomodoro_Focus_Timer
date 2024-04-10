#ifndef FOCUSTIMER_H
#define FOCUSTIMER_H

#include <QObject>
#include <QTimer>
#include <QString>
#include <QDebug>
#include <QTime>


class FocusTimer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
    Q_PROPERTY(int studyTime READ studyTime WRITE setStudyTime NOTIFY studyTimeChanged FINAL)
    Q_PROPERTY(int breakTime READ breakTime WRITE setBreakTime NOTIFY breakTimeChanged FINAL)
    Q_PROPERTY(QString state READ state WRITE setState NOTIFY stateChanged FINAL)
    Q_PROPERTY(QString min READ min WRITE setMin NOTIFY minChanged FINAL)
    Q_PROPERTY(QString sec READ sec WRITE setSec NOTIFY secChanged FINAL)
    // Q_PROPERTY(QString min READ min NOTIFY minChanged FINAL)
    // Q_PROPERTY(QString sec READ sec NOTIFY secChanged FINAL)

public:
    explicit FocusTimer(QObject *parent = nullptr);

    QString currentTime() const;


    int studyTime() const;


    int breakTime() const;




    QString state() const;


    QString min() const;


    QString sec() const;




public slots:
        void setCurrentTime(const QString &newCurrentTime);
        void setCurrentTime(const int newCurrentTime);
        void setStudyTime(int newStudyTime);
        void setBreakTime(int newBreakTime);
        void timerTimeout();
        void setState(const QString &newState);
        void startTimer();
        void stopTimer();
        void pauseTimer();
        void resetTimer();
        void setMin(const QString &newMin);
        void setSec(const QString &newSec);
        QVariant studyTimeValue();
        QVariant breakTimeValue();




signals:
        void currentTimeChanged();
        void studyTimeChanged();

        void breakTimeChanged();

        void stateChanged();



        void minChanged();

        void secChanged();

    private:
        QString m_currentTime;
        int m_studyTime;
        int m_breakTime;
        QTimer *m_timer;
        QString m_state;


        QString m_min;
        QString m_sec;
};

#endif // FOCUSTIMER_H
