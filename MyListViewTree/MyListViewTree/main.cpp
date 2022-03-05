#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QFile>
#include <QtQml>//for qmlRegisterType
#include <QQmlEngine>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qreadjson//qreadjson.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QtQuick2ApplicationViewer viewer;

    qmlRegisterType<QReadJson>("QReadJson.module",1,0, "QReadJsonLib");

    viewer.setMainQmlFile(QStringLiteral("qml/MyListViewTree/main.qml"));
    viewer.showExpanded();
    return app.exec();
}
