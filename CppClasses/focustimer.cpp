#include "focustimer.h"

FocusTimer::FocusTimer(QObject *parent)
    : QObject{parent}
    , m_studyTime(25)
    , m_breakTime(5)
    , m_state("DefaultState")
{
    m_timer = new QTimer(this);
    m_timer->setInterval(1000);
    m_timer->setSingleShot(true);
    connect(m_timer,&QTimer::timeout,this,&FocusTimer::timerTimeout);



    setCurrentTime(m_studyTime);







}

QString FocusTimer::currentTime() const
{
    return m_currentTime;
}

void FocusTimer::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;

    setMin(m_currentTime.mid(0,2));
    setSec(m_currentTime.mid(3,2));



    emit currentTimeChanged();
}
void FocusTimer::setCurrentTime(const int newCurrentTime)
{

    if(newCurrentTime >= 10)
    {        
        setCurrentTime(QString::number(newCurrentTime) + ":00");
    }
    else
    {        
        setCurrentTime("0" + QString::number(newCurrentTime) + ":00");
    }    
    emit currentTimeChanged();    
}



int FocusTimer::studyTime() const
{
    return m_studyTime;
}

void FocusTimer::setStudyTime(int newStudyTime)
{
    if (m_studyTime == newStudyTime)
        return;
    m_studyTime = newStudyTime;
    setCurrentTime(m_studyTime);
    emit studyTimeChanged();    
}

int FocusTimer::breakTime() const
{
    return m_breakTime;
}

QVariant FocusTimer::studyTimeValue()
{
    return QVariant(m_studyTime);
}

QVariant FocusTimer::breakTimeValue()
{
    return QVariant(m_breakTime);
}

void FocusTimer::setBreakTime(int newBreakTime)
{
    if (m_breakTime == newBreakTime)
        return;
    m_breakTime = newBreakTime;

    emit breakTimeChanged();
}

void FocusTimer::timerTimeout()
{
    QTime currentTime;


    if (m_min.toInt() < 60)
    {
        currentTime = QTime::fromString(m_currentTime,"mm:ss");
    }
    else
    {
        QString tempTime = "01:00:00";
        currentTime = QTime::fromString(tempTime,"hh:mm:ss");
    }

    if(currentTime != QTime::fromString("00:00"))
    {
        currentTime = currentTime.addSecs(-1);
        setCurrentTime(currentTime.toString("mm:ss"));
        setMin(m_currentTime.mid(0,2));
        setSec(m_currentTime.mid(3,2));
        m_timer->start();
    }

    else if(m_state != "Break Time")
    {
        setCurrentTime(m_breakTime);
        setState("Break Time");
        m_timer->start();
    }
    else
    {
        setCurrentTime(m_studyTime);
        setState("Study Time");
        m_timer->start();
    }

    // qInfo() << m_currentTime;
    // qInfo() << m_state;


}



QString FocusTimer::state() const
{
    if(m_state == "DefaultState")
    {
        return "";
    }
    return m_state;
}

void FocusTimer::setState(const QString &newState)
{
    if (m_state == newState)
        return;
    m_state = newState;
    emit stateChanged();
}

void FocusTimer::startTimer()
{
    // qInfo() << "Starting";
    // if(m_state == "DefaultState"  || m_state == "BreakState")
    // {
    //     setState("StudyState");

    // }
    m_timer->start();
}

void FocusTimer::stopTimer()
{
    m_timer->stop();
    resetTimer();
}

void FocusTimer::pauseTimer()
{
    m_timer->stop();
}

void FocusTimer::resetTimer()
{
    setCurrentTime(m_studyTime);
    setState("DefaultState");
    setMin(m_currentTime.mid(0,2));
    setSec(m_currentTime.mid(3,2));
}




QString FocusTimer::sec() const
{
    return m_sec;
}

QString FocusTimer::min() const
{
    return m_min;
}

void FocusTimer::setMin(const QString &newMin)
{
    if (m_min == newMin)
        return;
    m_min = newMin;
    emit minChanged();
}



void FocusTimer::setSec(const QString &newSec)
{
    if (m_sec == newSec)
        return;
    m_sec = newSec;
    emit secChanged();
}
