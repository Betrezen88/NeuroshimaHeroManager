#include "Origins.h"
#include "JsonLoader.h"
#include "AttributeBonus.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

Origins::Origins(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Origin> Origins::origins()
{
    return QQmlListProperty<Origin>(this, this,
                                    &Origins::appendOrigin,
                                    &Origins::originsCount,
                                    &Origins::origin,
                                    &Origins::clearOrigins);
}

void Origins::appendOrigin(Origin *origin)
{
    m_origins.append(origin);
    emit originsChanged();
    m_originsNames.append(origin->name());
    emit originsNamesChanged();
}

int Origins::originsCount() const
{
    return m_origins.count();
}

Origin *Origins::origin(int index) const
{
    return m_origins.at(index);
}

void Origins::clearOrigins()
{
    m_origins.clear();
}

QStringList Origins::originsNames()
{
    return m_originsNames;
}

void Origins::loadOrigins(const QString &filePath)
{
    JsonLoader loader;
    for ( const QJsonValue item: loader.array(filePath) ) {
        const QJsonObject &tItem = item.toObject();
        const QJsonObject &tBonus = tItem.value("bonus").toObject();

        Origin *pOrigin = new Origin(tItem.value("name").toString(),
                                     tItem.value("description").toString(),
                                     tItem.value("image").toString(),
                                     new AttributeBonus(tBonus.value("name").toString(),
                                                        tBonus.value("value").toInt()),
                                     this);
        for(const QJsonValue feature: tItem.value("features").toArray()) {
            const QJsonObject tFeature = feature.toObject();
            FeatureBonus *pBonus = (tFeature.contains("bonus"))
                    ? createFeatureBonus(tFeature.value("bonus").toObject())
                    : new FeatureBonus();

            Feature *pFeature = new Feature(tFeature.value("name").toString(),
                                            tFeature.value("description").toString(),
                                            pBonus,
                                            pOrigin);
            pOrigin->addFeature(pFeature);
        }
        appendOrigin(pOrigin);
    }
}

FeatureBonus *Origins::createFeatureBonus(const QJsonObject &bonus)
{
    FeatureBonus *pBonus = new FeatureBonus(bonus.value("type").toString());
    if ( bonus.contains("list") ) {
        QStringList list;
        for ( const QJsonValue value: bonus.value("list").toArray() )
            list << value.toString();
        pBonus->addData("list", list);
    }
    if ( bonus.contains("value") )
        pBonus->addData("value", bonus.value("value").toInt());
    if ( bonus.contains("name") )
        pBonus->addData("name", bonus.value("name").toString());
    return pBonus;
}

void Origins::appendOrigin(QQmlListProperty<Origin> *list, Origin *origin)
{
    reinterpret_cast<Origins*>(list->data)->appendOrigin(origin);
}

int Origins::originsCount(QQmlListProperty<Origin> *list)
{
    return reinterpret_cast<Origins*>(list->data)->originsCount();
}

Origin *Origins::origin(QQmlListProperty<Origin> *list, int index)
{
    return reinterpret_cast<Origins*>(list->data)->origin(index);
}

void Origins::clearOrigins(QQmlListProperty<Origin> *list)
{
    reinterpret_cast<Origins*>(list->data)->clearOrigins();
}
