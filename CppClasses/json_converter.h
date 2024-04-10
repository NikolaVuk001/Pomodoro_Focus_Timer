#ifndef JSON_CONVERTER_H
#define JSON_CONVERTER_H


#include <QObject>
#include <QDebug>
#include <QFile>
#include <QDir>
#include <QVariant>
#include <QVariantMap>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QMap>
#include <QScopedPointer>
#include "task.h"


class JSON_Converter
{
public:
    JSON_Converter();

    template<class T>
    static void writeJson(T obj, QString path)
    {
        // QVariantMap map;
        QJsonArray array;

        foreach(Task *t,obj)
        {
            if(t->finished() != true)
            array.append(t->toJson());
        }

        QJsonDocument document(array);
        QFile file(path);

        if(!file.open(QIODevice::WriteOnly))
        {
            qCritical() << "Could not write file!";
            qCritical() << file.errorString();
            return;
        }

        file.write(document.toJson());

        file.close();
    }

    static QJsonDocument readJson(QString path)
    {
        QFile file(path);
        if(!file.open(QIODevice::ReadOnly))
        {
            QList<Task*> emptyList;
            writeJson(emptyList,path);
            QJsonDocument emptyDoc;
            return emptyDoc;
        }

        QByteArray data = file.readAll();
        file.close();

        QJsonDocument doc = QJsonDocument::fromJson(data);

        return doc;
    }


};


#endif // JSON_CONVERTER_H
