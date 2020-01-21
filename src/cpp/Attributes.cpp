#include "Attributes.h"
#include "Skillpack.h"
#include "JsonLoader.h"

#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>

Attributes::Attributes(QObject *parent) : QObject(parent)
{

}

QQmlListProperty<Attribute> Attributes::attributes()
{
    return QQmlListProperty<Attribute>(this, this,
                                       &Attributes::appendAttribute,
                                       &Attributes::attributesCount,
                                       &Attributes::attribute,
                                       &Attributes::clearAttributes);
}

void Attributes::appendAttribute(Attribute *attribute)
{
    m_attributes.append(attribute);
    emit attributesChanged();
    m_attributesNames.append(attribute->name());
    emit attributesNamesChanged();
}

int Attributes::attributesCount() const
{
    return m_attributes.count();
}

Attribute *Attributes::attribute(int index) const
{
    return m_attributes.at(index);
}

void Attributes::clearAttributes()
{
    m_attributes.clear();
    emit attributesChanged();
    m_attributesNames.clear();
    emit attributesNamesChanged();
}

QStringList Attributes::attributesNames()
{
    return m_attributesNames;
}

void Attributes::loadAttributes(const QString &filePath)
{
    JsonLoader loader;
    for ( const QJsonValue item: loader.array(filePath) ) {
        const QJsonObject &tItem = item.toObject();

        int value = tItem.contains("value")
                ? tItem.value("value").toInt()
                : 0;

        Attribute *pAttribute = new Attribute(tItem.value("name").toString(),
                                              value,
                                              this);
        if ( tItem.contains("bonus") ) {
            const QJsonObject &tBonus = tItem.value("bonus").toObject();
            AttributeBonus *pBonus = new AttributeBonus(tBonus.value("name").toString(),
                                                        tBonus.value("value").toInt(),
                                                        pAttribute);
            pAttribute->addBonus(pBonus);
        }

        for ( const QJsonValue skillpack: tItem.value("skillpacks").toArray() ) {
            const QJsonObject &tSkillpack = skillpack.toObject();
            QStringList specializations;
            for ( const QJsonValue specialization: tSkillpack.value("specializations").toArray() )
                specializations << specialization.toString();

            Skillpack *pSkillpack = new Skillpack(tSkillpack.value("name").toString(),
                                                  specializations,
                                                  pAttribute);

            for ( const QJsonValue skill: tSkillpack.value("skills").toArray() ) {
                const QJsonObject &tSkill = skill.toObject();
                int tValue = tSkill.contains("value") ? tSkill.value("value").toInt() : 0;
                Skill *pSkill = new Skill(tSkill.value("name").toString(),
                                          tValue,
                                          pSkillpack);
                pSkillpack->addSkill(pSkill);
            }
            pAttribute->addSkillpack(pSkillpack);
        }
        appendAttribute(pAttribute);
    }
}

void Attributes::appendAttribute(QQmlListProperty<Attribute> *list, Attribute *attribute)
{
    reinterpret_cast<Attributes*>(list->data)->appendAttribute(attribute);
}

int Attributes::attributesCount(QQmlListProperty<Attribute> *list)
{
    return reinterpret_cast<Attributes*>(list->data)->attributesCount();
}

Attribute *Attributes::attribute(QQmlListProperty<Attribute> *list, int index)
{
    return reinterpret_cast<Attributes*>(list->data)->attribute(index);
}

void Attributes::clearAttributes(QQmlListProperty<Attribute> *list)
{
    reinterpret_cast<Attributes*>(list->data)->clearAttributes();
}
