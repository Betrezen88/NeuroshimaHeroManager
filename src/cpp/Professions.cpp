#include "Professions.h"
#include "JsonLoader.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

Professions::Professions(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Profession> Professions::professions()
{
    return QQmlListProperty<Profession>(this, this,
                                        &Professions::appendProfession,
                                        &Professions::professionsCount,
                                        &Professions::profession,
                                        &Professions::clearProfessions);
}

void Professions::appendProfession(Profession *profession)
{
    m_professions.append(profession);
    emit professionsChanged();
    m_professionsNames.append(profession->name());
    emit professionsNamesChanged();
}

int Professions::professionsCount() const
{
    return m_professions.count();
}

Profession *Professions::profession(int index) const
{
    return m_professions.at(index);
}

void Professions::clearProfessions()
{
    m_professions.clear();
}

QStringList Professions::professionsNames()
{
    return m_professionsNames;
}

void Professions::loadProfessions(const QString &filePath)
{
    JsonLoader loader;
    for ( const QJsonValue item: loader.array(filePath) ) {
        const QJsonObject &tItem = item.toObject();

        Profession *pProfession = new Profession(tItem.value("name").toString(),
                                                 tItem.value("description").toString(),
                                                 tItem.value("quote").toString(),
                                                 tItem.value("picture").toString(),
                                                 this);
        for ( const QJsonValue feature: tItem.value("features").toArray() ) {
            const QJsonObject tFeature = feature.toObject();
            FeatureBonus *pBonus = (tFeature.contains("bonus"))
                    ? createFeatureBonus(tFeature.value("bonus").toObject())
                    : new FeatureBonus();
            Feature *pFeature = new Feature(tFeature.value("name").toString(),
                                            tFeature.value("description").toString(),
                                            pBonus,
                                            pProfession);
            pProfession->addFeature(pFeature);
        }
        appendProfession(pProfession);
    }
}

FeatureBonus *Professions::createFeatureBonus(const QJsonObject &bonus)
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

void Professions::appendProfession(QQmlListProperty<Profession> *list, Profession *profession)
{
    reinterpret_cast<Professions*>(list->data)->appendProfession(profession);
}

int Professions::professionsCount(QQmlListProperty<Profession> *list)
{
    return reinterpret_cast<Professions*>(list->data)->professionsCount();
}

Profession *Professions::profession(QQmlListProperty<Profession> *list, int index)
{
    return reinterpret_cast<Professions*>(list->data)->profession(index);
}

void Professions::clearProfessions(QQmlListProperty<Profession> *list)
{
    reinterpret_cast<Professions*>(list->data)->clearProfessions();
}
