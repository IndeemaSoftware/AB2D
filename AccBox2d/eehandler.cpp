#include "eehandler.h"

#include <QtSerialPort>
#include <QSerialPortInfo>
#include <QDebug>

#include <QtQml>
#include <QQuickItem>

#include "Box2D/box2dbody.h"
#include "Box2D/box2dfixture.h"

EEHandler::EEHandler(QQmlApplicationEngine *engine, QObject *parent) : QObject(parent),
    mDevice{new QSerialPort},
    mWorld{nullptr}
{
    //get and init device
    getDevices();

    //connect device signal to read data from sensor
    connect(mDevice, SIGNAL(readyRead()), this, SLOT(readData()));

    //start reading data from sensor
    if (!mDevice->open(QIODevice::ReadWrite)) {
        qDebug() << "Sensor was not started";
        qDebug() << mDevice->error();
    }

    //getting root object from qml
    QObject *lRoot = engine->rootObjects()[0];
    // getting one object from qml. We decided to work with tire
    QQuickItem *lTire = lRoot->findChild<QQuickItem *>("tire");

    //let get tire object for manipulations
    mTire = new Box2DBox(lTire);
    //wait for signal when qml ui is updated
    connect(lRoot, SIGNAL(update(Box2DWorld *)), this, SLOT(update(Box2DWorld *)));
}

EEHandler::~EEHandler()
{
    if (mDevice) {

    }
    delete mDevice;
    delete mTire;
}

void EEHandler::getDevices()
{
    //sometimes you can remove device unsafely so it could be loced
    //let's remove locks everytime we start working with device
    if(!QProcess::startDetached("sudo rm -f /var/lock/LCK*")) {
        qDebug() << "Could not start Checker App.";
    }

    qDebug() << __FUNCTION__;
    //get all usb devices
    QList<QSerialPortInfo> lList = QSerialPortInfo::availablePorts();

    foreach (QSerialPortInfo item, lList) {
        //if our device is Arduin let's work with it
        // so remove all the other arduino devices form serial port
        if (item.manufacturer() == "Arduino LLC (www.arduino.cc)" ||
                item.manufacturer() == "Arduino LLC") {
            qDebug() << item.portName();
            mDevice->setPort(item);
            mDevice->setDataBits(QSerialPort::Data8);
            mDevice->setFlowControl(QSerialPort::NoFlowControl);
            mDevice->setParity(QSerialPort::NoParity);
            mDevice->setStopBits(QSerialPort::OneStop);
            mDevice->setBaudRate(QSerialPort::Baud115200);

            return;
        }
    }
}

void EEHandler::updateWorldGravity(QStringList data)
{
    QPointF lFirst;
    QPointF lSecond;
    double lX = 0;
    double lY = 0;
    double lSen = 10.0;


    for (QString value : data) {
        //reading only x and y axis
        if (value.contains("x: ")) {
            lX = value.mid(3, value.size() - 3).toDouble();
        }

        if (value.contains("y: ")) {
            lY = value.mid(3, value.size() - 3).toDouble();
        }

        if (lY != 0.0
                && lX != 0.0
                && mWorld != nullptr) {

            lFirst.setX((mTire->x() - lX)/lSen);
            lFirst.setY((mTire->y() - lY)/lSen);

            lSecond.setX(mTire->x());
            lSecond.setY(mTire->y());

            mWorld->setGravity(lFirst);
            lX = 0;
            lY = 0;
        }
    }
}

void EEHandler::readData()
{
    //reading data from serial port
    //it looks like 3\n12.5\n34\n15.7\n
    QString lValue = QString(mDevice->readAll());

    //create a list by spliting with \n symbol
    QStringList lData = lValue.split("\n");
    //always remove first and last to have real numbers
    if (lData.count() > 2) {
        lData.removeFirst();
        lData.removeLast();

        //use read data to update gravity value
        updateWorldGravity(lData);
    }
}

void EEHandler::update(Box2DWorld *world)
{
    //this slot is called everytime qml window is updated
    //so let's update the world
    if (mWorld == nullptr) {
        mWorld = world;
    }
}

