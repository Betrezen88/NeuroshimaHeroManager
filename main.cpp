#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "src/cpp/AttributeBonus.h"
#include "src/cpp/Origins.h"
#include "src/cpp/Origin.h"
#include "src/cpp/Features.h"
#include "src/cpp/Feature.h"
#include "src/cpp/FeatureBonus.h"
#include "src/cpp/Professions.h"
#include "src/cpp/Profession.h"
#include "src/cpp/Specialization.h"
#include "src/cpp/Specializations.h"
#include "src/cpp/Disease.h"
#include "src/cpp/Diseases.h"
#include "src/cpp/Symptom.h"
#include "src/cpp/Symptoms.h"
#include "src/cpp/Penalty.h"
#include "src/cpp/Penalties.h"

#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<AttributeBonus>("neuroshima.data", 1, 0, "AttributeBonus");
    qmlRegisterType<Origins>("neuroshima.data", 1, 0, "Origins");
    qmlRegisterType<Origin>("neuroshima.data", 1, 0, "Origin");
    qmlRegisterType<Features>("neuroshima.data", 1, 0, "Features");
    qmlRegisterType<Feature>("neuroshima.data", 1, 0, "Feature");
    qmlRegisterType<FeatureBonus>("neuroshima.data", 1, 0, "FeatureBonus");
    qmlRegisterType<Professions>("neuroshima.data", 1, 0, "Professions");
    qmlRegisterType<Profession>("neuroshima.data", 1, 0, "Profession");
    qmlRegisterType<Specializations>("neuroshima.data", 1, 0, "Specializations");
    qmlRegisterType<Specialization>("neuroshima.data", 1, 0, "Specialization");
    qmlRegisterType<Diseases>("neuroshima.data", 1, 0, "Diseases");
    qmlRegisterType<Disease>("neuroshima.data", 1, 0, "Disease");
    qmlRegisterType<Symptoms>("neuroshima.data", 1, 0, "Symptoms");
    qmlRegisterType<Symptom>("neuroshima.data", 1, 0, "Symptom");
    qmlRegisterType<Penalties>("neuroshima.data", 1, 0, "Penalties");
    qmlRegisterType<Penalty>("neuroshima.data", 1, 0, "Penalty");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
