#ifndef EEHANDLER_H
#define EEHANDLER_H

#include <QObject>
#include <QPoint>

#include "Box2D/box2dworld.h"

class QSerialPort;
class QQmlApplicationEngine ;
class Box2DBox;
class Box2DBody;

class EEHandler : public QObject
{
    Q_OBJECT
public:
    explicit EEHandler(QQmlApplicationEngine *engine, QObject *parent = 0);
    ~EEHandler();


private:
    void getDevices();
    void updateWorldGravity(QStringList);

private slots:
    void readData();
    void update(Box2DWorld *);
private:
    QSerialPort *mDevice;
    Box2DWorld *mWorld;
    Box2DBox *mTire;
};

#endif // EEHANDLER_H
