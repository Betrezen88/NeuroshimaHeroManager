QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    src/cpp/Attribute.h \
    src/cpp/Attributes.h \
    src/cpp/Difficulties.h \
    src/cpp/Difficulty.h \
    src/cpp/Disease.h \
    src/cpp/Diseases.h \
    src/cpp/Penalties.h \
    src/cpp/Penalty.h \
    src/cpp/Professions.h \
    src/cpp/Profession.h \
    src/cpp/AttributeBonus.h \
    src/cpp/Feature.h \
    src/cpp/FeatureBonus.h \
    src/cpp/Features.h \
    src/cpp/JsonLoader.h \
    src/cpp/Origin.h \
    src/cpp/Origins.h \
    src/cpp/Skill.h \
    src/cpp/Skillpack.h \
    src/cpp/Skillpacks.h \
    src/cpp/Skills.h \
    src/cpp/Specialization.h \
    src/cpp/Specializations.h \
    src/cpp/Symptom.h \
    src/cpp/Symptoms.h

SOURCES += \
        src/cpp/Attributes.cpp \
        src/cpp/Difficulties.cpp \
        src/cpp/Diseases.cpp \
        src/cpp/Penalties.cpp \
        src/cpp/Professions.cpp \
        src/cpp/Features.cpp \
        src/cpp/JsonLoader.cpp \
        src/cpp/Origins.cpp \
        main.cpp \
        src/cpp/Skillpacks.cpp \
        src/cpp/Skills.cpp \
        src/cpp/Specializations.cpp \
        src/cpp/Symptoms.cpp

RESOURCES += qml.qrc \
    Resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Resources/json/Origins.json \
    Resources/json/Professions.json \
    others/Scrach.txt
