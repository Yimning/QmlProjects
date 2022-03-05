#include "qreadjson.h"

QReadJson::QReadJson(QObject *parent) :
    QObject(parent)
{
}


QString QReadJson::readJson(QString fileName)
{
    QString strJson;
    QFile *file=new QFile(fileName);
    if(file->exists(fileName))
    {
        if(file->open(QIODevice::ReadOnly | QIODevice::Text))
        {
            strJson = file->readAll();
            file->close();
        }
        else
        {
            strJson = "Open False!";
            qDebug() << strJson;
            return strJson;
        }
        file->close();

    }else{
        strJson = "file does not exist!";
        qDebug() << strJson;
        return strJson;
    }
    return strJson;
}

