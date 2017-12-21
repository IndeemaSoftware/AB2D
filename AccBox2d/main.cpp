#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "eehandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/acc/main.qml")));

    EEHandler lHanlder(&engine);

    return app.exec();
}
