#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "AttributeBonus.h"
#include "Origins.h"
#include "Origin.h"
#include "Features.h"
#include "Feature.h"
#include "FeatureBonus.h"

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
