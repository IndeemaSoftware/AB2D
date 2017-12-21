TEMPLATE = app

QT += qml quick serialport
CONFIG += c++11

SOURCES += main.cpp \
    eehandler.cpp \
    Box2D/Box2D/Collision/Shapes/b2ChainShape.cpp \
    Box2D/Box2D/Collision/Shapes/b2CircleShape.cpp \
    Box2D/Box2D/Collision/Shapes/b2EdgeShape.cpp \
    Box2D/Box2D/Collision/Shapes/b2PolygonShape.cpp \
    Box2D/Box2D/Collision/b2BroadPhase.cpp \
    Box2D/Box2D/Collision/b2CollideCircle.cpp \
    Box2D/Box2D/Collision/b2CollideEdge.cpp \
    Box2D/Box2D/Collision/b2CollidePolygon.cpp \
    Box2D/Box2D/Collision/b2Collision.cpp \
    Box2D/Box2D/Collision/b2Distance.cpp \
    Box2D/Box2D/Collision/b2DynamicTree.cpp \
    Box2D/Box2D/Collision/b2TimeOfImpact.cpp \
    Box2D/Box2D/Common/b2BlockAllocator.cpp \
    Box2D/Box2D/Common/b2Draw.cpp \
    Box2D/Box2D/Common/b2Math.cpp \
    Box2D/Box2D/Common/b2Settings.cpp \
    Box2D/Box2D/Common/b2StackAllocator.cpp \
    Box2D/Box2D/Common/b2Timer.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2ChainAndCircleContact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2ChainAndPolygonContact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2CircleContact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2Contact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2ContactSolver.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2EdgeAndCircleContact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2EdgeAndPolygonContact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.cpp \
    Box2D/Box2D/Dynamics/Contacts/b2PolygonContact.cpp \
    Box2D/Box2D/Dynamics/Joints/b2DistanceJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2FrictionJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2GearJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2Joint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2MotorJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2MouseJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2PrismaticJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2PulleyJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2RevoluteJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2RopeJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2WeldJoint.cpp \
    Box2D/Box2D/Dynamics/Joints/b2WheelJoint.cpp \
    Box2D/Box2D/Dynamics/b2Body.cpp \
    Box2D/Box2D/Dynamics/b2ContactManager.cpp \
    Box2D/Box2D/Dynamics/b2Fixture.cpp \
    Box2D/Box2D/Dynamics/b2Island.cpp \
    Box2D/Box2D/Dynamics/b2World.cpp \
    Box2D/Box2D/Dynamics/b2WorldCallbacks.cpp \
    Box2D/Box2D/Rope/b2Rope.cpp \
    Box2D/box2dbody.cpp \
    Box2D/box2dcontact.cpp \
    Box2D/box2ddebugdraw.cpp \
    Box2D/box2ddistancejoint.cpp \
    Box2D/box2dfixture.cpp \
    Box2D/box2dfrictionjoint.cpp \
    Box2D/box2dgearjoint.cpp \
    Box2D/box2djoint.cpp \
    Box2D/box2dmotorjoint.cpp \
    Box2D/box2dmousejoint.cpp \
    Box2D/box2dplugin.cpp \
    Box2D/box2dprismaticjoint.cpp \
    Box2D/box2dpulleyjoint.cpp \
    Box2D/box2draycast.cpp \
    Box2D/box2drevolutejoint.cpp \
    Box2D/box2dropejoint.cpp \
    Box2D/box2dweldjoint.cpp \
    Box2D/box2dwheeljoint.cpp \
    Box2D/box2dworld.cpp

RESOURCES += qml.qrc

#LIBS += -LBox2D

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS BOX2D_SYSTEM

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    eehandler.h \
    Box2D/Box2D/Collision/Shapes/b2ChainShape.h \
    Box2D/Box2D/Collision/Shapes/b2CircleShape.h \
    Box2D/Box2D/Collision/Shapes/b2EdgeShape.h \
    Box2D/Box2D/Collision/Shapes/b2PolygonShape.h \
    Box2D/Box2D/Collision/Shapes/b2Shape.h \
    Box2D/Box2D/Collision/b2BroadPhase.h \
    Box2D/Box2D/Collision/b2Collision.h \
    Box2D/Box2D/Collision/b2Distance.h \
    Box2D/Box2D/Collision/b2DynamicTree.h \
    Box2D/Box2D/Collision/b2TimeOfImpact.h \
    Box2D/Box2D/Common/b2BlockAllocator.h \
    Box2D/Box2D/Common/b2Draw.h \
    Box2D/Box2D/Common/b2GrowableStack.h \
    Box2D/Box2D/Common/b2Math.h \
    Box2D/Box2D/Common/b2Settings.h \
    Box2D/Box2D/Common/b2StackAllocator.h \
    Box2D/Box2D/Common/b2Timer.h \
    Box2D/Box2D/Dynamics/Contacts/b2ChainAndCircleContact.h \
    Box2D/Box2D/Dynamics/Contacts/b2ChainAndPolygonContact.h \
    Box2D/Box2D/Dynamics/Contacts/b2CircleContact.h \
    Box2D/Box2D/Dynamics/Contacts/b2Contact.h \
    Box2D/Box2D/Dynamics/Contacts/b2ContactSolver.h \
    Box2D/Box2D/Dynamics/Contacts/b2EdgeAndCircleContact.h \
    Box2D/Box2D/Dynamics/Contacts/b2EdgeAndPolygonContact.h \
    Box2D/Box2D/Dynamics/Contacts/b2PolygonAndCircleContact.h \
    Box2D/Box2D/Dynamics/Contacts/b2PolygonContact.h \
    Box2D/Box2D/Dynamics/Joints/b2DistanceJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2FrictionJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2GearJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2Joint.h \
    Box2D/Box2D/Dynamics/Joints/b2MotorJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2MouseJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2PrismaticJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2PulleyJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2RevoluteJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2RopeJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2WeldJoint.h \
    Box2D/Box2D/Dynamics/Joints/b2WheelJoint.h \
    Box2D/Box2D/Dynamics/b2Body.h \
    Box2D/Box2D/Dynamics/b2ContactManager.h \
    Box2D/Box2D/Dynamics/b2Fixture.h \
    Box2D/Box2D/Dynamics/b2Island.h \
    Box2D/Box2D/Dynamics/b2TimeStep.h \
    Box2D/Box2D/Dynamics/b2World.h \
    Box2D/Box2D/Dynamics/b2WorldCallbacks.h \
    Box2D/Box2D/Rope/b2Rope.h \
    Box2D/Box2D/Box2D.h \
    Box2D/box2dbody.h \
    Box2D/box2dcontact.h \
    Box2D/box2ddebugdraw.h \
    Box2D/box2ddistancejoint.h \
    Box2D/box2dfixture.h \
    Box2D/box2dfrictionjoint.h \
    Box2D/box2dgearjoint.h \
    Box2D/box2djoint.h \
    Box2D/box2dmotorjoint.h \
    Box2D/box2dmousejoint.h \
    Box2D/box2dplugin.h \
    Box2D/box2dprismaticjoint.h \
    Box2D/box2dpulleyjoint.h \
    Box2D/box2draycast.h \
    Box2D/box2drevolutejoint.h \
    Box2D/box2dropejoint.h \
    Box2D/box2dweldjoint.h \
    Box2D/box2dwheeljoint.h \
    Box2D/box2dworld.h
