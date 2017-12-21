import QtQuick 2.0
import Box2D 2.0
import QtSensors 5.0
import QtQuick.Window 2.2
import "../shared"

Window {
    visible: true
    id: screen

    width: 1100
    height: 768

    Image {
        width: 1100;
        height: 768
        source: "background.jpeg"
    }

    signal update(World physicsWorld)

    World {
        id: physicsWorld
        onStepped: update(physicsWorld)
    }

    Repeater {
        objectName:"tires"
        model: 1
        delegate: Object {
            x: Math.random() * (screen.width - 100);
            y: Math.random() * (screen.height / 3);
            rotation: Math.random() * 90;

            Image {
                anchors.fill: parent; source: "tire.png"
            }
        }
    }

    Repeater {
        objectName:"box"
        model: 2
        delegate: Object {
            x: Math.random() * (screen.width - 100);
            y: Math.random() * (screen.height / 3);
            rotation: Math.random() * 90;

            Image {
                anchors.fill: parent; source: "woodenbox.png"
            }
        }
    }

    Repeater {
        objectName:"suit"
        model: 1
        delegate: Object {
            width: 160
            height: 200
            x: Math.random() * (screen.width - 100);
            y: Math.random() * (screen.height / 3);
            rotation: Math.random() * 90;

            Image {
                anchors.fill: parent; source: "spacesuit.png"
            }
        }
    }

    ScreenBoundaries {}
}
