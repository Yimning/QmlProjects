#ifndef QREADJSON_H
#define QREADJSON_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QDebug>
#include <QObject>
class QReadJson : public QObject
{
    Q_OBJECT
public:
    explicit QReadJson(QObject *parent = 0);
    Q_INVOKABLE QString readJson(QString fileName);
signals:
    
public slots:
    
};

#endif // QREADJSON_H
